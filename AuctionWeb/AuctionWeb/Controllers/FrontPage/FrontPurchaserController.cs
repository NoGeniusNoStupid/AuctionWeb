using AuctionWeb.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers.FrontPage
{
    public class FrontPurchaserController : FrontPowerController
    {

        public ActionResult Edit(int id)
        {
            var Info = DB.Purchaser.FirstOrDefault(a => a.Id == id);

            return View(Info);
        }
        [HttpPost]
        public ActionResult Edit(Purchaser Info)
        {
            DB.Entry(Info).State = EntityState.Modified;
            DB.SaveChanges();
            return RedirectToAction("Index","Admin");
        }


        //密码修改
        public ActionResult UpdatePwd(int id)
        {
            var Info = DB.Purchaser.FirstOrDefault(a => a.Id == id);
            return View(Info);
        }
        [HttpPost]
        public ActionResult UpdatePwd(int id, string Pwd)
        {
            var Info = DB.Purchaser.FirstOrDefault(a => a.Id == id);
            Info.Password = Pwd;
            DB.Entry(Info).State = EntityState.Modified;
            DB.SaveChanges();
            return RedirectToAction("Index", "Admin");
        }

    }
}
