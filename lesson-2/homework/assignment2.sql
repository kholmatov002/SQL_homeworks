-- Lesson 2.   < DML: Update, Alter, Truncate, Delete >

-- Basic-Level Tasks
-- 1-task.
create table Employees (EmpID int, Name varchar(50), Salary decimal(10,2))
select * from Employees  -- to see the process, using  select * from

-- 2-task. Inserting 3 records (single-row insert and multiple-row insert)
insert into Employees values (1, 'Alex', 2459.08)
insert into Employees values 
(2, 'John', 2325.05),
(3, 'Sarah', 3456.25);

-- 3-task.
update Employees
set salary = 7000
where EmpID = 1

-- 4-task.
delete from Employees
where EmpID = 2

-- 5-task.
-- DELETE - erasing specific rows from a table
-- TRUNCATE - erasing all the rows from a table. ( faster than 'DELETE')
-- DROP - removing the entire table. (Table is gone, nothing exists)

-- 6-task. Modify the Name column in the Employees table to VARCHAR(100)
alter table Employees
alter column name varchar(100)

-- 7-task.
alter table Employees
add Department varchar(50)
	select * from Employees

-- 8-task. 
alter table Employees
alter column Salary Float

-- 9-task.
create table Departments (DepartmentID int primary key, DepartmentName varchar(50))
select * from Departments

-- 10-task. Remove all records from the Employees table without deleting its structure.
truncate table Employees






--Intermediate-Level Tasks
-- 11-task. Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).
insert into Departments values
(1, 'Sales'),
(2, 'Human Resources'),
(3, 'Customer Service'),
(4, 'Operations Management'),
(5, 'Information Technology');

-- 12-task. Update the Department of all employees where Salary > 5000 to 'Management'.
update Employees
set Department = 'Management'
where Salary > 5000;

-- 13-task. Write a query that removes all employees but keeps the table structure intact.
truncate table Employees
-- This removes all records, but keeps the table structure.

-- 14-task. 
alter table Employees
drop column Department

-- 15-task. Rename the Employees table to StaffMembers using SQL commands.
exec sp_rename 'Employees', 'StaffMembers'
select * from StaffMembers

-- 16-task. Write a query to completely remove the Departments table from the database.
drop table Departments
-- This will delete the table and its data + structure permanently (not reversible unless you re-create it).





--Advanced-Level Tasks
-- 17-task. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
create table Products (ProductID int primary key, ProductName varchar(50), Category varchar(50), Price decimal(10,2), Quantity int)
select * from Products

-- 18-task. 

-- 19-task. 

-- 20- tasks.