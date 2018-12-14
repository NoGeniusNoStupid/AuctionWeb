using AuctionWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace AuctionWeb.Controllers.AdminPage
{
    public class GoodsInfoController : BaseController
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

        public ActionResult Manage()
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
            //上传图片
            if (Request.Files.Count > 0)
            {
                goodsInfo.ImagePath = SaveImage(Request.Files["ImagePath"]);
            }
            goodsInfo.AddTime = DateTime.Now;
            if (Session["PurId"] != null)
                goodsInfo.PurchaserId = Convert.ToInt32(Session["PurId"]);
            if (Session["AdminId"] != null)
                goodsInfo.AdminId = Convert.ToInt32(Session["AdminId"]);
            goodsInfo.isSucc = "待审核";

            DB.GoodsInfo.Add(goodsInfo);
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }


        /// <summary>
        /// 保存图片
        /// </summary>
        /// <param name="postFile"></param>
        /// <returns>获取保存的路径</returns>
        public string SaveImage(HttpPostedFileBase postFile)
        {
            string result = "";
            HttpPostedFileBase imageName = postFile;// 从前台获取文件
            string file = imageName.FileName;
            string fileFormat = file.Split('.')[file.Split('.').Length - 1]; // 以“.”截取，获取“.”后面的文件后缀
            Regex imageFormat = new Regex(@"^(bmp)|(png)|(gif)|(jpg)|(jpeg)"); // 验证文件后缀的表达式（自己写的，不规范别介意哈）
            if (string.IsNullOrEmpty(file) || !imageFormat.IsMatch(fileFormat)) // 验证后缀，判断文件是否是所要上传的格式
            {
                return null;
            }
            else
            {
                string timeStamp = DateTime.Now.Ticks.ToString(); // 获取当前时间的string类型
                string firstFileName = timeStamp.Substring(0, timeStamp.Length - 4); // 通过截取获得文件名
                string imageStr = "File/"; // 获取保存图片的项目文件夹
                string uploadPath = Server.MapPath("~/" + imageStr); // 将项目路径与文件夹合并
                string pictureFormat = file.Split('.')[file.Split('.').Length - 1];// 设置文件格式
                string fileName = firstFileName + "." + fileFormat;// 设置完整（文件名+文件格式） 
                string saveFile = uploadPath + fileName;//文件路径
                imageName.SaveAs(saveFile);// 保存文件
                // 如果单单是上传，不用保存路径的话，下面这行代码就不需要写了！
                string image = "/File/" + fileName;// 设置数据库保存的路径
                return image;
            }
        }

    }
}
