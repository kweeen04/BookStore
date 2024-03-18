USE [Bookstore]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/18/2024 9:47:58 PM ******/
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
/****** Object:  Table [dbo].[Bill_Detail]    Script Date: 3/18/2024 9:47:58 PM ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 3/18/2024 9:47:58 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 3/18/2024 9:47:58 PM ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 3/18/2024 9:47:58 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 3/18/2024 9:47:58 PM ******/
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
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (17, 11, 6110097.9500, N'COD', N'Liên Chiểu', CAST(N'2024-03-06' AS Date), 935279798)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (18, 11, 600000.0000, N'COD', N'Hoa Hai', CAST(N'2024-03-10' AS Date), 796510005)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (19, 11, 119000.0000, N'COD', N'Hoa Hai', CAST(N'2024-03-11' AS Date), 796510005)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (20, 11, 119000.0000, N'COD', N'Liên Chiểu', CAST(N'2024-03-13' AS Date), 935279798)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (21, 11, 22926642.0000, N'COD', N'Liên Chiểu', CAST(N'2024-03-13' AS Date), 935279798)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (22, 11, 560000.0000, N'MOMO', N'Liên Chiểu', CAST(N'2024-03-16' AS Date), 935279798)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (23, 11, 1120000.0000, N'COD', N'Hoa Hai', CAST(N'2024-03-16' AS Date), 796510005)
INSERT [dbo].[Bill] ([BillID], [UserID], [Total], [Payment], [Address], [Date], [Phone]) VALUES (24, 11, 300000.0000, N'COD', N'Hoa Hai', CAST(N'2024-03-16' AS Date), 796510005)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill_Detail] ON 

INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (1, 1, N'ISBN123456', 1, 230000.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (2, 2, N'ISBN234567', 1, 157321.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (3, 3, N'ISBN678901', 1, 287634.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (4, 4, N'ISBN567890', 1, 267432.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (5, 5, N'ISBN901234', 1, 242363.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (6, 6, N'ISBN345678', 1, 186793.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (7, 7, N'ISBN890123', 1, 256264.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (8, 8, N'ISBN012345', 1, 13000.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (9, 9, N'ISBN789012', 1, 274232.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (10, 10, N'ISBN456789', 1, 243474.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (11, 11, N'ISBN123472', 8, 1890576.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (12, 13, N'ISBN123456', 1, 230000.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (13, 14, N'ISBN123472', 1, 236322.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (14, 15, N'ISBN123475', 3, 7036863.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (15, 16, N'ISBN123492', 1, 154732.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (16, 17, N'ISBN101010', 4, 476000.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (17, 17, N'ISBN111111', 1, 299000.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (18, 17, N'ISBN123473', 1, 300000.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (19, 17, N'ISBN123475', 1, 2345621.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (20, 17, N'ISBN123476', 1, 674313.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (21, 17, N'ISBN123477', 2, 1471356.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (22, 17, N'ISBN123487', 2, 513462.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (23, 17, N'ISBN123491', 1, 167824.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (24, 17, N'ISBN234567', 1, 157321.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (25, 17, N'ISBN345678', 1, 186793.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (26, 17, N'ISBN123484', 1, 293345.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (27, 18, N'ISBN123473', 2, 600000.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (28, 19, N'ISBN101010', 1, 119000.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (29, 20, N'ISBN101010', 1, 119000.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (30, 21, N'ISBN123476', 34, 22926642.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (31, 22, N'ISBN696969', 1, 560000.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (32, 23, N'ISBN696969', 2, 132.0000)
INSERT [dbo].[Bill_Detail] ([DetailID], [BillID], [BookID], [Quantity], [Price]) VALUES (33, 24, N'ISBN123473', 1, 300000.0000)
SET IDENTITY_INSERT [dbo].[Bill_Detail] OFF
GO
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN012345', 10, N'Sapiens: A Brief History of Humankind', N'Yuval Noah Harari', 13000.0000, N'A history book by Yuval Noah Harari', 30, N'images/book1.jpg', CAST(N'2011-04-04' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN101010', 11, N'Misery', N'Stephen King', 119000.0000, N'A horror novel by Stephen King', 24, N'images/book2.jpg', CAST(N'1987-06-08' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN111111', 11, N'It', N'Stephen King', 299000.0000, N'A horror novel by Stephen King', 49, N'images/book3.jpg', CAST(N'1986-09-15' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123456', 1, N'To Kill a Mockingbird', N'Harper Lee', 230000.0000, N'A classic novel by Harper Lee', 49, N'images/book4.jpg', CAST(N'1960-07-11' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123472', 1, N'1984', N'George Orwell', 236322.0000, N'A dystopian novel by George Orwell', 41, N'images/book12.jpg', CAST(N'1949-06-08' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123473', 2, N'Becoming', N'Michelle Obama', 300000.0000, N'A memoir by Michelle Obama', 26, N'images/book5.jpg', CAST(N'2018-11-13' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123474', 3, N'Foundation', N'Isaac Asimov', 231421.0000, N'A science fiction novel by Isaac Asimov', 25, N'images/book16.jpg', CAST(N'1951-05-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123475', 4, N'The Girl on the Train', N'Paula Hawkins', 2345621.0000, N'A psychological thriller novel by Paula Hawkins', 36, N'images/book6.jpg', CAST(N'2015-01-13' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123476', 5, N'The Catcher in the Rye', N'J.D. Salinger', 674313.0000, N'A coming-of-age novel by J.D. Salinger', 0, N'images/book13.jpg', CAST(N'1951-07-16' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123477', 6, N'Sense and Sensibility', N'Jane Austen', 735678.0000, N'A romantic novel by Jane Austen', 53, N'images/book7.jpg', CAST(N'1811-10-30' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123478', 7, N'Harry Potter and the Chamber of Secrets', N'J.K. Rowling', 456723.0000, N'Second book in the Harry Potter series', 60, N'images/book14.jpg', CAST(N'1998-07-02' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123479', 8, N'Leonardo da Vinci', N'Walter Isaacson', 742412.0000, N'A biography of Leonardo da Vinci by Walter Isaacson', 20, N'images/book8.jpg', CAST(N'2017-10-17' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123480', 9, N'Guns, Germs, and Steel', N'Jared Diamond', 735213.0000, N'A history book by Jared Diamond', 45, N'images/book9.jpg', CAST(N'1997-03-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123481', 10, N'Atomic Habits', N'James Clear', 182342.0000, N'A self-help book by James Clear', 65, N'images/book10.jpg', CAST(N'2018-10-16' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123482', 1, N'The Great Gatsby', N'F. Scott Fitzgerald', 197392.0000, N'A novel by F. Scott Fitzgerald', 60, N'images/book11.jpg', CAST(N'1925-04-10' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123484', 3, N'Hyperion', N'Dan Simmons', 293345.0000, N'A science fiction novel by Dan Simmons', 34, N'images/book17.jpg', CAST(N'1989-05-26' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123485', 4, N'The Silent Patient', N'Alex Michaelides', 234512.0000, N'A psychological thriller novel by Alex Michaelides', 30, N'images/book18.jpg', CAST(N'2019-02-05' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123486', 5, N'The Picture of Dorian Gray', N'Oscar Wilde', 244521.0000, N'A philosophical novel by Oscar Wilde', 55, N'images/book15.jpg', CAST(N'1890-07-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123487', 6, N'Emma', N'Jane Austen', 256731.0000, N'A novel by Jane Austen', 48, N'images/book19.jpg', CAST(N'1815-12-23' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123488', 7, N'Harry Potter and the Prisoner of Azkaban', N'J.K. Rowling', 123576.0000, N'Third book in the Harry Potter series', 65, N'images/book20.jpg', CAST(N'1999-07-08' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123489', 8, N'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future', N'Ashlee Vance', 184567.0000, N'A biography of Elon Musk by Ashlee Vance', 25, N'images/book21.jpg', CAST(N'2015-05-19' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123490', 9, N'The Omnivore''s Dilemma', N'Michael Pollan', 135622.0000, N'A non-fiction book by Michael Pollan', 40, N'images/book22.jpg', CAST(N'2006-04-11' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123491', 6, N'Jane Eyre', N'Charlotte Brontë', 167824.0000, N'A classic novel by Charlotte Brontë', 29, N'images/book23.jpg', CAST(N'1847-10-16' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN123492', 2, N'The Alchemist', N'Paulo Coelho', 154732.0000, N'A philosophical novel by Paulo Coelho', 49, N'images/book24.jpg', CAST(N'1988-01-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN222222', 11, N'The Shining', N'Stephen King', 129000.0000, N'A horror novel by Stephen King', 40, N'images/book25.jpg', CAST(N'1977-01-28' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN234567', 6, N'Pride and Prejudice', N'Jane Austen', 157321.0000, N'A romantic novel by Jane Austen', 54, N'images/book34.jpg', CAST(N'1813-01-28' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN333333', 11, N'Pet Sematary', N'Stephen King', 114000.0000, N'A horror novel by Stephen King', 35, N'images/book26.jpg', CAST(N'1983-11-14' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN345678', 3, N'Dune', N'Frank Herbert', 186793.0000, N'A science fiction novel by Frank Herbert', 24, N'images/book35.jpg', CAST(N'1965-06-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN444444', 11, N'Dracula', N'Bram Stoker', 109000.0000, N'A Gothic horror novel by Bram Stoker', 60, N'images/book27.jpg', CAST(N'1897-05-26' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN456789', 8, N'Steve Jobs', N'Walter Isaacson', 243474.0000, N'A biography of Steve Jobs by Walter Isaacson', 20, N'images/book36.jpg', CAST(N'2011-10-24' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN555555', 11, N'The Exorcist', N'William Peter Blatty', 137000.0000, N'A horror novel by William Peter Blatty', 30, N'images/book28.jpg', CAST(N'1971-06-09' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN567890', 5, N'Gone Girl', N'Gillian Flynn', 267432.0000, N'A thriller novel by Gillian Flynn', 35, N'images/book37.jpg', CAST(N'2012-06-05' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN666666', 11, N'Frankenstein', N'Mary Shelley', 99000.0000, N'A science fiction horror novel by Mary Shelley', 55, N'images/book29.jpg', CAST(N'1818-01-01' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN667788', 11, N'World War Z', N'Max Brooks', 69000.0000, N'An Oral History of the Zombie War is a 2006 zombie apocalyptic horror novel', 69, N'images/book30.jpg', CAST(N'2006-09-12' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN678901', 10, N'The Subtle Art of Not Giving a F*ck', N'Mark Manson', 287634.0000, N'A self-help book by Mark Manson', 65, N'images/book38.jpg', CAST(N'2016-09-13' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN696969', 18, N'Mathematics', N'Alma Katsu', 560000.0000, N'A Physics Book', 64, N'images/book42.jpg', CAST(N'2018-03-06' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN777777', 11, N'The Haunting of Hill House', N'Shirley Jackson', 142000.0000, N'A horror novel by Shirley Jackson', 45, N'images/book31.jpg', CAST(N'1959-10-16' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN789012', 2, N'Educated: A Memoir', N'Tara Westover', 274232.0000, N'A memoir by Tara Westover', 30, N'images/book39.jpg', CAST(N'2018-02-20' AS Date))
INSERT [dbo].[Book] ([BookID], [GenreID], [BookName], [BookAuthor], [BookPrice], [BookDescribe], [Quantity], [ImgURL], [PublicationDate]) VALUES (N'ISBN888888', 11, N'Bird Box', N'Josh Malerman', 124000.0000, N'A horror novel by Josh Malerman', 25, N'images/book32.jpg', CAST(N'2014-03-01' AS Date))
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
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (13, N'Maths')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (16, N'Biology')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (17, N'Psychology')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (18, N'Physics')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (19, N'Crime')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (1, N'Kweeen', N'john@example.com', N'123456', N'True')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (2, N'Jane Smith', N'jane@example.com', N'abc123', N'True')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (3, N'Alice Johnson', N'alice@example.com', N'pass456', N'False')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (4, N'Bob Brown', N'bob@example.com', N'securepass', N'FALSE')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (5, N'Emma Wilson', N'emma@example.com', N'password', N'FALSE')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (6, N'Michael Davis', N'michael@example.com', N'hello123', N'TRUE')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (7, N'Sophia Garcia', N'sophia@example.com', N'welcome', N'False')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (8, N'William Martinez', N'william@example.com', N'password456', N'True')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (9, N'Olivia Rodriguez', N'olivia@example.com', N'passpass', N'False')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (10, N'James Lee', N'james@example.com', N'test123', N'False')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (11, N'kweeen', N'thaihongtran1707@gmail.com', N'123456789', N'True')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (12, N'Tran Duy Thai', N'kweeen.17@gmail.com', N'thai1707', N'False')
INSERT [dbo].[Users] ([UserID], [UserName], [UserEmail], [UserPass], [IsAdmin]) VALUES (13, N'Thai', N'yourkweeen@gmail.com', N'thai12323', N'false')
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
