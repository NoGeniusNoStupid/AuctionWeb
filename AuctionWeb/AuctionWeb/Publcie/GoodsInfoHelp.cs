﻿

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
            var goodsLits = DB.GoodsInfo.Where(a => a.Status == "未开始" || a.Status == "进行中").ToList<GoodsInfo>();
            string state = string.Empty;//商品拍卖状态
            DateTime dt = DateTime.Now;
            foreach (var item in goodsLits)
            {
                if (dt > item.EndTime)
                {
                    if (item.AuctionDetails == null && item.AuctionDetails.Count<=0)
                       state = "流拍";
                    else
                       state = "成功";
                }
                if (dt < item.StartTime)
                {
                    state = "未开始";
                }
                if (dt > item.StartTime && dt < item.EndTime)
                {
                    state = "进行中";
                }
                item.Status = state;

                DB.Entry(item).State = EntityState.Modified;
            }
            DB.SaveChanges();
        }
    }
}
