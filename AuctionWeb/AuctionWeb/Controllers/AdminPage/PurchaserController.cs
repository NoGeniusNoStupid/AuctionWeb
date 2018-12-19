using AuctionWeb.Models;
using AuctionWeb.Publcie;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers.AdminPage
{
    public class PurchaserController : PowerController
    {
        //
        // GET: /Purchaser/

        public ActionResult Manage(string search)
        {
            //分页设置
            int pageIndex = Request.QueryString["pageIndex"] != null ? int.Parse(Request.QueryString["pageIndex"]) : 1;
            int pageSize = 5;//页面记录数
            List<Purchaser> mlist = new List<Purchaser>();
            //查询记录
            if (string.IsNullOrEmpty(search))
            {
                mlist = DB.Purchaser.Where(a => true).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<Purchaser>();
            }
            else
            {
                mlist = DB.Purchaser.Where(a => a.Username.Contains(search)).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<Purchaser>();
            }
            int listCount = DB.Purchaser.Where(a => true).Count();
            //生成导航条
            string strBar = ManagePageBar.GetPageBar(pageIndex, listCount, pageSize);

            ViewData["List"] = mlist;
            ViewData["PageBar"] = strBar;

            return View();
        }
        //加入黑名单
        public ActionResult Blacklist(int id)
        {
            var Info = DB.Purchaser.FirstOrDefault(a => a.Id == id);
            if (Info.State == "黑名单")
                Info.State = "正常";
            else
                Info.State = "黑名单";
            DB.Entry(Info).State = System.Data.EntityState.Modified;
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }
        //删除
        public ActionResult Delete(int id)
        {
            var Info = DB.Purchaser.FirstOrDefault(a => a.Id == id);
            DB.Entry(Info).State = System.Data.EntityState.Deleted;
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }


      
    }
}
