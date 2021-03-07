USE [master]
GO

CREATE DATABASE SE1502_Assignment_Group04
GO

USE SE1502_Assignment_Group04
GO

CREATE TABLE tblAdmin(AdminID nvarchar(50) PRIMARY KEY, AdminPassword nvarchar(50) NOT NULL, AdminName nvarchar(100) NOT NULL)

CREATE TABLE tblCategory(CategoryID char(10) PRIMARY KEY NOT NULL, CategoryName nvarchar(50), 
		CategoryDescription nvarchar(200))


CREATE TABLE tblProduct(ProductID char(10) PRIMARY KEY NOT NULL, ProductName nvarchar(100) NOT NULL, ProductBrand nvarchar(100),
		ProductDescription nvarchar(200), ProductStatus nvarchar(50), Price nvarchar(50) , 
		ImageURL nvarchar(100), CategoryID char(10) FOREIGN KEY REFERENCES tblCategory(CategoryID) on delete cascade on update cascade)



CREATE TABLE tblUser(UserID nvarchar(50) PRIMARY KEY NOT NULL, UserPassword nvarchar(100) NOT NULL, 
						UserName nvarchar(100), UserEmail nvarchar(100), UserAddress nvarchar(150))



CREATE TABLE tblOrder(OrderID char(50) PRIMARY KEY NOT NULL, 
	UserID nvarchar(50) NOT NULL FOREIGN KEY REFERENCES tblUser(UserID) on delete cascade on update cascade)



CREATE TABLE tblOrderDetail(OrderDetailID nvarchar(50) PRIMARY KEY NOT NULL, 
	OrderID char(50) FOREIGN KEY REFERENCES tblOrder(OrderID) on delete cascade on update cascade, 
		ProductID char(10) FOREIGN KEY REFERENCES tblProduct(ProductID) on delete cascade on update cascade, Quantity INT)

	