using AuctionWeb.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers.AdminPage
{
    public class AdminController : BaseController
    {
       

        public ActionResult Index()
        {
            return View();
        }

    }
}
