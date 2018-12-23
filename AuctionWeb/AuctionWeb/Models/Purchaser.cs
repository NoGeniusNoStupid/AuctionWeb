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
    
    public partial class Purchaser
    {
        public Purchaser()
        {
            this.AuctionDetails = new HashSet<AuctionDetails>();
            this.GoodsInfo = new HashSet<GoodsInfo>();
            this.LeaveWord = new HashSet<LeaveWord>();
            this.OrderInfo = new HashSet<OrderInfo>();
            this.CreditRecord = new HashSet<CreditRecord>();
        }
    
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Telephone { get; set; }
        public string IdNum { get; set; }
        public string TrueName { get; set; }
        public string Address { get; set; }
        public string State { get; set; }
        public string CreditValue { get; set; }
        public Nullable<System.DateTime> RegTime { get; set; }
    
        public virtual ICollection<AuctionDetails> AuctionDetails { get; set; }
        public virtual ICollection<GoodsInfo> GoodsInfo { get; set; }
        public virtual ICollection<LeaveWord> LeaveWord { get; set; }
        public virtual ICollection<OrderInfo> OrderInfo { get; set; }
        public virtual ICollection<CreditRecord> CreditRecord { get; set; }
    }
}
