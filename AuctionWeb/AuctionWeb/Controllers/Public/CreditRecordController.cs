using AuctionWeb.Models;
using AuctionWeb.Publcie;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers.Public
{
    //押金缴纳记录
    public class CreditRecordController : BaseController
    {
        //权限控制
        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            base.OnActionExecuted(filterContext);
            if (Session["Role"] == null)
            {
                string msg = "请先登录，再进行操作！";
                filterContext.Result = RedirectDialogToAction("Login", "Login", msg);
            }
        }
        //押金记录
        public ActionResult Manage(string search, string EvaluateType)
        {
            //初始化物品状态
            GoodsInfoHelp.GoodsInfoInit();

            //分页设置
            int pageIndex = Request.QueryString["pageIndex"] != null ? int.Parse(Request.QueryString["pageIndex"]) : 1;
            int pageSize = 5;//页面记录数
            List<CreditRecord> mlist = new List<CreditRecord>();
            int listCount = 0;
            if (Session["AdminId"] == null)
            {
                //个人用户
                int purId = Convert.ToInt32(Session["PurId"]);

                mlist = DB.CreditRecord.Where(a => a.PurchaserId == purId).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<CreditRecord>();
                listCount = DB.CreditRecord.Where(a => a.PurchaserId == purId).Count();
            }
            else
            {
                //管理员
                mlist = DB.CreditRecord.Where(a => true).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<CreditRecord>();
                listCount = DB.CreditRecord.Where(a => true).Count();
            }
            //生成导航条
            string strBar = ManagePageBar.GetPageBar(pageIndex, listCount, pageSize);
            ViewData["List"] = mlist;
            ViewData["PageBar"] = strBar;

            return View();
        }
    }
}
