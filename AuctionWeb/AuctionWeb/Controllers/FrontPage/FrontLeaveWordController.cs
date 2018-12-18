using AuctionWeb.Models;
using AuctionWeb.Publcie;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace AuctionWeb.Controllers
{
    /// <summary>
    /// 留言管理
    /// </summary>
    public class FrontLeaveWordController : BaseController
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

        //添加留言
        [HttpPost]
        public ActionResult AddLeaveWord(string LTel, string LContent)
        {
            LeaveWord leaveWord = new LeaveWord();
            leaveWord.LTel = LTel;
            leaveWord.LContent = LContent;
            if (Session["PurId"] == null)
            {
                string msg = "请先登录，再进行操作！";
                return RedirectDialogToAction("Login", "Login", msg);
            }

            int PurId = Convert.ToInt32(Session["PurId"]);

            leaveWord.PurchaserId = PurId;
            leaveWord.AddTime = DateTime.Now;
            leaveWord.Status = "未读";
            DB.LeaveWord.Add(leaveWord);
            return RedirectDialogToAction("Message", "Home", "留言成功", DB.SaveChanges());
        }

        //留言管理界面
        public ActionResult Manage(string search)
        {
            //分页设置
            int pageIndex = Request.QueryString["pageIndex"] != null ? int.Parse(Request.QueryString["pageIndex"]) : 1;
            int pageSize = 5;//页面记录数
            List<LeaveWord> mlist = new List<LeaveWord>();

            if (Session["Role"].ToString() == "用户")//用户
            {
                int purID = Convert.ToInt32(Session["PurId"]);
                //查询记录
                if (string.IsNullOrEmpty(search))
                {
                    mlist = DB.LeaveWord.Where(a => a.PurchaserId == purID).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<LeaveWord>();
                }
                else
                {
                    mlist = DB.LeaveWord.Where(a => a.LContent.Contains(search) && a.PurchaserId == purID).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<LeaveWord>();
                }
                int listCount = DB.LeaveWord.Where(a => a.PurchaserId == purID).Count();
                //生成导航条
                string strBar = ManagePageBar.GetPageBar(pageIndex, listCount, pageSize);
                ViewData["List"] = mlist;
                ViewData["PageBar"] = strBar;
            }
            else //管理员
            {
                //查询记录
                if (string.IsNullOrEmpty(search))
                {
                    mlist = DB.LeaveWord.Where(a => true).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<LeaveWord>();
                }
                else
                {
                    mlist = DB.LeaveWord.Where(a => a.LContent.Contains(search)).OrderByDescending(a => a.Id).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList<LeaveWord>();
                }
                int listCount = DB.LeaveWord.Where(a => true).Count();
                //生成导航条
                string strBar = ManagePageBar.GetPageBar(pageIndex, listCount, pageSize);
                ViewData["List"] = mlist;
                ViewData["PageBar"] = strBar;
            }
            return View();
        }
        //删除
        public ActionResult Delete(int id)
        {
            var Info = DB.LeaveWord.FirstOrDefault(a => a.Id == id);
            DB.Entry(Info).State = EntityState.Deleted;
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }
        //已读
        public ActionResult Read(int id)
        {
            var Info = DB.LeaveWord.FirstOrDefault(a => a.Id == id);
            Info.Status = "已读"; 
            DB.Entry(Info).State = EntityState.Modified;
            DB.SaveChanges();
            return RedirectToAction("Manage");
        }



    }
}
