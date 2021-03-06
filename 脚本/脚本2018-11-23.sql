USE [master]
GO
/****** Object:  Database [AuctionWeb]    Script Date: 2018-11-23 17:27:19 ******/
CREATE DATABASE [AuctionWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AuctionWeb', FILENAME = N'F:\项目数据库\网上拍卖系统\AuctionWeb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AuctionWeb_log', FILENAME = N'F:\项目数据库\网上拍卖系统\AuctionWeb_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AuctionWeb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AuctionWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AuctionWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AuctionWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AuctionWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AuctionWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AuctionWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [AuctionWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AuctionWeb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AuctionWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AuctionWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AuctionWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AuctionWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AuctionWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AuctionWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AuctionWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AuctionWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AuctionWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AuctionWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AuctionWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AuctionWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AuctionWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AuctionWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AuctionWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AuctionWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AuctionWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [AuctionWeb] SET  MULTI_USER 
GO
ALTER DATABASE [AuctionWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AuctionWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AuctionWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AuctionWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AuctionWeb', N'ON'
GO
USE [AuctionWeb]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 2018-11-23 17:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [varchar](50) NULL,
	[AdminPwd] [varchar](50) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_Administrators] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuctionDetails]    Script Date: 2018-11-23 17:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuctionDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GoodsId] [int] NULL,
	[PurchaserId] [int] NULL,
	[TempPrice] [varchar](50) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_AuctionDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Evaluate]    Script Date: 2018-11-23 17:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evaluate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppMark] [int] NULL,
	[AppContent] [varchar](250) NULL,
	[OrderId] [int] NULL,
	[Addtime] [datetime] NULL,
 CONSTRAINT [PK_Evaluate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GoodsInfo]    Script Date: 2018-11-23 17:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GoodsInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GoodsName] [varchar](50) NULL,
	[GoodsType] [varchar](50) NULL,
	[GoodsDescription] [varchar](500) NULL,
	[ImagePath] [varchar](50) NULL,
	[Num] [varchar](50) NULL,
	[BeginPrice] [varchar](50) NULL,
	[PriceLevel] [varchar](50) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[CountDown] [varchar](50) NULL,
	[SellerId] [int] NULL,
	[AddTime] [datetime] NULL,
	[isSucc] [varchar](50) NULL,
 CONSTRAINT [PK_GoodsInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LeaveWord]    Script Date: 2018-11-23 17:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LeaveWord](
	[Id] [int] NOT NULL,
	[LContent] [varchar](500) NULL,
	[LTime] [datetime] NULL,
	[PurchaserId] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_leaveWord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderInfo]    Script Date: 2018-11-23 17:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GoodsId] [int] NULL,
	[PurchaserId] [int] NULL,
	[BuyPrice] [varchar](50) NULL,
	[BuyTime] [datetime] NULL,
	[SendAddress] [varchar](50) NULL,
	[PayType] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_OrderInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Purchaser]    Script Date: 2018-11-23 17:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Purchaser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[TrueName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[PostBoy] [varchar](50) NULL,
	[CreditValue] [varchar](50) NULL,
	[RegTime] [datetime] NULL,
 CONSTRAINT [PK_Purchaser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Administrators] ADD  CONSTRAINT [DF_Administrators_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[AuctionDetails] ADD  CONSTRAINT [DF_AuctionDetails_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[Evaluate] ADD  CONSTRAINT [DF_Evaluate_Addtime]  DEFAULT (getdate()) FOR [Addtime]
GO
ALTER TABLE [dbo].[GoodsInfo] ADD  CONSTRAINT [DF_GoodsInfo_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[LeaveWord] ADD  CONSTRAINT [DF_LeaveWord_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[OrderInfo] ADD  CONSTRAINT [DF_OrderInfo_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[Purchaser] ADD  CONSTRAINT [DF_Purchaser_RegTime]  DEFAULT (getdate()) FOR [RegTime]
GO
ALTER TABLE [dbo].[AuctionDetails]  WITH CHECK ADD  CONSTRAINT [FK_AuctionDetails_GoodsInfo] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[GoodsInfo] ([Id])
GO
ALTER TABLE [dbo].[AuctionDetails] CHECK CONSTRAINT [FK_AuctionDetails_GoodsInfo]
GO
ALTER TABLE [dbo].[AuctionDetails]  WITH CHECK ADD  CONSTRAINT [FK_AuctionDetails_Purchaser] FOREIGN KEY([PurchaserId])
REFERENCES [dbo].[Purchaser] ([Id])
GO
ALTER TABLE [dbo].[AuctionDetails] CHECK CONSTRAINT [FK_AuctionDetails_Purchaser]
GO
ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD  CONSTRAINT [FK_Evaluate_Evaluate] FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderInfo] ([Id])
GO
ALTER TABLE [dbo].[Evaluate] CHECK CONSTRAINT [FK_Evaluate_Evaluate]
GO
ALTER TABLE [dbo].[GoodsInfo]  WITH CHECK ADD  CONSTRAINT [FK_GoodsInfo_Purchaser] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Purchaser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodsInfo] CHECK CONSTRAINT [FK_GoodsInfo_Purchaser]
GO
ALTER TABLE [dbo].[LeaveWord]  WITH CHECK ADD  CONSTRAINT [FK_leaveWord_Purchaser] FOREIGN KEY([PurchaserId])
REFERENCES [dbo].[Purchaser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LeaveWord] CHECK CONSTRAINT [FK_leaveWord_Purchaser]
GO
ALTER TABLE [dbo].[OrderInfo]  WITH CHECK ADD  CONSTRAINT [FK_OrderInfo_GoodsInfo] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[GoodsInfo] ([Id])
GO
ALTER TABLE [dbo].[OrderInfo] CHECK CONSTRAINT [FK_OrderInfo_GoodsInfo]
GO
ALTER TABLE [dbo].[OrderInfo]  WITH CHECK ADD  CONSTRAINT [FK_OrderInfo_Purchaser] FOREIGN KEY([PurchaserId])
REFERENCES [dbo].[Purchaser] ([Id])
GO
ALTER TABLE [dbo].[OrderInfo] CHECK CONSTRAINT [FK_OrderInfo_Purchaser]
GO
USE [master]
GO
ALTER DATABASE [AuctionWeb] SET  READ_WRITE 
GO
