using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers
{
    public class PowerController : BaseController
    {
        //权限控制
        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            if (Session["AdminId"] == null)
            {
                string msg = "请先登录，再进行操作！";
                filterContext.Result = RedirectDialogToAction("Login", "AdminLogin", msg);
            }
        }
    }
}
