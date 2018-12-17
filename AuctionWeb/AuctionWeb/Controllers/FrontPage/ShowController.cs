using AuctionWeb.Models;
using AuctionWeb.Publcie;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers
{
    public class ShowController : FrontController
    {
        //展示商品信息
        public ActionResult ProInfo(int id)
        {
            //初始化物品状态
            GoodsInfoHelp.GoodsInfoInit();
            var GoodsInfo = DB.GoodsInfo.FirstOrDefault(a => a.Id == id);
            //保证金
            int purId = Convert.ToInt32(Session["PurId"]);
            var CreditRecord = DB.CreditRecord.FirstOrDefault(a => a.GoodsId == id && a.PurchaserId == purId);
            if (CreditRecord == null)
                ViewData["CreditRecord"] = "否";
            else
                ViewData["CreditRecord"] = "是";

            return View(GoodsInfo);
        }    

        //我要竞拍
        public ActionResult Aution(int id)
        {
            int purId = Convert.ToInt32(Session["PurId"]);

            var GoodsInfo = DB.GoodsInfo.FirstOrDefault(a => a.Id == id);//货物记录

            if (GoodsInfo.AuctionDetails == null || GoodsInfo.AuctionDetails.Count <= 0)
            {
                AddAuctionDetail(purId, GoodsInfo);
            }
            else
            {
                //判断最近的一个是不是自己 
                var AuctionDetails =  GoodsInfo.AuctionDetails.OrderByDescending(a => a.AddTime).FirstOrDefault();
                if (AuctionDetails.PurchaserId == purId)
                {
                    return RedirectDialogToAction("ProInfo", "Show", "你已经是当前最高竞价者，无需竞拍！", -1, new { id = id });
                }
                else
                {
                    AddAuctionDetail(purId, GoodsInfo);
                }         
            }
            //添加竞拍记录
            return RedirectToAction("ProInfo", new { id = id });
        }

        //竞拍记录
        public ActionResult AutionDetail(int id)
        {
            //展示竞拍记录
            int pageIndex = Request.QueryString["pageIndex"] != null ? int.Parse(Request.QueryString["pageIndex"]) : 1;
            int pageSize = 5;//页面记录数
            List<AuctionDetails> mlist = new List<AuctionDetails>();
            //查询记录

            mlist = DB.AuctionDetails.Where(a => a.GoodsId == id).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<AuctionDetails>();

            int listCount = DB.AuctionDetails.Where(a => a.GoodsId == id).Count();
            //生成导航条
            string strBar = ManagePageBar.GetPageBar(pageIndex, listCount, pageSize);

            ViewData["List"] = mlist;
            ViewData["PageBar"] = strBar;

            return View();
        }

      

        //添加竞拍信息
        private void AddAuctionDetail(int purId, Models.GoodsInfo GoodsInfo)
        {
            AuctionDetails auctionDetails = new AuctionDetails();
            auctionDetails.GoodsId = GoodsInfo.Id;
            auctionDetails.PurchaserId = purId;
            auctionDetails.TempPrice = (Convert.ToDouble(GoodsInfo.CurrentPrice) + Convert.ToDouble(GoodsInfo.PriceLevel)).ToString();
            auctionDetails.AddTime = DateTime.Now;
            DB.AuctionDetails.Add(auctionDetails);


            //更新货物记录
            GoodsInfo.CountDownTime = DateTime.Now.AddMinutes(Convert.ToDouble(GoodsInfo.CountDown));
            GoodsInfo.CurrentPrice = auctionDetails.TempPrice;
            DB.Entry(GoodsInfo).State = EntityState.Modified;

            DB.SaveChanges();
        }

        #region 缴纳保证金
        public ActionResult CreditPrice(int id)
        {
            var GoodsInfo = DB.GoodsInfo.FirstOrDefault(a => a.Id == id);

            return View(GoodsInfo);
        }
        //缴纳保证金
        public ActionResult PostCreditPrice(int id, string payType)
        {
            int purId = Convert.ToInt32(Session["PurId"]);
            var GoodsInfo = DB.GoodsInfo.FirstOrDefault(a => a.Id == id);
            CreditRecord creditRecord = new CreditRecord();
            creditRecord.PurchaserId = purId;
            creditRecord.GoodsId = GoodsInfo.Id;
            creditRecord.CreditPrice = (Convert.ToDouble(GoodsInfo.BeginPrice) * 0.2).ToString();
            creditRecord.AddTime = DateTime.Now;
            creditRecord.Status = "缴纳";
            creditRecord.PayType = payType;
            DB.CreditRecord.Add(creditRecord);
            DB.SaveChanges();
            return RedirectToAction("ProInfo", new { id = id });
        }
        #endregion
    }
}
