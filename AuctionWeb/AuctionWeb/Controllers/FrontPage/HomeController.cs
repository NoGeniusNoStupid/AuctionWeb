using AuctionWeb.Models;
using AuctionWeb.Publcie;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers
{
    public class HomeController : BaseController
    {
     
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult About()
        {
            return View();
        }
        //在线竞拍
        public ActionResult Show()
        {
            //初始化物品状态
            GoodsInfoHelp.GoodsInfoInit();
            //分页设置
            int pageIndex = Request.QueryString["pageIndex"] != null ? int.Parse(Request.QueryString["pageIndex"]) : 1;
            int pageSize = 5;//页面记录数
            List<GoodsInfo> mlist = new List<GoodsInfo>();
            mlist = DB.GoodsInfo.Where(a => true).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<GoodsInfo>();     
            int listCount = DB.GoodsInfo.Where(a => true).Count();
            //生成导航条
            string strBar = ManagePageBar.GetPageBar(pageIndex, listCount, pageSize);

            ViewData["List"] = mlist;
            ViewData["PageBar"] = strBar;

            return View();
        }
        public ActionResult DongTai()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult Message()
        {
            return View();
        }


    }
}
