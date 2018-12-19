

using AuctionWeb.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace AuctionWeb.Publcie
{
    public class GoodsInfoHelp
    {
        /// <summary>
        /// 数据库操作对象
        /// </summary>
        public static AuctionWebEntities DB
        {
            get
            {
                return (AuctionWebEntities)DBContextFactory.CreateDbContext();
            }
        }
        /// <summary>
        /// 初始化物品状态
        /// </summary>
        public static void GoodsInfoInit()
        {
            var goodsLits = DB.GoodsInfo.Where(a => (a.Status == "未开始" || a.Status == "进行中") && a.isSucc == "通过").ToList<GoodsInfo>();
            string state = string.Empty;//藏品拍卖状态
            DateTime dt = DateTime.Now;
            foreach (var item in goodsLits)
            {
                if (dt > item.EndTime)
                {
                    if (item.AuctionDetails == null && item.AuctionDetails.Count <= 0)
                        state = "流拍";
                    else
                    {
                   
                        state = "成功"; 
                        //生成订单
                        CreateOrder(item);
                    }
                }
                if (dt < item.StartTime)
                {
                    state = "未开始";
                }
                if (dt > item.StartTime && dt < item.EndTime)
                {
                    state = "进行中";

                    //如何倒计时到了，还没人竞拍，视为竞价成功。
                    if(item.AuctionDetails!=null&&item.AuctionDetails.Count>0)
                    {
                        if (item.CountDownTime < DateTime.Now)
                        {
                            state = "成功";
                            //生成订单
                            CreateOrder(item);
                        }
                    }
                }
                item.Status = state;

                DB.Entry(item).State = EntityState.Modified;
            }
            DB.SaveChanges();
        }
        //生成订单
        private static void CreateOrder(GoodsInfo item)
        {
            //获得最后一条竞拍记录
            var AuctionDetails = item.AuctionDetails.OrderByDescending(a => a.AddTime).FirstOrDefault();
            OrderInfo orderInfo = new OrderInfo();
            orderInfo.GoodsId = item.Id;
            orderInfo.BuyPrice = item.CurrentPrice;
            orderInfo.PurchaserId = AuctionDetails.PurchaserId;
            orderInfo.BuyTime = AuctionDetails.AddTime;
            orderInfo.AddTime = DateTime.Now;
            orderInfo.State = "未付款";
            DB.OrderInfo.Add(orderInfo);
            DB.SaveChanges();
        }
    }
}
