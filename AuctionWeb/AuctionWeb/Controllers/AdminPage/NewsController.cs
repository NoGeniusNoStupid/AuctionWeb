using AuctionWeb.Models;
using AuctionWeb.Publcie;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers.AdminPage
{
    public class NewsController : PowerController
    {
        //添加
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(News news)
        {
            news.ClickNum = 0;
            news.AddTime = DateTime.Now;
            DB.News.Add(news);
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }
        //管理
        public ActionResult Manage(string search)
        {
            //分页设置
            int pageIndex = Request.QueryString["pageIndex"] != null ? int.Parse(Request.QueryString["pageIndex"]) : 1;
            int pageSize = 5;//页面记录数
            List<News> mlist = new List<News>();

            //查询记录
            if (string.IsNullOrEmpty(search))
            {
                mlist = DB.News.Where(a => true).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<News>();
            }
            else
            {
                mlist = DB.News.Where(a => a.Title.Contains(search)).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<News>();
            }
            int listCount = DB.News.Where(a => true).Count();
            //生成导航条
            string strBar = ManagePageBar.GetPageBar(pageIndex, listCount, pageSize);
            ViewData["List"] = mlist;
            ViewData["PageBar"] = strBar;

            return View();
        }
        //编辑
        public ActionResult Edit(int id)
        {
            var news = DB.News.FirstOrDefault(a => a.Id == id);
            return View(news);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(News news)
        {
            DB.Entry(news).State = EntityState.Modified;
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }
        //删除
        public ActionResult Delete(int id)
        {
            var news = DB.News.FirstOrDefault(a => a.Id == id);
            DB.Entry(news).State = EntityState.Deleted;
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }
    }
}
