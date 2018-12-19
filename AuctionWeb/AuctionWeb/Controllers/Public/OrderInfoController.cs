﻿using AuctionWeb.Models;
using AuctionWeb.Publcie;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers.AdminPage
{
    public class OrderInfoController : BaseController
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

        public ActionResult Manage(string search)
        {
            //分页设置
            int pageIndex = Request.QueryString["pageIndex"] != null ? int.Parse(Request.QueryString["pageIndex"]) : 1;
            int pageSize = 5;//页面记录数
            List<OrderInfo> mlist = new List<OrderInfo>();
            int listCount = 0;
            if (Session["AdminId"] == null)
            {
                //个人用户
                int purId = Convert.ToInt32(Session["PurId"]);
                if (string.IsNullOrEmpty(search))
                {
                    mlist = DB.OrderInfo.Where(a => a.PurchaserId == purId).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<OrderInfo>();
                }
                else
                {
                    mlist = DB.OrderInfo.Where(a => a.PurchaserId == purId&&(a.Purchaser.Username.Contains(search) || a.Purchaser.TrueName.Contains(search) || a.GoodsInfo.GoodsName.Contains(search))).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<OrderInfo>();
                }
                listCount = DB.OrderInfo.Where(a => a.PurchaserId == purId).Count();
            }
            else
            {
                //管理员
                if (string.IsNullOrEmpty(search))
                {
                    mlist = DB.OrderInfo.Where(a => true).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<OrderInfo>();
                }
                else
                {
                    mlist = DB.OrderInfo.Where(a => a.Purchaser.Username.Contains(search) || a.Purchaser.TrueName.Contains(search) || a.GoodsInfo.GoodsName.Contains(search)).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<OrderInfo>();
                }
                listCount = DB.OrderInfo.Where(a => true).Count();
            }
            //生成导航条
            string strBar = ManagePageBar.GetPageBar(pageIndex, listCount, pageSize);
            ViewData["List"] = mlist;
            ViewData["PageBar"] = strBar;

            return View();
        }
        //支付
        public ActionResult Pay(int id)
        {

            var Info = DB.OrderInfo.FirstOrDefault(a => a.Id == id);

            return View(Info);
        }
        //支付
        [HttpPost]
        public ActionResult Pay(OrderInfo Info)
        {
            Info.State = "付款成功";
            DB.Entry(Info).State = System.Data.EntityState.Modified;
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }

        //删除
        public ActionResult Delete(int id)
        {
            var Info = DB.OrderInfo.FirstOrDefault(a => a.Id == id);
            DB.Entry(Info).State = System.Data.EntityState.Deleted;
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }

    }
}
