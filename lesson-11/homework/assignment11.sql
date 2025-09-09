-- Lesson-11. Homework Tasks


-- Easy -Level Tasks.

-- Task-1.
select o.OrderID, c.FirstName, c.LastName, o.OrderDate
from Orders o
left join
Customers c
on o.CustomerID = c.CustomerID
where year(OrderDate) > 2022

-- Task-2.
select e.Name, d.DepartmentName
from Employees e
join
Departments d
on e.DepartmentID = d.DepartmentID
where DepartmentName in ('Sales','Marketing')

-- Task-3.
select d.DepartmentName, max(Salary) as MaxSalary
from Employees e
join 
Departments d
on e.DepartmentID = d.DepartmentID
group by d.DepartmentName

-- Task-4.
select o.OrderId,
	   c.FirstName + ' ' + c.LastName as CustomerName,
	   o.OrderDate
from Customers c
join Orders o
on c.CustomerID = o.CustomerID and Country = 'USA'
where year(OrderDate) = 2023

-- Task-5.
select c.FirstName + ' ' + c.LastName as CustomerName,
	   count(OrderID) as TotalOrders
from Customers c
join Orders o
on C.CustomerID = o.CustomerID
group by FirstName, LastName

-- Task-6.
select p.ProductName, s.SupplierName
from Products p
join Suppliers s
on p.SupplierID = s.SupplierID and SupplierName in ('Gadget Supplies','Clothing Mart')

-- Task-7.
select c.FirstName + ' ' + c.LastName as CustomerName,
	   max(o.OrderDate) as MostRecentOrderDate
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID
group by c.FirstName, c.LastName





-- Medium - Level Tasks.

-- Task-8.
select c.FirstName + ' ' + c.LastName as CustomerName,
       o.TotalAmount as OrderTotal
from Customers  c
join Orders o
on c.CustomerID = o.CustomerID
where o.TotalAmount > 500

-- Task-9.
select p.ProductName, 
	   s.SaleDate,
	   s.SaleAmount
from Products p
join Sales s
on p.ProductID = s.ProductID
where year(SaleDate) = 2022 
	or SaleAmount > 400

-- Task-10.
select p.ProductName, 
	   sum(s.SaleAmount) as TotalSalesAmount
from Products p
join Sales s
on p.ProductID = s.ProductID
group by ProductName

-- Task-11.
select e.Name as EmployeeName,
	   d.DepartmentName,
	   e.Salary
from Employees e
join Departments d
on e.DepartmentID = d.DepartmentID
and d.DepartmentName = 'Human Resources'
where e.Salary > 60000

-- Task-12.
select p.ProductName,
	   s.SaleDate,
	   p.StockQuantity
from Products p
join Sales s
on p.ProductID = s.ProductID
where year(SaleDate) = 2023
and StockQuantity > 100

-- Task-13.
select e.Name as EmployeeName,
	   d.DepartmentName,
	   e.HireDate
from Employees e
join Departments d
on e.DepartmentID = d.DepartmentID
and DepartmentName = 'Sales'
where year(HireDate) = 2020





-- Hard - Level Tasks.

-- Task-14.
select c.FirstName + ' ' + c.LastName as CustomerName,
	   o.OrderID,
	   c.Address,
	   o.OrderDate
from Customers c
join Orders o
on c.CustomerID = o.CustomerID and Country = 'USA'
where c.Address like '[0-9][0-9][0-9][0-9]%'

-- Task-15.
select p.ProductName, 
	   c.CategoryName as Category,
	   s.SaleAmount
from Products p
join Categories c
on p.Category = c.CategoryID
join Sales s
on p.ProductID = s.ProductID
where C.CategoryName = 'Electronics'
or s.SaleAmount > 350

-- Task-16.
select c.CategoryName,
	   count(p.ProductName) as ProductCount
from Products p
join Categories c
on p.Category = c.CategoryID
group by CategoryName

-- Task-17.
select c.FirstName + ' ' + c.LastName as CustomerName,
	   c.City,
	   o.OrderID,
	   o.TotalAmount as OrderAmount
from Customers c
join Orders o
on c.CustomerID = o.CustomerID 
where City = 'Los Angeles' and TotalAmount > 300

-- Task-18.
select e.Name as EmployeeName,
	   d.DepartmentName
from Employees e
join Departments d
on e.DepartmentID = d.DepartmentID
where d.DepartmentName in ('Human Resources', 'Finance')
or e.Name like '%[a,e,i,o,u]%[a,e,i,o,u]%[a,e,i,o,u]%[a,e,i,o,u]%'

-- Task-19.
select e.Name as EmployeeName,
	   d.DepartmentName,
	   e.Salary
from Employees e
join Departments d
on e.DepartmentID = d.DepartmentID
where d.DepartmentName in ('Sales', 'Marketing')
and e.Salary > 60000
