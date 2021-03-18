USE [master]
GO

CREATE DATABASE SE1502_Assignment_Group04_test3
GO

USE SE1502_Assignment_Group04_test3
GO

CREATE TABLE tblCategory(CategoryID nvarchar(10) PRIMARY KEY NOT NULL, CategoryName nvarchar(50), 
		CategoryDescription nvarchar(200))


CREATE TABLE tblProduct(ProductID int PRIMARY KEY NOT NULL, ProductName nvarchar(100) NOT NULL, ProductBrand nvarchar(100),
		ProductDescription nvarchar(200), ProductStatus nvarchar(50), Price float , 
		ImageURL nvarchar(100), CategoryID nvarchar(10) FOREIGN KEY REFERENCES tblCategory(CategoryID) on delete cascade on update cascade)



CREATE TABLE tblUser(UserID nvarchar(50) PRIMARY KEY NOT NULL, UserPassword nvarchar(100) NOT NULL, 
						UserName nvarchar(100), UserEmail nvarchar(100), UserAddress nvarchar(150), UserRole nvarchar(5) DEFAULT 'user' )



CREATE TABLE tblOrder(OrderID int IDENTITY(100,5) PRIMARY KEY NOT NULL,   OrderDate date DEFAULT GETDATE(),
	UserID nvarchar(50) NOT NULL FOREIGN KEY REFERENCES tblUser(UserID) on delete cascade on update cascade)



CREATE TABLE tblOrderDetail(OrderDetailID int IDENTITY(1,1) PRIMARY KEY NOT NULL , 
	OrderID int FOREIGN KEY REFERENCES tblOrder(OrderID) on delete cascade on update cascade, 
		ProductID int FOREIGN KEY REFERENCES tblProduct(ProductID) on delete cascade on update cascade, Quantity INT)

	