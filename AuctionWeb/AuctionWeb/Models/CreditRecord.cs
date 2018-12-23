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
    
    public partial class CreditRecord
    {
        public int Id { get; set; }
        public Nullable<int> GoodsId { get; set; }
        public Nullable<int> PurchaserId { get; set; }
        public string PayType { get; set; }
        public string CreditPrice { get; set; }
        public string Status { get; set; }
        public Nullable<System.DateTime> AddTime { get; set; }
    
        public virtual GoodsInfo GoodsInfo { get; set; }
        public virtual Purchaser Purchaser { get; set; }
    }
}
