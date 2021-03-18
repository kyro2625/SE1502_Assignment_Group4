USE [master]
GO
/****** Object:  Database [SE1502_Assignment_Group04_test3]    Script Date: 18-Mar-21 7:07:38 PM ******/
CREATE DATABASE [SE1502_Assignment_Group04_test3]
GO 
USE [SE1502_Assignment_Group04_test3]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 18-Mar-21 7:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryID] [nvarchar](10) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[CategoryDescription] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 18-Mar-21 7:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderID] [int] IDENTITY(100,5) NOT NULL,
	[OrderDate] [date] NULL,
	[UserID] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 18-Mar-21 7:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 18-Mar-21 7:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductBrand] [nvarchar](100) NULL,
	[ProductDescription] [nvarchar](200) NULL,
	[ProductStatus] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[ImageURL] [nvarchar](100) NULL,
	[CategoryID] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 18-Mar-21 7:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserID] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[UserEmail] [nvarchar](100) NULL,
	[UserAddress] [nvarchar](150) NULL,
	[UserRole] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'001', N'Football', N'sad6a4s5')
GO
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'002', N'BasketBall', N'')
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (100, CAST(N'2021-03-18' AS Date), N'nguyen')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (105, CAST(N'2021-03-18' AS Date), N'nguyen')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (120, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (125, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (130, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (135, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (140, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (145, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (150, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (155, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (160, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (165, CAST(N'2021-03-18' AS Date), N'nguyen')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (170, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (175, CAST(N'2021-03-18' AS Date), N'nguyen')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (180, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (185, CAST(N'2021-03-18' AS Date), N'test')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (190, CAST(N'2021-03-18' AS Date), N'nguyen')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (195, CAST(N'2021-03-18' AS Date), N'nguyen')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (200, CAST(N'2021-03-18' AS Date), N'nguyen')
GO
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 
GO
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (1, 195, 1001, 1)
GO
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (2, 195, 9914, 1)
GO
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (3, 200, 1001, 1)
GO
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (4, 200, 9914, 1)
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (1001, N'HP ProBook G7', N'Geru', N'sad6a4s5', N'sdas', 123456, N'1', N'001')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (9914, N'HP EliteBook G4', N'Geru', N'sad6a4s5', N'Availabe', 45646, N'1', N'002')
GO
INSERT [dbo].[tblUser] ([UserID], [UserPassword], [UserName], [UserEmail], [UserAddress], [UserRole]) VALUES (N'admin', N'123456', N'Tester', N'sdfhjksa', N'asdka', N'admin')
GO
INSERT [dbo].[tblUser] ([UserID], [UserPassword], [UserName], [UserEmail], [UserAddress], [UserRole]) VALUES (N'nguyen', N'123456', N'Bao Nguyen', N'a5s6+d54', N'das6d', N'user')
GO
INSERT [dbo].[tblUser] ([UserID], [UserPassword], [UserName], [UserEmail], [UserAddress], [UserRole]) VALUES (N'test', N'123456', N'BaoNguyen', N'', N'', N'user')
GO
INSERT [dbo].[tblUser] ([UserID], [UserPassword], [UserName], [UserEmail], [UserAddress], [UserRole]) VALUES (N'test1', N'123456', N'BaoNguyen', N'', N'', N'')
GO
ALTER TABLE [dbo].[tblOrder] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[tblUser] ADD  DEFAULT ('user') FOR [UserRole]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrder] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProduct] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategory] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [SE1502_Assignment_Group04_test3] SET  READ_WRITE 
GO
