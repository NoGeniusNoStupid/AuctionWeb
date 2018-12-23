using AuctionWeb.Controllers;
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
    public class AdminController : BaseController
    {
        //系统首页
        public ActionResult Index()
        {
           
            if (Session["Role"] == null)
            {
                string msg = "请先登录，再进行操作！";
                return  RedirectDialogToAction("Login", "Login", msg);
            }
            if (Session["AdminId"]==null)
            {
                int purId = Convert.ToInt32(Session["PurId"]);
                ViewData["GoodsInfo"] = DB.GoodsInfo.Where(a => a.PurchaserId == purId).Count();
                ViewData["OrderInfo"] = DB.OrderInfo.Where(a => a.PurchaserId == purId).Count();
            }
            else
            {
               ViewData["Purchaser"] = DB.Purchaser.Where(a => true).Count();
               ViewData["GoodsInfo"] = DB.GoodsInfo.Where(a => true).Count();
               ViewData["OrderInfo"] = DB.OrderInfo.Where(a => true).Count();
            }


            return View();
        }

        //添加
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(Administrators Info)
        {
            Info.AddTime = DateTime.Now;
            DB.Administrators.Add(Info);
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }


        public ActionResult Manage(string search)
        {
            //分页设置
            int pageIndex = Request.QueryString["pageIndex"] != null ? int.Parse(Request.QueryString["pageIndex"]) : 1;
            int pageSize = 5;//页面记录数
            List<Administrators> mlist = new List<Administrators>();
            mlist = DB.Administrators.Where(a => true).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<Administrators>();
            int listCount = DB.Administrators.Where(a => true).Count();
            //生成导航条
            string strBar = ManagePageBar.GetPageBar(pageIndex, listCount, pageSize);
            ViewData["List"] = mlist;
            ViewData["PageBar"] = strBar;

            return View();
        }
        //密码修改
        public ActionResult UpdatePwd(int id)
        {
            var Info = DB.Administrators.FirstOrDefault(a => a.Id == id);
           
            return View(Info);
        }
        //密码修改
        [HttpPost]
        public ActionResult UpdatePwd(int id, string AdminPwd)
        {
            var Info = DB.Administrators.FirstOrDefault(a => a.Id == id);
            Info.AdminPwd = AdminPwd;
            DB.Entry(Info).State = EntityState.Modified;
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }

        //删除
        public ActionResult Delete(int id)
        {
            var Info = DB.Administrators.FirstOrDefault(a => a.Id == id);
            DB.Entry(Info).State = EntityState.Deleted;
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }
    }
}
