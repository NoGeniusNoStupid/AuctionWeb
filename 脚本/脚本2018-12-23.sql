USE [master]
GO
/****** Object:  Database [AuctionWeb]    Script Date: 2018-12-23 17:09:45 ******/
CREATE DATABASE [AuctionWeb] ON  PRIMARY 
( NAME = N'AuctionWeb', FILENAME = N'E:\项目数据库\网上拍卖系统\AuctionWeb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AuctionWeb_log', FILENAME = N'E:\项目数据库\网上拍卖系统\AuctionWeb_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
EXEC sys.sp_db_vardecimal_storage_format N'AuctionWeb', N'ON'
GO
USE [AuctionWeb]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 2018-12-23 17:09:45 ******/
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
/****** Object:  Table [dbo].[AuctionDetails]    Script Date: 2018-12-23 17:09:45 ******/
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
/****** Object:  Table [dbo].[CreditRecord]    Script Date: 2018-12-23 17:09:45 ******/
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
/****** Object:  Table [dbo].[GoodsInfo]    Script Date: 2018-12-23 17:09:45 ******/
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
/****** Object:  Table [dbo].[LeaveWord]    Script Date: 2018-12-23 17:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LeaveWord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LContent] [varchar](500) NULL,
	[LTel] [varchar](20) NULL,
	[PurchaserId] [int] NULL,
	[Status] [varchar](10) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_leaveWord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 2018-12-23 17:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Author] [varchar](50) NULL,
	[ClickNum] [int] NULL,
	[AddTime] [datetime] NULL,
	[Content] [varchar](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderInfo]    Script Date: 2018-12-23 17:09:45 ******/
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
	[Tel] [varchar](50) NULL,
	[PayType] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[AddTime] [datetime] NULL,
	[Evaluate] [varchar](50) NULL,
	[EvaluateTime] [datetime] NULL,
	[EvaluateState] [varchar](10) NULL,
 CONSTRAINT [PK_OrderInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Purchaser]    Script Date: 2018-12-23 17:09:45 ******/
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
INSERT [dbo].[Administrators] ([Id], [AdminName], [AdminPwd], [AddTime]) VALUES (2, N'xuexue', N'123456', CAST(0x0000A9BB010A7C16 AS DateTime))
SET IDENTITY_INSERT [dbo].[Administrators] OFF
SET IDENTITY_INSERT [dbo].[AuctionDetails] ON 

INSERT [dbo].[AuctionDetails] ([Id], [GoodsId], [PurchaserId], [TempPrice], [AddTime]) VALUES (2, 3, 8, N'5000', CAST(0x0000A9BA009BA278 AS DateTime))
INSERT [dbo].[AuctionDetails] ([Id], [GoodsId], [PurchaserId], [TempPrice], [AddTime]) VALUES (3, 3, 9, N'6000', CAST(0x0000A9BA009EB7EA AS DateTime))
INSERT [dbo].[AuctionDetails] ([Id], [GoodsId], [PurchaserId], [TempPrice], [AddTime]) VALUES (4, 3, 8, N'7000', CAST(0x0000A9BA009F2B54 AS DateTime))
INSERT [dbo].[AuctionDetails] ([Id], [GoodsId], [PurchaserId], [TempPrice], [AddTime]) VALUES (5, 3, 9, N'8000', CAST(0x0000A9BA009F823E AS DateTime))
SET IDENTITY_INSERT [dbo].[AuctionDetails] OFF
SET IDENTITY_INSERT [dbo].[CreditRecord] ON 

INSERT [dbo].[CreditRecord] ([Id], [GoodsId], [PurchaserId], [PayType], [CreditPrice], [Status], [AddTime]) VALUES (1, 3, 8, N'支付宝支付', N'800', N'退还', CAST(0x0000A9B9010D4229 AS DateTime))
INSERT [dbo].[CreditRecord] ([Id], [GoodsId], [PurchaserId], [PayType], [CreditPrice], [Status], [AddTime]) VALUES (2, 3, 9, N'支付宝支付', N'800', N'退还', CAST(0x0000A9BA009EAEE8 AS DateTime))
SET IDENTITY_INSERT [dbo].[CreditRecord] OFF
SET IDENTITY_INSERT [dbo].[GoodsInfo] ON 

INSERT [dbo].[GoodsInfo] ([Id], [GoodsName], [GoodsType], [GoodsDescription], [ImagePath], [Num], [BeginPrice], [PriceLevel], [StartTime], [EndTime], [CountDown], [AddTime], [isSucc], [PurchaserId], [AdminId], [Status], [CurrentPrice], [CountDownTime]) VALUES (2, N'白玉貔貅', N'古董', N'上好的白玉貔貅', N'/File/63680404525104.jpg', N'1', N'1500', N'200', CAST(0x0000A9B700000000 AS DateTime), CAST(0x0000A9B900000000 AS DateTime), N'3', CAST(0x0000A9B700000000 AS DateTime), N'通过', NULL, 1, N'流拍', N'1500', NULL)
INSERT [dbo].[GoodsInfo] ([Id], [GoodsName], [GoodsType], [GoodsDescription], [ImagePath], [Num], [BeginPrice], [PriceLevel], [StartTime], [EndTime], [CountDown], [AddTime], [isSucc], [PurchaserId], [AdminId], [Status], [CurrentPrice], [CountDownTime]) VALUES (3, N'子母三阳鼎', N'古董', N'                    此鼎采集日月精华，由诸葛铸造。
                ', N'/File/63680637036582.jpg', N'2', N'4000', N'1000', CAST(0x0000A9B900A4CB80 AS DateTime), CAST(0x0000A9BB00000000 AS DateTime), N'5', CAST(0x0000A9B900A23690 AS DateTime), N'通过', NULL, 1, N'成功', N'8000', CAST(0x0000A9BB00A3E73E AS DateTime))
INSERT [dbo].[GoodsInfo] ([Id], [GoodsName], [GoodsType], [GoodsDescription], [ImagePath], [Num], [BeginPrice], [PriceLevel], [StartTime], [EndTime], [CountDown], [AddTime], [isSucc], [PurchaserId], [AdminId], [Status], [CurrentPrice], [CountDownTime]) VALUES (5, N'仓山区鸿宇海景别墅1栋', N'房产', N'三层楼，占地面积300㎡。', N'/File/63680834817572.jpg', N'1', N'30000000', N'100000', CAST(0x0000A9BC00000000 AS DateTime), CAST(0x0000A9C4018B3BB0 AS DateTime), N'10', CAST(0x0000A9BB011491D9 AS DateTime), N'通过', 8, NULL, N'进行中', N'30000000', NULL)
SET IDENTITY_INSERT [dbo].[GoodsInfo] OFF
SET IDENTITY_INSERT [dbo].[LeaveWord] ON 

INSERT [dbo].[LeaveWord] ([Id], [LContent], [LTel], [PurchaserId], [Status], [AddTime]) VALUES (7, N'为什么这个网站做的那么好呢！', N'15260966227', 8, N'未读', CAST(0x0000A9BB01179CB0 AS DateTime))
SET IDENTITY_INSERT [dbo].[LeaveWord] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Author], [ClickNum], [AddTime], [Content]) VALUES (3, N'清光绪 慈禧太后岫坤玉雕双龙钮长方印玺', N'小张', 10, CAST(0x0000A9BA010670C4 AS DateTime), N'<table><tbody><tr class="firstRow"><td style="word-break: break-all;"><img src="/Content/utf8-asp/asp/upload/image/20181218/15451223828877852.jpg" title="c2.jpg" alt="c2.jpg"/></td></tr><tr><td>&nbsp; &nbsp;此方宝玺用硬度较低的岫岩玉刻制，淡绿色的玉质略显通透。交龙钮，附系黄丝绳绶，印文为阳文“翊坤宫珍赏”，印文四周围绕龙纹、火珠图案。从印钮、印文、材质、刻工等综合考察，此宝为晚清慈禧皇太后时期宫中制作的御用玺印。<br/><br/>翊坤宫是内廷西六宫之一，明清两代为后妃居住的宫殿。慈禧皇太后为贵妃时曾居住于此，后来她居住储秀宫时，又将此宫改造，使之与储秀宫相连通，每逢各种节日，都要在这里接受妃嫱们的朝拜。<br/><br/>在清代所有皇帝和後妃之中，慈禧皇太后是拥有宝玺数量较多的一位，这显然与她几度垂帘听政，执掌清政权长达四十八年之久有关。作为最高统治者，尽管在其统治期间社会动荡不安，内忧外患频仍，政府的权威性已经大大减弱，但她仍要求在各个方面凸显自己的权威，力求与自己最高统治者的地位相一致。宝玺的制作也是如此，她的宝玺自有一种不同于普通后妃的凌驾于万人之上的气势，只不过其制作的水准实在一般。</td></tr></tbody></table><p><br/></p>')
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[OrderInfo] ON 

INSERT [dbo].[OrderInfo] ([Id], [GoodsId], [PurchaserId], [BuyPrice], [BuyTime], [SendAddress], [Tel], [PayType], [State], [AddTime], [Evaluate], [EvaluateTime], [EvaluateState]) VALUES (2, 3, 9, N'8000', CAST(0x0000A9BA009F81FC AS DateTime), N'福州市晋安区工程学院', N'15265945647', N'微信支付', N'付款成功', CAST(0x0000A9BB00A3DD9C AS DateTime), N'寄错了！', CAST(0x0000A9BC00A689A8 AS DateTime), N'已处理')
SET IDENTITY_INSERT [dbo].[OrderInfo] OFF
SET IDENTITY_INSERT [dbo].[Purchaser] ON 

INSERT [dbo].[Purchaser] ([Id], [Username], [Password], [Telephone], [IdNum], [TrueName], [Address], [State], [CreditValue], [RegTime]) VALUES (8, N'xieqian', N'123456', N'13625022070', N'350104199606072285', N'谢倩', N'福州市晋安区工程学院', N'正常', N'0', CAST(0x0000A9B600DF0368 AS DateTime))
INSERT [dbo].[Purchaser] ([Id], [Username], [Password], [Telephone], [IdNum], [TrueName], [Address], [State], [CreditValue], [RegTime]) VALUES (9, N'weihua', N'123456', N'15265945647', N'350104199606072285', N'卫华', N'福州市晋安区工程学院', N'正常', N'0', CAST(0x0000A9BA009E80DF AS DateTime))
SET IDENTITY_INSERT [dbo].[Purchaser] OFF
ALTER TABLE [dbo].[Administrators] ADD  CONSTRAINT [DF_Administrators_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[AuctionDetails] ADD  CONSTRAINT [DF_AuctionDetails_AddTime]  DEFAULT (getdate()) FOR [AddTime]
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
ON DELETE CASCADE
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
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CreditRecord] CHECK CONSTRAINT [FK_CreditRecord_GoodsInfo]
GO
ALTER TABLE [dbo].[CreditRecord]  WITH CHECK ADD  CONSTRAINT [FK_CreditRecord_Purchaser] FOREIGN KEY([PurchaserId])
REFERENCES [dbo].[Purchaser] ([Id])
GO
ALTER TABLE [dbo].[CreditRecord] CHECK CONSTRAINT [FK_CreditRecord_Purchaser]
GO
ALTER TABLE [dbo].[GoodsInfo]  WITH CHECK ADD  CONSTRAINT [FK_GoodsInfo_Administrators] FOREIGN KEY([AdminId])
REFERENCES [dbo].[Administrators] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodsInfo] CHECK CONSTRAINT [FK_GoodsInfo_Administrators]
GO
ALTER TABLE [dbo].[GoodsInfo]  WITH CHECK ADD  CONSTRAINT [FK_GoodsInfo_Purchaser] FOREIGN KEY([PurchaserId])
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
ON DELETE CASCADE
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
