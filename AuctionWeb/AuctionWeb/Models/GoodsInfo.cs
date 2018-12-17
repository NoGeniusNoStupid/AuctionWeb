//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace AuctionWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class GoodsInfo
    {
        public GoodsInfo()
        {
            this.AuctionDetails = new HashSet<AuctionDetails>();
            this.OrderInfo = new HashSet<OrderInfo>();
            this.CreditRecord = new HashSet<CreditRecord>();
        }
    
        public int Id { get; set; }
        public string GoodsName { get; set; }
        public string GoodsType { get; set; }
        public string GoodsDescription { get; set; }
        public string ImagePath { get; set; }
        public string Num { get; set; }
        public string BeginPrice { get; set; }
        public string PriceLevel { get; set; }
        public Nullable<System.DateTime> StartTime { get; set; }
        public Nullable<System.DateTime> EndTime { get; set; }
        public string CountDown { get; set; }
        public Nullable<System.DateTime> AddTime { get; set; }
        public string isSucc { get; set; }
        public Nullable<int> PurchaserId { get; set; }
        public Nullable<int> AdminId { get; set; }
        public string Status { get; set; }
        public string CurrentPrice { get; set; }
        public Nullable<System.DateTime> CountDownTime { get; set; }
    
        public virtual Administrators Administrators { get; set; }
        public virtual ICollection<AuctionDetails> AuctionDetails { get; set; }
        public virtual Purchaser Purchaser { get; set; }
        public virtual ICollection<OrderInfo> OrderInfo { get; set; }
        public virtual ICollection<CreditRecord> CreditRecord { get; set; }
    }
}
