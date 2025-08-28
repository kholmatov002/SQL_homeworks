-- Lesson 7. Aggregate Functions (MIN, MAX, COUNT, AVG, SUM). Filtering Aggregated Data with HAVING.



-- Easy-Level Tasks.

-- Task-1.
-- Write a query to find the minimum (MIN) price of a product in the Products table.
select
min(Price)
as MinPrrice
from Products

-- Task-2.
select
max(Salary)
as MaxSalary
from Employees

-- Task-3.

   --1st way
	select
	count(CustomerID)
	as TotalCustomers
	from Customers

   -- 2nd way
	select
	count(*)
	as TotalCustomers
	from Customers

-- Task-4.
select
count(distinct Category)
as UniqueCategories
from Products

-- Task-5.
select
sum(SaleAmount) as TotalSales
from Sales
where ProductID = 7

-- Task-6.

select
avg(Age) as AverageAge
from Employees

-- Task-7.
select DepartmentName, count(*) as EmployeeCount
from Employees
group by DepartmentName

-- Task-8.
select Category,
	min(Price) as MinPrice,
	max (Price) as MaxPrice
from Products
group by Category

-- Task-9.
select CustomerID,
	sum(SaleAmount) as TotalSales
from Sales
group by CustomerID

-- Task-10.
select DepartmentName,
	count (*) as TotalEmp
from Employees
group by DepartmentName
having 
count(*) > 5





-- Medium-Level Tasks. 

--Task-11.
select CustomerID,
	sum(SaleAmount) as TotalSales,
	avg(SaleAmount) as AverageSales
from Sales
group by CustomerID

-- Task-12. 
select count(*) as ToatlEmp
from Employees
where DepartmentName = 'HR'

-- Task-13.  
select DepartmentName,
max(Salary) as MaxSalary,
min(Salary) as MinSalary
from Employees
group by DepartmentName

-- Task-14. 
select DepartmentName,
avg(Salary) as AverageSalay
from Employees
group by DepartmentName

-- Task-15.

select DepartmentName,
avg(Salary) as AverageSalary,
count(*) as TotalEmp
from Employees
group by DepartmentName

-- Task-16.
select Category,
avg(Price) as AveragePrice
from Products
group by Category
having avg(Price) > 400

-- Task-17. Write a query that calculates the total sales for each year in the Sales table.
select year(SaleDate)as SaleYear,
sum(SaleAmount) as TotalAmount
from Sales
group by year(SaleDate)

-- Task-18. Write a query to show the list of customers who placed at least 3 orders.
   -- 1st, when '3 orders' means total items ordered.
		select CustomerID,
	    sum(Quantity) as TotalOrders
		from Orders
		group by CustomerID
		having sum(Quantity) >= 3

   -- 2nd, when '3 orders' means rows in Orders table.
		select CustomerID,
		count(*) as TotalOrders
		from Orders
		group by CustomerID
		having count(*) >= 3

-- Task-19.
select DepartmentName,
avg(Salary) as AverageSalary
from Employees
group by DepartmentName
having avg(Salary) > 60000





-- Hard-Level Tasks.

-- Task-20.
select Category,
avg(Price) as AveragePrice
from Products
group by Category
having avg(Price) > 150

-- Task-21.
select CustomerID,
sum(SaleAmount) as TotalSales
from Sales
group by CustomerID
having sum(SaleAmount) > 1500

-- Task-22.
select DepartmentName,
sum(Salary) as TotalSalary,
avg(Salary) as AverageSalary
from Employees
group by DepartmentName
having avg(Salary) > 65000

-- Task-23.

-- Task-24.
select year(OrderDate) as OrderYear,
       month(OrderDate) as OrderMonth,
       sum(TotalAmount) as TotalSales,
       count(distinct ProductID) as UniqueProducts
from Orders
group by year(OrderDate), month(OrderDate)
having count(distinct ProductID) >= 2

-- Task-25.
select year(OrderDate) as OrderYear,
       min(Quantity) as MinQuantity,
       max(Quantity) as MaxQuantity
from Orders
group by year(OrderDate)

