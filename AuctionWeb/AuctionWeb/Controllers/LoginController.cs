using AuctionWeb.Models;
using AuctionWeb.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers
{
    public class LoginController : BaseController
    {
        #region 前台登陆
        //
        // GET: /Login/
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string Username, string Password,string VerificationCode)
        {
           if( Session["validateCode"].ToString()!=VerificationCode)
           {
               return RedirectDialogToAction("验证码错误，请重新输入！", true);
           }
           var purchaser = DB.Purchaser.FirstOrDefault(a => a.Username == Username && a.Password == Password);
           if (purchaser == null)
           {
               return RedirectDialogToAction("用户名或密码错误，请重新输入！", true);
           }
           else
           {
               Session["PurId"] = purchaser.Id;
               Session["Role"] = "用户";
               return RedirectToAction("Index", "Home");
           }
        }
        //退出
        public ActionResult Out()
        {
            Session["PurId"] = null;
            return RedirectToAction("Index", "Home");
        }
        //获取验证码
        public ActionResult ShowValidateCode()
        {
            ValidateCode vliateCode = new ValidateCode();
            string code = vliateCode.CreateValidateCode(4);//产生验证码
            Session["validateCode"] = code;
            byte[] buffer = vliateCode.CreateValidateGraphic(code);//将验证码画到画布上.
            return File(buffer, "image/jpeg");
        }
        #endregion

        #region 注册
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(Purchaser purchaser)
        {
            var isExist = DB.Purchaser.FirstOrDefault(a => a.Username == purchaser.Username);
            if (isExist != null)
            {
                return RedirectDialogToAction("该用户名已经存在！", true);
            }
            purchaser.RegTime = DateTime.Now;
            purchaser.CreditValue = "良好";
            purchaser.State = "正常";
            DB.Purchaser.Add(purchaser);
            DB.SaveChanges();
            //记录登陆状态
            Session["PurId"] = purchaser.Id;
            return RedirectToAction("Index", "Home");
        }
        #endregion


        #region 管理员登陆
        public ActionResult AdminLogin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AdminLogin(string Username, string Password)
        {
           
            var administrators = DB.Administrators.FirstOrDefault(a => a.AdminName == Username && a.AdminPwd == Password);
            if (administrators == null)
            {
                return RedirectDialogToAction("用户名或密码错误，请重新输入！", false);
            }
            else
            {
                Session["AdminId"] = administrators.Id;
                Session["Role"] = "管理员";
                return RedirectToAction("Index", "Admin");
            }
        }

        public ActionResult AdminOut()
        {
            Session["PurId"] = null;
            return RedirectToAction("AdminLogin");
        }
        #endregion
    }
}
