﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class AuctionWebEntities : DbContext
    {
        public AuctionWebEntities()
            : base("name=AuctionWebEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Administrators> Administrators { get; set; }
        public DbSet<AuctionDetails> AuctionDetails { get; set; }
        public DbSet<CreditRecord> CreditRecord { get; set; }
        public DbSet<GoodsInfo> GoodsInfo { get; set; }
        public DbSet<LeaveWord> LeaveWord { get; set; }
        public DbSet<News> News { get; set; }
        public DbSet<OrderInfo> OrderInfo { get; set; }
        public DbSet<Purchaser> Purchaser { get; set; }
    }
}
