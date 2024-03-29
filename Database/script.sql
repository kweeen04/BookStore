USE [Bookstore]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/19/2024 10:58:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[Total] [money] NOT NULL,
	[Payment] [varchar](250) NOT NULL,
	[Address] [ntext] NOT NULL,
	[Date] [date] NOT NULL,
	[Phone] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill_Detail]    Script Date: 3/19/2024 10:58:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Detail](
	[DetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[BillID] [bigint] NULL,
	[BookID] [varchar](100) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/19/2024 10:58:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [varchar](100) NOT NULL,
	[GenreID] [int] NULL,
	[BookName] [nvarchar](max) NOT NULL,
	[BookAuthor] [nvarchar](255) NOT NULL,
	[BookPrice] [money] NOT NULL,
	[BookDescribe] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ImgURL] [nvarchar](max) NOT NULL,
	[PublicationDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/19/2024 10:58:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [bigint] NOT NULL,
	[UserID] [bigint] NULL,
	[BookID] [varchar](100) NULL,
	[BookName] [varchar](255) NOT NULL,
	[BookImgURL] [varchar](max) NOT NULL,
	[BookPrice] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 3/19/2024 10:58:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/19/2024 10:58:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountType] [varchar](50) NOT NULL,
	[DiscountAmount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 3/19/2024 10:58:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/19/2024 10:58:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [varchar](100) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [money] NOT NULL,
	[product_describe] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 3/19/2024 10:58:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [bigint] NOT NULL,
	[BookID] [varchar](100) NULL,
	[UserID] [bigint] NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[ReviewDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/19/2024 10:58:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[UserEmail] [varchar](255) NOT NULL,
	[UserPass] [nvarchar](255) NOT NULL,
	[IsAdmin] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (1, 1, 15.9900, N'Credit Card', N'123 Main St, Anytown, USA', CAST(N'2024-03-05' AS Date), 1234567890)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (2, 2, 10.9900, N'PayPal', N'456 Elm St, Othertown, USA', CAST(N'2024-03-06' AS Date), 9876543210)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (3, 3, 13.7900, N'Credit Card', N'789 Oak St, Anothertown, USA', CAST(N'2024-03-07' AS Date), 5551234567)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (4, 4, 14.2500, N'Cash on Delivery', N'101 Pine St, Somewhere, USA', CAST(N'2024-03-08' AS Date), 9995551234)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (5, 5, 12.9900, N'Credit Card', N'202 Maple St, Nowhere, USA', CAST(N'2024-03-09' AS Date), 7779998888)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (6, 6, 18.7500, N'PayPal', N'303 Cedar St, Elsewhere, USA', CAST(N'2024-03-10' AS Date), 2224446666)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (7, 7, 19.9900, N'Credit Card', N'404 Spruce St, Anywhere, USA', CAST(N'2024-03-11' AS Date), 1112223333)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (8, 8, 22.9900, N'Cash on Delivery', N'505 Birch St, Overthere, USA', CAST(N'2024-03-12' AS Date), 3338881111)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (9, 9, 20.4900, N'Credit Card', N'606 Walnut St, Inbetween, USA', CAST(N'2024-03-13' AS Date), 4447779999)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (10, 10, 16.4900, N'PayPal', N'707 Pineapple St, Betweenthere, USA', CAST(N'2024-03-14' AS Date), 6663339999)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (11, 11, 79.9200, N'MOMO', N'Liên Chiểu', CAST(N'2024-03-03' AS Date), 935279798)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (13, 11, 230000.0000, N'MOMO', N'Hoa Hai', CAST(N'2024-03-04' AS Date), 796510005)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (14, 11, 236322.0000, N'MOMO', N'Hoa Hai', CAST(N'2024-03-04' AS Date), 796510005)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (15, 11, 7036863.0000, N'MOMO', N'Hoa Hai', CAST(N'2024-03-04' AS Date), 796510005)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (16, 11, 154732.0000, N'MOMO', N'Liên Chiểu', CAST(N'2024-03-05' AS Date), 935279798)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (17, 1, 686011.9900, N'COD', N'32321312', CAST(N'2024-03-06' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (18, 1, 11.9900, N'COD', N'da nang', CAST(N'2024-03-07' AS Date), 789013530)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (19, 1, 300000.0000, N'COD', N'312321321', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (20, 1, 13000.0000, N'COD', N'312321', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (21, 1, 13000.0000, N'COD', N'da nang', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (22, 1, 343000.0000, N'COD', N'321312', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (23, 1, 343000.0000, N'COD', N'da nang', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (24, 1, 182342.0000, N'VNPAY', N'da nang', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (25, 13, 300000.0000, N'COD', N'312321312321', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (26, 13, 343000.0000, N'COD', N'da nang', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (27, 13, 230000.0000, N'COD', N'312321', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (28, 13, 300000.0000, N'COD', N'da nang', CAST(N'2024-03-07' AS Date), 789013430)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (29, 13, 300000.0000, N'MOMO', N'da nang', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (30, 13, 343000.0000, N'PAYPAL', N'ewqeqưewqeq', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (31, 13, 343000.0000, N'PAYPAL', N'55345', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (32, 13, 343000.0000, N'PAYPAL', N'312312', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (33, 13, 13000.0000, N'PAYPAL', N'321312', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (34, 13, 343000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (35, 13, 343000.0000, N'PAYPAL', N'3132131', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (36, 13, 343000.0000, N'PAYPAL', N'eqưewq', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (37, 13, 343000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (38, 13, 11.9900, N'PAYPAL', N'da nang', CAST(N'2024-03-07' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (39, 13, 11.9900, N'PAYPAL', N'eqweqw', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (40, 13, 11.9900, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (41, 13, 11.9900, N'PAYPAL', N'eqưewqewq', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (42, 13, 11.9900, N'PAYPAL', N'ewqeqư', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (43, 13, 11.9900, N'PAYPAL', N'da nang0', CAST(N'2024-03-08' AS Date), 789013530)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (44, 13, 343000.0000, N'PAYPAL', N'3213213', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (45, 13, 13000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (46, 13, 343000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (47, 13, 343000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (48, 13, 343000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (49, 13, 343000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (50, 13, 343000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (51, 13, 343000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 96100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (52, 13, 343000.0000, N'PAYPAL', N'321321321', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (53, 13, 300000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 789013530)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (54, 13, 13000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (55, 13, 230000.0000, N'PAYPAL', N'312321', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (56, 13, 230000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (57, 13, 300000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (58, 13, 300000.0000, N'PAYPAL', N'312312', CAST(N'2024-03-08' AS Date), 96100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (59, 13, 230000.0000, N'PAYPAL', N'321312', CAST(N'2024-03-08' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (60, 13, 2599542.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 789013530)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (61, 13, 236322.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 789013530)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (62, 13, 300000.0000, N'PAYPAL', N'312321', CAST(N'2024-03-08' AS Date), 789013530)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (63, 13, 13000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-08' AS Date), 789013530)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (64, 13, 230000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-10' AS Date), 789013530)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (65, 13, 460000.0000, N'PAYPAL', N'096100900', CAST(N'2024-03-10' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (66, 13, 231421.0000, N'MOMO', N'da nang', CAST(N'2024-03-10' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (67, 13, 236322.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-10' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (68, 13, 13000.0000, N'COD', N'da nang', CAST(N'2024-03-10' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (69, 13, 230000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-10' AS Date), 96100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (70, 13, 460000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-10' AS Date), 96100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (71, 13, 230000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-10' AS Date), 789013530)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (72, 13, 300000.0000, N'PAYPAL', N'fa', CAST(N'2024-03-10' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (73, 13, 2345621.0000, N'PAYPAL', N'321312', CAST(N'2024-03-10' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (74, 13, 343000.0000, N'PAYPAL', N'312321', CAST(N'2024-03-11' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (75, 13, 343000.0000, N'PAYPAL', N'312321', CAST(N'2024-03-11' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (76, 13, 2345621.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-11' AS Date), 789013530)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (77, 13, 343000.0000, N'COD', N'da nang', CAST(N'2024-03-11' AS Date), 976200900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (78, 13, 300000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-11' AS Date), 321321)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (79, 13, 343000.0000, N'COD', N'da nang', CAST(N'2024-03-13' AS Date), 123)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (80, 13, 343000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-13' AS Date), 123)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (81, 13, 343000.0000, N'MOMO', N'da nang', CAST(N'2024-03-13' AS Date), 123123)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (82, 13, 343000.0000, N'VNPAY', N'123', CAST(N'2024-03-13' AS Date), 312312312)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (83, 13, 343000.0000, N'MOMO', N'da nang', CAST(N'2024-03-13' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (84, 13, 343000.0000, N'MOMO', N'12312312', CAST(N'2024-03-13' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (85, 13, 343000.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-13' AS Date), 976100900)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (86, 13, 0.0000, N'PAYPAL', N'da nang', CAST(N'2024-03-13' AS Date), 976100900)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill_Detail] ON 

INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (1, 1, N'ISBN123456', 1, 15.9900)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (2, 2, N'ISBN234567', 1, 10.9900)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (3, 3, N'ISBN678901', 1, 13.7900)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (4, 4, N'ISBN567890', 1, 14.2500)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (5, 5, N'ISBN901234', 1, 12.9900)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (6, 6, N'ISBN345678', 1, 18.7500)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (7, 7, N'ISBN890123', 1, 19.9900)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (8, 8, N'ISBN012345', 1, 22.9900)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (9, 9, N'ISBN789012', 1, 20.4900)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (10, 10, N'ISBN456789', 1, 16.4900)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (11, 11, N'ISBN123472', 8, 400.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (12, 13, N'ISBN123456', 1, 50.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (13, 14, N'ISBN123472', 1, 42.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (14, 15, N'ISBN123475', 3, 120.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (15, 16, N'ISBN123492', 1, 50.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (16, 17, N'123456', 2, 40.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (17, 17, N'ISBN101010', 1, 30.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (18, 18, N'ISBN101010', 1, 29.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (19, 19, N'ISBN123473', 1, 30.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (20, 20, N'ISBN012345', 1, 45.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (21, 21, N'ISBN012345', 1, 44.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (22, 22, N'123456', 1, 18.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (23, 23, N'123456', 1, 17.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (24, 24, N'ISBN123481', 1, 65.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (25, 25, N'ISBN123473', 1, 29.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (26, 26, N'123456', 1, 16.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (27, 27, N'ISBN123456', 1, 49.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (28, 28, N'ISBN123473', 1, 28.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (29, 29, N'ISBN123473', 1, 27.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (30, 30, N'123456', 1, 15.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (31, 31, N'123456', 1, 14.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (32, 32, N'123456', 1, 13.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (33, 33, N'ISBN012345', 1, 43.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (34, 34, N'123456', 1, 12.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (35, 35, N'123456', 1, 11.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (36, 36, N'123456', 1, 10.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (37, 37, N'123456', 1, 9.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (38, 38, N'ISBN101010', 1, 28.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (39, 39, N'ISBN101010', 1, 27.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (40, 40, N'ISBN101010', 1, 26.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (41, 41, N'ISBN101010', 1, 25.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (42, 42, N'ISBN101010', 1, 24.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (43, 43, N'ISBN101010', 1, 23.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (44, 44, N'123456', 1, 8.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (45, 45, N'ISBN012345', 1, 42.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (46, 46, N'123456', 1, 7.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (47, 47, N'123456', 1, 6.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (48, 48, N'123456', 1, 5.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (49, 49, N'123456', 1, 4.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (50, 50, N'123456', 1, 3.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (51, 51, N'123456', 1, 2.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (52, 52, N'123456', 1, 1.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (53, 53, N'ISBN123473', 1, 26.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (54, 54, N'ISBN012345', 1, 41.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (55, 55, N'ISBN123456', 1, 48.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (56, 56, N'ISBN123456', 1, 47.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (57, 57, N'ISBN123473', 1, 25.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (58, 58, N'ISBN123473', 1, 24.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (59, 59, N'ISBN123456', 1, 46.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (60, 60, N'ISBN123472', 11, 451.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (61, 61, N'ISBN123472', 1, 30.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (62, 62, N'ISBN123473', 1, 23.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (63, 63, N'ISBN012345', 1, 40.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (64, 64, N'ISBN123456', 1, 45.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (65, 65, N'ISBN123456', 2, 88.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (66, 66, N'ISBN123474', 1, 25.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (67, 67, N'ISBN123472', 1, 29.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (68, 68, N'ISBN012345', 1, 39.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (69, 69, N'ISBN123456', 1, 42.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (70, 70, N'ISBN123456', 2, 82.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (71, 71, N'ISBN123456', 1, 39.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (72, 72, N'ISBN123473', 1, 22.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (73, 73, N'ISBN123475', 1, 37.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (74, 74, N'123456', 1, 100.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (75, 75, N'123456', 1, 99.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (76, 76, N'ISBN123475', 1, 36.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (77, 77, N'123456', 1, 98.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (78, 78, N'ISBN123473', 1, 21.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (79, 79, N'123456', 1, 97.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (80, 80, N'123456', 1, 96.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (81, 81, N'123456', 1, 95.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (82, 82, N'123456', 1, 94.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (83, 83, N'123456', 1, 93.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (84, 84, N'123456', 1, 92.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (85, 85, N'123456', 1, 91.0000)
SET IDENTITY_INSERT [dbo].[Bill_Detail] OFF
GO
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'123456', 1, N'The Hunger', N'Author', 343000.0000, N'Book', 90, N'images/book42.jpg', CAST(N'2018-03-06' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN012345', 9, N'Sapiens: A Brief History of Humankind', N'Yuval Noah Harari', 13000.0000, N'A history book by Yuval Noah Harari', 38, N'images/book1.jpg', CAST(N'2011-04-04' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN101010', 11, N'Misery', N'Stephen King', 200000.0000, N'A horror novel by Stephen King', 22, N'images/book2.jpg', CAST(N'1987-06-08' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN111111', 11, N'It', N'Stephen King', 150000.0000, N'A horror novel by Stephen King', 50, N'images/book3.jpg', CAST(N'1986-09-15' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123456', 1, N'To Kill a Mockingbird', N'Harper Lee', 230000.0000, N'A classic novel by Harper Lee', 38, N'images/book4.jpg', CAST(N'1960-07-11' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123472', 1, N'1984', N'George Orwell', 236322.0000, N'A dystopian novel by George Orwell', 28, N'images/book12.jpg', CAST(N'1949-06-08' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123473', 2, N'Becoming', N'Michelle Obama', 300000.0000, N'A memoir by Michelle Obama', 20, N'images/book5.jpg', CAST(N'2018-11-13' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123474', 3, N'Foundation', N'Isaac Asimov', 231421.0000, N'A science fiction novel by Isaac Asimov', 24, N'images/book16.jpg', CAST(N'1951-05-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123475', 4, N'The Girl on the Train', N'Paula Hawkins', 2345621.0000, N'A psychological thriller novel by Paula Hawkins', 35, N'images/book6.jpg', CAST(N'2015-01-13' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123476', 5, N'The Catcher in the Rye', N'J.D. Salinger', 674313.0000, N'A coming-of-age novel by J.D. Salinger', 35, N'images/book13.jpg', CAST(N'1951-07-16' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123477', 6, N'Sense and Sensibility', N'Jane Austen', 735678.0000, N'A romantic novel by Jane Austen', 55, N'images/book7.jpg', CAST(N'1811-10-30' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123478', 7, N'Harry Potter and the Chamber of Secrets', N'J.K. Rowling', 456723.0000, N'Second book in the Harry Potter series', 60, N'images/book14.jpg', CAST(N'1998-07-02' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123479', 8, N'Leonardo da Vinci', N'Walter Isaacson', 742412.0000, N'A biography of Leonardo da Vinci by Walter Isaacson', 20, N'images/book8.jpg', CAST(N'2017-10-17' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123480', 9, N'Guns, Germs, and Steel', N'Jared Diamond', 735213.0000, N'A history book by Jared Diamond', 45, N'images/book9.jpg', CAST(N'1997-03-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123481', 10, N'Atomic Habits', N'James Clear', 182342.0000, N'A self-help book by James Clear', 64, N'images/book10.jpg', CAST(N'2018-10-16' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123482', 1, N'The Great Gatsby', N'F. Scott Fitzgerald', 197392.0000, N'A novel by F. Scott Fitzgerald', 60, N'images/book11.jpg', CAST(N'1925-04-10' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123484', 3, N'Hyperion', N'Dan Simmons', 293345.0000, N'A science fiction novel by Dan Simmons', 35, N'images/book17.jpg', CAST(N'1989-05-26' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123485', 4, N'The Silent Patient', N'Alex Michaelides', 234512.0000, N'A psychological thriller novel by Alex Michaelides', 30, N'images/book18.jpg', CAST(N'2019-02-05' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123486', 5, N'The Picture of Dorian Gray', N'Oscar Wilde', 244521.0000, N'A philosophical novel by Oscar Wilde', 55, N'images/book15.jpg', CAST(N'1890-07-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123487', 6, N'Emma', N'Jane Austen', 256731.0000, N'A novel by Jane Austen', 50, N'images/book19.jpg', CAST(N'1815-12-23' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123488', 7, N'Harry Potter and the Prisoner of Azkaban', N'J.K. Rowling', 123576.0000, N'Third book in the Harry Potter series', 65, N'images/book20.jpg', CAST(N'1999-07-08' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123489', 8, N'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future', N'Ashlee Vance', 184567.0000, N'A biography of Elon Musk by Ashlee Vance', 25, N'images/book21.jpg', CAST(N'2015-05-19' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123490', 9, N'The Omnivore''s Dilemma', N'Michael Pollan', 135622.0000, N'A non-fiction book by Michael Pollan', 40, N'images/book22.jpg', CAST(N'2006-04-11' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123491', 6, N'Jane Eyre', N'Charlotte Brontë', 167824.0000, N'A classic novel by Charlotte Brontë', 30, N'images/book23.jpg', CAST(N'1847-10-16' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123492', 2, N'The Alchemist', N'Paulo Coelho', 154732.0000, N'A philosophical novel by Paulo Coelho', 49, N'images/book24.jpg', CAST(N'1988-01-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN222222', 11, N'The Shining', N'Stephen King', 190000.0000, N'A horror novel by Stephen King', 40, N'images/book25.jpg', CAST(N'1977-01-28' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN234567', 6, N'Pride and Prejudice', N'Jane Austen', 157321.0000, N'A romantic novel by Jane Austen', 55, N'images/book34.jpg', CAST(N'1813-01-28' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN333333', 11, N'Pet Sematary', N'Stephen King', 260000.0000, N'A horror novel by Stephen King', 35, N'images/book26.jpg', CAST(N'1983-11-14' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN345678', 3, N'Dune', N'Frank Herbert', 186793.0000, N'A science fiction novel by Frank Herbert', 25, N'images/book35.jpg', CAST(N'1965-06-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN444444', 11, N'Dracula', N'Bram Stoker', 150000.0000, N'A Gothic horror novel by Bram Stoker', 60, N'images/book27.jpg', CAST(N'1897-05-26' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN456789', 8, N'Steve Jobs', N'Walter Isaacson', 243474.0000, N'A biography of Steve Jobs by Walter Isaacson', 20, N'images/book36.jpg', CAST(N'2011-10-24' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN555555', 11, N'The Exorcist', N'William Peter Blatty', 160000.0000, N'A horror novel by William Peter Blatty', 30, N'images/book28.jpg', CAST(N'1971-06-09' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN567890', 5, N'Gone Girl', N'Gillian Flynn', 267432.0000, N'A thriller novel by Gillian Flynn', 35, N'images/book37.jpg', CAST(N'2012-06-05' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN666666', 11, N'Frankenstein', N'Mary Shelley', 200000.0000, N'A science fiction horror novel by Mary Shelley', 55, N'images/book29.jpg', CAST(N'1818-01-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN667788', 11, N'World War Z', N'Max Brooks', 69000.0000, N'An Oral History of the Zombie War is a 2006 zombie apocalyptic horror novel', 69, N'images/book30.jpg', CAST(N'2006-09-12' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN678901', 10, N'The Subtle Art of Not Giving a F*ck', N'Mark Manson', 287634.0000, N'A self-help book by Mark Manson', 65, N'images/book38.jpg', CAST(N'2016-09-13' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN777777', 11, N'The Haunting of Hill House', N'Shirley Jackson', 290000.0000, N'A horror novel by Shirley Jackson', 45, N'images/book31.jpg', CAST(N'1959-10-16' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN789012', 2, N'Educated: A Memoir', N'Tara Westover', 274232.0000, N'A memoir by Tara Westover', 30, N'images/book39.jpg', CAST(N'2018-02-20' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN888888', 11, N'Bird Box', N'Josh Malerman', 150000.0000, N'A horror novel by Josh Malerman', 25, N'images/book32.jpg', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN890123', 7, N'Harry Potter and the Sorcerer''s Stone', N'J.K. Rowling', 256264.0000, N'A fantasy novel by J.K. Rowling', 60, N'images/book40.jpg', CAST(N'1997-06-26' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN901234', 4, N'The Da Vinci Code', N'Dan Brown', 242363.0000, N'A mystery thriller novel by Dan Brown', 40, N'images/book41.jpg', CAST(N'2003-03-18' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN999999', 11, N'The Silence of the Lambs', N'Thomas Harris', 169000.0000, N'A psychological horror thriller by Thomas Harris', 20, N'images/book33.jpg', CAST(N'1988-05-01' AS Date))
GO
INSERT [dbo].[Cart] ([CartID], [UserID], [BookID], [BookName], [BookImgURL], [BookPrice], [Total], [Quantity]) VALUES (1, 1, N'ISBN123456', N'To Kill a Mockingbird', N'mockingbird.jpg', 15.99, 15.99, 1)
INSERT [dbo].[Cart] ([CartID], [UserID], [BookID], [BookName], [BookImgURL], [BookPrice], [Total], [Quantity]) VALUES (2, 2, N'ISBN234567', N'Pride and Prejudice', N'prideprejudice.jpg', 10.99, 10.99, 1)
INSERT [dbo].[Cart] ([CartID], [UserID], [BookID], [BookName], [BookImgURL], [BookPrice], [Total], [Quantity]) VALUES (3, 3, N'ISBN678901', N'The Subtle Art of Not Giving a F*ck', N'subtleart.jpg', 13.79, 13.79, 1)
INSERT [dbo].[Cart] ([CartID], [UserID], [BookID], [BookName], [BookImgURL], [BookPrice], [Total], [Quantity]) VALUES (4, 4, N'ISBN567890', N'Gone Girl', N'gonegirl.jpg', 14.25, 14.25, 1)
INSERT [dbo].[Cart] ([CartID], [UserID], [BookID], [BookName], [BookImgURL], [BookPrice], [Total], [Quantity]) VALUES (5, 5, N'ISBN901234', N'The Da Vinci Code', N'davinci.jpg', 12.99, 12.99, 1)
INSERT [dbo].[Cart] ([CartID], [UserID], [BookID], [BookName], [BookImgURL], [BookPrice], [Total], [Quantity]) VALUES (6, 6, N'ISBN345678', N'Dune', N'dune.jpg', 18.75, 18.75, 1)
INSERT [dbo].[Cart] ([CartID], [UserID], [BookID], [BookName], [BookImgURL], [BookPrice], [Total], [Quantity]) VALUES (7, 7, N'ISBN890123', N'Harry Potter and the Sorcerer''s Stone', N'harrypotter.jpg', 19.99, 19.99, 1)
INSERT [dbo].[Cart] ([CartID], [UserID], [BookID], [BookName], [BookImgURL], [BookPrice], [Total], [Quantity]) VALUES (8, 8, N'ISBN012345', N'Sapiens: A Brief History of Humankind', N'sapiens.jpg', 22.99, 22.99, 1)
INSERT [dbo].[Cart] ([CartID], [UserID], [BookID], [BookName], [BookImgURL], [BookPrice], [Total], [Quantity]) VALUES (9, 9, N'ISBN789012', N'Educated: A Memoir', N'educated.jpg', 20.49, 20.49, 1)
INSERT [dbo].[Cart] ([CartID], [UserID], [BookID], [BookName], [BookImgURL], [BookPrice], [Total], [Quantity]) VALUES (10, 10, N'ISBN456789', N'Steve Jobs', N'stevejobs.jpg', 16.49, 16.49, 1)
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'Fiction')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'Non-Fiction')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'Science Fiction')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'Mystery')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (5, N'Thriller')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (6, N'Romance')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (7, N'Fantasy')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (8, N'Biography')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (9, N'History')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (10, N'Self-Help')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([DiscountID], [DiscountType], [DiscountAmount], [Description]) VALUES (1, N'Genre', 10, N'10% discount for all books in the Fiction genre')
INSERT [dbo].[Discount] ([DiscountID], [DiscountType], [DiscountAmount], [Description]) VALUES (2, N'Genre', 15, N'15% discount for all books in the Romance genre')
INSERT [dbo].[Discount] ([DiscountID], [DiscountType], [DiscountAmount], [Description]) VALUES (3, N'AllGenre', 5, N'5% discount for all books')
INSERT [dbo].[Discount] ([DiscountID], [DiscountType], [DiscountAmount], [Description]) VALUES (4, N'Shipment', 2.5, N'$2.50 discount for shipping on all orders')
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (1, N'Fiction')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (2, N'Non-Fiction')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (3, N'Science Fiction')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (4, N'Mystery')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (5, N'Thriller')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (6, N'Romance')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (7, N'Fantasy')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (8, N'Biography')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (9, N'History')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (10, N'Self-Help')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (11, N'Horror')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (12, N'Humor')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'ISBN012345', 9, N'Sapiens: A Brief History of Humankind', 528000.0000, N'A history book by Yuval Noah Harari', 45, N'images/book9.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'ISBN123456', 1, N'To Kill a Mockingbird', 367000.0000, N'A classic novel by Harper Lee', 50, N'images/book1.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'ISBN234567', 6, N'Pride and Prejudice', 253000.0000, N'A romantic novel by Jane Austen', 55, N'images/book6.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'ISBN345678', 3, N'Dune', 431000.0000, N'A science fiction novel by Frank Herbert', 25, N'images/book3.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'ISBN456789', 8, N'Steve Jobs', 379000.0000, N'A biography of Steve Jobs by Walter Isaacson', 20, N'images/book8.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'ISBN567890', 5, N'Gone Girl', 327000.0000, N'A thriller novel by Gillian Flynn', 35, N'images/book5.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'ISBN678901', 10, N'The Subtle Art of Not Giving a F*ck', 317000.0000, N'A self-help book by Mark Manson', 65, N'images/book10.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'ISBN789012', 2, N'Educated: A Memoir', 471000.0000, N'A memoir by Tara Westover', 30, N'images/book2.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'ISBN890123', 7, N'Harry Potter and the Sorcerer''s Stone', 459000.0000, N'A fantasy novel by J.K. Rowling', 60, N'images/book7.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'ISBN901234', 4, N'The Da Vinci Code', 299000.0000, N'A mystery thriller novel by Dan Brown', 40, N'images/book4.jpg')
GO
INSERT [dbo].[Review] ([ReviewID], [BookID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (1, N'ISBN123456', 1, 5, N'Great book, highly recommend!', CAST(N'2024-03-05' AS Date))
INSERT [dbo].[Review] ([ReviewID], [BookID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (2, N'ISBN234567', 2, 4, N'Enjoyed reading this book.', CAST(N'2024-03-06' AS Date))
INSERT [dbo].[Review] ([ReviewID], [BookID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (3, N'ISBN678901', 3, 5, N'Life-changing book!', CAST(N'2024-03-07' AS Date))
INSERT [dbo].[Review] ([ReviewID], [BookID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (4, N'ISBN567890', 4, 3, N'Decent thriller.', CAST(N'2024-03-08' AS Date))
INSERT [dbo].[Review] ([ReviewID], [BookID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (5, N'ISBN901234', 5, 4, N'Interesting read.', CAST(N'2024-03-09' AS Date))
INSERT [dbo].[Review] ([ReviewID], [BookID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (6, N'ISBN345678', 6, 5, N'One of my favorite sci-fi novels.', CAST(N'2024-03-10' AS Date))
INSERT [dbo].[Review] ([ReviewID], [BookID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (7, N'ISBN890123', 7, 5, N'Love the Harry Potter series!', CAST(N'2024-03-11' AS Date))
INSERT [dbo].[Review] ([ReviewID], [BookID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (8, N'ISBN012345', 8, 4, N'Fascinating history book.', CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Review] ([ReviewID], [BookID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (9, N'ISBN789012', 9, 5, N'A must-read memoir.', CAST(N'2024-03-13' AS Date))
INSERT [dbo].[Review] ([ReviewID], [BookID], [UserID], [Rating], [Comment], [ReviewDate]) VALUES (10, N'ISBN456789', 10, 4, N'Insightful biography.', CAST(N'2024-03-14' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (1, N'Kweeen', N'john@example.com', N'123456', N'True')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (2, N'Jane Smith', N'jane@example.com', N'abc123', N'TRUE')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (3, N'Alice Johnson', N'alice@example.com', N'pass456', N'False')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (4, N'Bob Brown', N'bob@example.com', N'securepass', N'FALSE')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (5, N'Emma Wilson', N'emma@example.com', N'password', N'True')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (6, N'Michael Davis', N'michael@example.com', N'hello123', N'TRUE')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (7, N'Sophia Garcia', N'sophia@example.com', N'welcome', N'False')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (8, N'William Martinez', N'william@example.com', N'password456', N'True')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (9, N'Olivia Rodriguez', N'olivia@example.com', N'passpass', N'False')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (10, N'James Lee', N'james@example.com', N'test123', N'False')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (11, N'kweeen', N'thaihongtran1707@gmail.com', N'123456789', N'True')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (12, N'Tran Duy Thai', N'kweeen.17@gmail.com', N'thai1707', N'False')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (13, N'minh', N'minh2982004@gmail.com', N'123', N'True')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (14, N'', N'minh29820004@gmail.com', N'123', N'False')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Bill_Detail]  WITH CHECK ADD FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[Bill_Detail]  WITH CHECK ADD FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[Bill_Detail]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Bill_Detail]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
