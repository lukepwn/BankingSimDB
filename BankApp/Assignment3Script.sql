/* Create databse 
*/
CREATE DATABASE [CarSalesDB]
GO

/* Open database 
*/
USE CarSalesDB; 
GO

CREATE TABLE [dbo].[Customers] (
    [CustId]   INT      IDENTITY (1, 1)	 NOT NULL,
    [CustName] VARCHAR (30)              NOT NULL,
    [Address]  VARCHAR (50)				 NOT NULL,
	[Postal]   VARCHAR (10)				 NOT NULL,
    [PhoneNo]  BIGINT					 NOT NULL,
	[Email]    VARCHAR (30)				 NOT NULL,
	[Password] VARCHAR (30)				 NOT NULL,

	CONSTRAINT [PK_CustomerS_CustId] PRIMARY KEY ([CustId])
);

CREATE TABLE [dbo].[Orders] (
	[OrderId] INT		IDENTITY (1, 1)	 NOT NULL,
    [CustId]  INT						 NOT NULL,
    [Brand]   VARCHAR (20)				 NOT NULL,
    [Model]   VARCHAR (20)				 NOT NULL,
    [Year]    INT						 NOT NULL, 
	[Color]   VARCHAR (20)				 NOT NULL,
	[Price]   INT						 NOT NULL,

	CONSTRAINT [PK_Orders_OrderId] PRIMARY KEY ([OrderId]),
	CONSTRAINT [FK_Orders_CustId] FOREIGN KEY ([CustId]) REFERENCES [dbo].[Customers] ([CustId])
);

INSERT INTO dbo.Customers (CustName, Address, Postal, PhoneNo, Email, Password)
VALUES ('Max', 'oakville', 'l5j4h2', 9054655598, 'max@gmail.com', '123');