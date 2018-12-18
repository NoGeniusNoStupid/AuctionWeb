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

        //新闻动态
        public ActionResult DongTai()
        {
            //分页设置
            int pageIndex = Request.QueryString["pageIndex"] != null ? int.Parse(Request.QueryString["pageIndex"]) : 1;
            int pageSize = 5;//页面记录数
            List<News> mlist = new List<News>();

            mlist = DB.News.Where(a => true).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<News>();
           
            int listCount = DB.News.Where(a => true).Count();
            //生成导航条
            string strBar = ManagePageBar.GetPageBar(pageIndex, listCount, pageSize);
            ViewData["List"] = mlist;
            ViewData["PageBar"] = strBar;

            return View();
        }
        //新闻详细信息
        public ActionResult NewInfo(int id)
        {
            var news = DB.News.FirstOrDefault(a => a.Id == id);
            //增加点击量
            news.ClickNum += 1;
            DB.Entry(news).State = EntityState.Modified;
            DB.SaveChanges();
            return View(news);
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
