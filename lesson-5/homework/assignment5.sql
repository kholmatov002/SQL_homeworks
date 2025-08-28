-- Lesson-5. Aliases, Unions, and Conditional columns.

-- Easy-Level Tasks.

-- Task-1.
select ProductName as Name
from Products

-- Task-2.
select Client.FirstName, Client.LastName
from Customers as Client

-- Task-3.
select ProductName from Products
union
select ProductName from Products_Discounted

--Task-4.
select ProductName from Products
intersect
select ProductName from Products_Discounted

--Task-5.
select distinct FirstName, Country
from Customers

-- Task-6.
select ProductName, Price,
case when Price > 1000 then 'High' 
else 'Low' end as 'PriceCategory'
from Products

-- Task-7.
select ProductName, StockQuantity,
iif(StockQuantity > 100, 'Yes', 'No') as InStock
from Products






-- Medium-Level Tasks.

-- Task-8.
select ProductName from Products
union 
select ProductName from Products_Discounted

-- Task-9.
	select ProductName from Products
	except 
	select ProductName from Products_Discounted

-- Task-10.
select ProductName, Price,
iif (Price > 1000, 'Expensive', 'Affordable') as PriceCategory
from Products

-- Task-11.
select * from Employees
where Age < 20 or Salary > 60000

-- Task-12.
update Employees
set Salary = 1.10 * Salary
where DepartmentName = 'HR' or EmployeeID = 5

select * from Employees






-- Hard-Level Tasks.

-- Task-13.
select SaleID,
       CustomerID, 
	   SaleAmount,
       case 
           when SaleAmount > 500 then'Top Tier'
		   when SaleAmount between 200 and 500 then 'Mid Tier'
           else 'Low Tier'
       end as SaleTier 
from Sales 

-- Task-14.
select CustomerID
from Orders
except
select CustomerID
from Sales

select * from Orders   -- to cehck  
select * from Sales    -- to check

-- Task-15.
select CustomerID,
       Quantity,
       case 
           when Quantity = 1 then 0.03
		   when Quantity between 200 and 500 then 0.05
           else 0.07
       end as DiscountPercentage 
from Orders

select * from Orders
