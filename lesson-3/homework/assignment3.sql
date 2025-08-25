create database assignment3
go
use assignment3


-- Lesson-3. Importing and Exporting Data.



-- Easy-Level Tasks.

-- Task-1.
-- Used to quickly load large amounts of data from a file (like .txt or .csv) directly into a SQL Server table. It's faster than when we do it manually by using INSERT INTO.

-- Task-2.
/*  CSV (Comma-Separated Values)
	TXT (Text files)
	XLS/XLSX (Excel files)
	XML (Extensible Markup Language)
*/

-- Task-3.
create table Products (ProductID int primary key, ProductName varchar(50), Price decimal(10,2))
select * from Products

-- Task-4.
insert into Products (ProductID, ProductName, Price)
values 
(1, 'Bike', 350.75),
(2, 'Ball', 50.00),
(3, 'Scooter', 1200.99);
select * from Products

-- Task-5.
-- NULL: Column can have no value (empty, no any records available)
-- NOT NULL: Column must always have a value (cannot be left empty, must be filled with record).

-- Task-6.
alter table Products
add constraint UQ_ProductName unique (ProductName)

-- Task-7.
-- This query selects all products with price above 700
select * from Products where price > 700

-- Task-8.
alter table Products
add CategoryID int
select * from Products

-- Task-9.
create table Categories (
CategoryID int primary key,
CategoryName varchar(50) unique
)
select * from Categories
 
 -- Task-10. 
 --Identity column is a column automatically generates numbers for each new rows
 -- Used for Primary keys. We don't need to manually insert IDs




 --Medium-Level Tasks

 -- Task-11.
 -- Use BULK INSERT to import data from a text file into the Products table.
 BULK INSERT Products
FROM 'C:\Data\Products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);
select* from Products
/* I created a text file named 'Products' and imported datas from that file.
   I started from 4th row in that txt file as I already made 3 rows in Products table. 
   CategoryID also added to the txt file as I added 'CategoryID' column to the table
*/


-- Task-12.
--Create a FOREIGN KEY in the Products table that references the Categories table.

alter table Products
add constraint FK_Products_Categories
foreign key (CategoryID) references Categories(CategoryID)

/*  Before I run this command, I should insert some information to 'Categories' table.
	Bcz no rows added to that table.
	We add records to 'Categories' table using 'insert into' command and we will run 'foregign key' command 
*/

insert into Categories values
(1, 'Vehicles'),
(2, 'Sports'),
(3, 'Accessories'),
(4, 'Toys'),
(5, 'Electronics')

select* from Categories
select* from Products

-- Task-13. 
/* 
	PRIMARY KEY: only one per table, can’t be NULL, uniquely identifies each row.
	UNIQUE KEY: multiple allowed per table, ensures uniqueness but can allow one NULL.
*/

-- Task-14.
alter table Products
add constraint CHK_Price
check (Price > 0)

select* from Products

-- Task-15.
alter table Products
add Stock int not null default 0  -- since the 'Stock' column shouldn't be empty, if no value is given, we use 'default 0'

-- Task-16.
select ProductID, ProductName, isnull(Price, 0) as Price from Products

-- Task-17.
/*
	Purpose of FOREIGN KEY constraints in SQL Server.
	A FOREIGN KEY keeps data consistent between tables:
	Ensures relationships (child must match parent).
	Prevents invalid data (you can’t insert a Product with a CategoryID that doesn’t exist)
*/






-- Hard-Level Tasks.

-- Task-18.
create table Customers (
CustomerID int primary key,
CustomerName varchar(50) not null,
Age int not null,
constraint CHK_Customers_Age check (Age >= 18)
)
select * from Customers

-- Task-19.
create table Task_19_order (
OrderID int identity(100, 10) primary key,
OrderName varchar (50) not null
)
select * from Task_19_order

-- Task-20. Don't have answer to that question, searched from Google couldn't understand.

-- Task-21.

-- Task-22.
create table Employees (
    EmpID int primary key,          -- Primary Key on EmpID
    EmpName varchar(50) not null,   -- Just a sample column
    Email varchar(100) unique       -- Unique Key on Email
);
select * from Employees

-- Task-23.