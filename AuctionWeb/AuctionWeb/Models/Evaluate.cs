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
    
    public partial class Evaluate
    {
        public int Id { get; set; }
        public Nullable<int> AppMark { get; set; }
        public string AppContent { get; set; }
        public Nullable<int> OrderId { get; set; }
        public Nullable<System.DateTime> Addtime { get; set; }
    
        public virtual OrderInfo OrderInfo { get; set; }
    }
}