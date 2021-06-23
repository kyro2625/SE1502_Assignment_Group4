USE [master]
GO
/****** Object:  Database [SE1502_Assignment_Group04]    Script Date: 19-Mar-21 3:58:02 PM ******/
CREATE DATABASE [SE1502_Assignment_Group04]
GO
USE [SE1502_Assignment_Group04]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 19-Mar-21 3:58:02 PM ******/
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
/****** Object:  Table [dbo].[tblOrder]    Script Date: 19-Mar-21 3:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderID] [int] IDENTITY(100,5) NOT NULL,
	[OrderDate] [smalldatetime] NULL,
	[UserID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__tblOrder__C3905BAF673168DB] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 19-Mar-21 3:58:02 PM ******/
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
/****** Object:  Table [dbo].[tblProduct]    Script Date: 19-Mar-21 3:58:02 PM ******/
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
/****** Object:  Table [dbo].[tblUser]    Script Date: 19-Mar-21 3:58:02 PM ******/
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
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'001', N'Football', N'American Football')
GO
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'002', N'Volleyball', N'In house play')
GO
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'003', N'Basketball', N'')
GO
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'004', N'Soccer Ball', N'Outdoor play')
GO
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'005', N'Beach Ball', N'')
GO
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (N'006', N'Boccia', N'Handball for Handicap player')
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (225, CAST(N'2021-03-19T13:39:00' AS SmallDateTime), N'nguyen')
GO
INSERT [dbo].[tblOrder] ([OrderID], [OrderDate], [UserID]) VALUES (230, CAST(N'2021-03-19T13:51:00' AS SmallDateTime), N'nguyen')
GO
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 
GO
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (9, 225, 1020, 2)
GO
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (10, 225, 1021, 2)
GO
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (11, 225, 1001, 1)
GO
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (12, 230, 1001, 1)
GO
INSERT [dbo].[tblOrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity]) VALUES (13, 230, 1020, 1)
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (1001, N'Futsal 2030', N'Geru Star', N'Brand new', N'In Stock', 200000, N'1', N'004')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (1020, N'Futsal Galaxy', N'Geru Star', N'New', N'Availabe', 220000, N'1', N'001')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (1021, N'S5 V-League', N'Geru Star', N'Premium', N'Just few left', 500000, N'1', N'004')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (1111, N'NUMBER 1', N'Geru Star', N'Type 3', N'Availabe exclusive for American', 600000, N'1', N'001')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (1112, N'NUMBER 2', N'Geru Star', N'American Football', N'Availabe exclusive for American', 456456, N'1', N'001')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (1222, N'S4 Tango', N'Geru Star', N'2014', N'Availabe', 100000, N'1', N'004')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (2003, N'V5 VTV CUP', N'Geru Star', N'VTV Exclusive', N'Few left', 600000, N'1', N'002')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (2222, N'V5 SAPPHIRE', N'Geru Star', N'Hot', N'In Stock', 234000, N'1', N'002')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (5003, N'B6 FEDERATION', N'Geru Star', N'HOT', N'Always Available', 500000, N'1', N'003')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (5004, N'B7 FEDERATION', N'Geru Star', N'Sales', N'In Stock', 550000, N'1', N'003')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (5010, N'B7 CHAMPION', N'Geru Star', N'On sales', N'Few left', 300000, N'1', N'003')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (5234, N'B6 TOURNAMENT', N'Geru Star', N'For travelling', N'Just few left', 240000, N'1', N'003')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (5445, N'B7 RAINBOW', N'Geru Star', N'New product', N'Just in stock', 120000, N'1', N'003')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (5551, N'B7 PROMASTER', N'Geru Star', N'Premium', N'Availabe', 700000, N'1', N'003')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (6006, N'BOCCIA PARAGAME', N'Geru Star', N'Cooperate with Japan', N'In Stock', 300000, N'1', N'006')
GO
INSERT [dbo].[tblProduct] ([ProductID], [ProductName], [ProductBrand], [ProductDescription], [ProductStatus], [Price], [ImageURL], [CategoryID]) VALUES (9001, N'PLAYGROUND', N'Geru Star', N'In house play', N'In Stock', 160000, N'1', N'002')
GO
INSERT [dbo].[tblUser] ([UserID], [UserPassword], [UserName], [UserEmail], [UserAddress], [UserRole]) VALUES (N'admin', N'123456', N'Tester', N'admin@gmail.com', N'HCM', N'admin')
GO
INSERT [dbo].[tblUser] ([UserID], [UserPassword], [UserName], [UserEmail], [UserAddress], [UserRole]) VALUES (N'admin2', N'123456', N'Bao Nguyen', N'nguyennvbse@gmail.com', N'HCM', N'admin')
GO
INSERT [dbo].[tblUser] ([UserID], [UserPassword], [UserName], [UserEmail], [UserAddress], [UserRole]) VALUES (N'admin3', N'123456', N'Dinh Thuan', N'thuan@gmail.com', N'HCM', N'admin')
GO
INSERT [dbo].[tblUser] ([UserID], [UserPassword], [UserName], [UserEmail], [UserAddress], [UserRole]) VALUES (N'admin4', N'123456', N'Kim Son', N'son@gmail.com', N'HCM', N'admin')
GO
INSERT [dbo].[tblUser] ([UserID], [UserPassword], [UserName], [UserEmail], [UserAddress], [UserRole]) VALUES (N'nguyen', N'1234', N'Bao Nguyen', N'nguyenseraph2625@gmail.com', N'Go Vap', N'user')
GO
INSERT [dbo].[tblUser] ([UserID], [UserPassword], [UserName], [UserEmail], [UserAddress], [UserRole]) VALUES (N'son', N'1234', N'Kim Son', N'sontpk@fpt.edu.vn', N'Quan 11', N'user')
GO
INSERT [dbo].[tblUser] ([UserID], [UserPassword], [UserName], [UserEmail], [UserAddress], [UserRole]) VALUES (N'thuan', N'1234', N'Dinh Thuann', N'thuanld@fpt.edu.vn', N'Quan 10', N'user')
GO
ALTER TABLE [dbo].[tblOrder] ADD  CONSTRAINT [DF__tblOrder__OrderD__2C3393D0]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[tblUser] ADD  DEFAULT ('user') FOR [UserRole]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblOrder__UserID__2E1BDC42] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblOrder__UserID__2E1BDC42]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__Order__2F10007B] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrder] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK__tblOrderD__Order__2F10007B]
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
ALTER DATABASE [SE1502_Assignment_Group04] SET  READ_WRITE 
GO
