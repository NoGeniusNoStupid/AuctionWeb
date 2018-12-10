using AuctionWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers.AdminPage
{
    public class GoodsInfoController : AdminBaseController
    {
        //
        // GET: /GoodsInfo/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(GoodsInfo goodsInfo)
        {

            return View();
        }

    }
}
