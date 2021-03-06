USE [master]
GO
/****** Object:  Database [AuctionWeb]    Script Date: 2018/12/18 1:07:41 ******/
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
/****** Object:  Table [dbo].[Administrators]    Script Date: 2018/12/18 1:07:41 ******/
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
/****** Object:  Table [dbo].[AuctionDetails]    Script Date: 2018/12/18 1:07:41 ******/
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
/****** Object:  Table [dbo].[CreditRecord]    Script Date: 2018/12/18 1:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CreditRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GoodsId] [int] NULL,
	[PurchaserId] [int] NULL,
	[PayType] [varchar](50) NULL,
	[CreditPrice] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_CreditRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Evaluate]    Script Date: 2018/12/18 1:07:41 ******/
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
/****** Object:  Table [dbo].[GoodsInfo]    Script Date: 2018/12/18 1:07:41 ******/
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
	[AddTime] [datetime] NULL,
	[isSucc] [varchar](50) NULL,
	[PurchaserId] [int] NULL,
	[AdminId] [int] NULL,
	[Status] [varchar](50) NULL,
	[CurrentPrice] [varchar](50) NULL,
	[CountDownTime] [datetime] NULL,
 CONSTRAINT [PK_GoodsInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LeaveWord]    Script Date: 2018/12/18 1:07:41 ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 2018/12/18 1:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[AdminId] [int] NULL,
	[Author] [nchar](10) NULL,
	[ClickNum] [int] NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderInfo]    Script Date: 2018/12/18 1:07:41 ******/
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
/****** Object:  Table [dbo].[Purchaser]    Script Date: 2018/12/18 1:07:41 ******/
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
	[IdNum] [varchar](50) NULL,
	[TrueName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[State] [varchar](50) NULL,
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
SET IDENTITY_INSERT [dbo].[Administrators] ON 

INSERT [dbo].[Administrators] ([Id], [AdminName], [AdminPwd], [AddTime]) VALUES (1, N'admin', N'123456', CAST(0x0000A9B300000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Administrators] OFF
SET IDENTITY_INSERT [dbo].[AuctionDetails] ON 

INSERT [dbo].[AuctionDetails] ([Id], [GoodsId], [PurchaserId], [TempPrice], [AddTime]) VALUES (1, 3, 8, N'6000', CAST(0x0000A9B901568F9E AS DateTime))
INSERT [dbo].[AuctionDetails] ([Id], [GoodsId], [PurchaserId], [TempPrice], [AddTime]) VALUES (2, 3, 9, N'7000', CAST(0x0000A9B90156EE02 AS DateTime))
INSERT [dbo].[AuctionDetails] ([Id], [GoodsId], [PurchaserId], [TempPrice], [AddTime]) VALUES (3, 3, 8, N'8000', CAST(0x0000A9BA0005E6D9 AS DateTime))
SET IDENTITY_INSERT [dbo].[AuctionDetails] OFF
SET IDENTITY_INSERT [dbo].[CreditRecord] ON 

INSERT [dbo].[CreditRecord] ([Id], [GoodsId], [PurchaserId], [PayType], [CreditPrice], [Status], [AddTime]) VALUES (1, 3, 8, N'支付宝支付', N'800', N'缴纳', CAST(0x0000A9B9010D4229 AS DateTime))
INSERT [dbo].[CreditRecord] ([Id], [GoodsId], [PurchaserId], [PayType], [CreditPrice], [Status], [AddTime]) VALUES (2, 3, 9, N'微信支付', N'800', N'缴纳', CAST(0x0000A9B90156E8ED AS DateTime))
SET IDENTITY_INSERT [dbo].[CreditRecord] OFF
SET IDENTITY_INSERT [dbo].[GoodsInfo] ON 

INSERT [dbo].[GoodsInfo] ([Id], [GoodsName], [GoodsType], [GoodsDescription], [ImagePath], [Num], [BeginPrice], [PriceLevel], [StartTime], [EndTime], [CountDown], [AddTime], [isSucc], [PurchaserId], [AdminId], [Status], [CurrentPrice], [CountDownTime]) VALUES (2, N'白玉貔貅', N'古董', N'上好的白玉貔貅', N'/File/63680404525104.jpg', N'1', N'1500', N'200', CAST(0x0000A9B700000000 AS DateTime), CAST(0x0000A9B900000000 AS DateTime), N'3', CAST(0x0000A9B700000000 AS DateTime), N'待审核', NULL, 1, N'流拍', N'1500', NULL)
INSERT [dbo].[GoodsInfo] ([Id], [GoodsName], [GoodsType], [GoodsDescription], [ImagePath], [Num], [BeginPrice], [PriceLevel], [StartTime], [EndTime], [CountDown], [AddTime], [isSucc], [PurchaserId], [AdminId], [Status], [CurrentPrice], [CountDownTime]) VALUES (3, N'子母三阳鼎', N'古董', N'                    此鼎采集日月精华，由诸葛铸造。
                ', N'/File/63680637036582.jpg', N'2', N'4000', N'1000', CAST(0x0000A9B900A4CB80 AS DateTime), CAST(0x0000A9BB00000000 AS DateTime), N'5', CAST(0x0000A9B900A23690 AS DateTime), N'待审核', NULL, 1, N'成功', N'8000', CAST(0x0000A9BA00074669 AS DateTime))
SET IDENTITY_INSERT [dbo].[GoodsInfo] OFF
SET IDENTITY_INSERT [dbo].[Purchaser] ON 

INSERT [dbo].[Purchaser] ([Id], [Username], [Password], [Telephone], [IdNum], [TrueName], [Address], [State], [CreditValue], [RegTime]) VALUES (8, N'xieqian', N'123456', N'15265945647', N'350104199606072226', N'谢倩', N'福州市晋安区工程学院', N'正常', N'0', CAST(0x0000A9B600DF03CB AS DateTime))
INSERT [dbo].[Purchaser] ([Id], [Username], [Password], [Telephone], [IdNum], [TrueName], [Address], [State], [CreditValue], [RegTime]) VALUES (9, N'weihua', N'123456', N'15260966228', N'362302199406054513', N'卫华', N'福州市闽侯县', N'正常', N'0', CAST(0x0000A9B90156E03C AS DateTime))
SET IDENTITY_INSERT [dbo].[Purchaser] OFF
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
ALTER TABLE [dbo].[CreditRecord]  WITH CHECK ADD  CONSTRAINT [FK_CreditRecord_GoodsInfo] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[GoodsInfo] ([Id])
GO
ALTER TABLE [dbo].[CreditRecord] CHECK CONSTRAINT [FK_CreditRecord_GoodsInfo]
GO
ALTER TABLE [dbo].[Evaluate]  WITH CHECK ADD  CONSTRAINT [FK_Evaluate_Evaluate] FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderInfo] ([Id])
GO
ALTER TABLE [dbo].[Evaluate] CHECK CONSTRAINT [FK_Evaluate_Evaluate]
GO
ALTER TABLE [dbo].[GoodsInfo]  WITH CHECK ADD  CONSTRAINT [FK_GoodsInfo_Administrators] FOREIGN KEY([AdminId])
REFERENCES [dbo].[Administrators] ([Id])
GO
ALTER TABLE [dbo].[GoodsInfo] CHECK CONSTRAINT [FK_GoodsInfo_Administrators]
GO
ALTER TABLE [dbo].[GoodsInfo]  WITH CHECK ADD  CONSTRAINT [FK_GoodsInfo_Purchaser] FOREIGN KEY([PurchaserId])
REFERENCES [dbo].[Purchaser] ([Id])
GO
ALTER TABLE [dbo].[GoodsInfo] CHECK CONSTRAINT [FK_GoodsInfo_Purchaser]
GO
ALTER TABLE [dbo].[LeaveWord]  WITH CHECK ADD  CONSTRAINT [FK_leaveWord_Purchaser] FOREIGN KEY([PurchaserId])
REFERENCES [dbo].[Purchaser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LeaveWord] CHECK CONSTRAINT [FK_leaveWord_Purchaser]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Administrators] FOREIGN KEY([AdminId])
REFERENCES [dbo].[Administrators] ([Id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Administrators]
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
