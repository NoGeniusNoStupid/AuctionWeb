using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers.FrontPage
{
    public class FrontBaseController : Controller
    {
        //
        // GET: /FrontBase/

        public ActionResult Index()
        {
            return View();
        }

    }
}
