-- Lesson-10. Joins


-- Easy - Level Tasks.

-- Task-1.
select E.Name, D.DepartmentName, E.Salary
from Employees E
join
Departments D
on E.DepartmentID = D.DepartmentID
where E.Salary > 50000

-- Task-2.
select C.FirstName, C.LastName, O.OrderDate
from Customers C
join
Orders O
on C.CustomerID = O.CustomerID
where year(OrderDate) = 2023

-- Task-3.
select Name, DepartmentName
from Employees E
left join
Departments D
on E.DepartmentID = D.DepartmentID

-- Task-4.
select s.SupplierName, p.ProductName
from Products p
right join
Suppliers s
on p.SupplierID = s.SupplierID

-- Task-5.
select o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
from Orders o
full join
Payments p
on o.OrderID = p.OrderID

-- Task-6.
select emp1.Name, emp2.Name as Manager
from Employees as emp1
left join
Employees as emp2
on  emp1.ManagerID = emp2.EmployeeID

-- Task-7.
select s.Name, c.CourseName
from Courses c
join 
Enrollments e
on c.CourseID = e.CourseID
join
Students s
on s.StudentID = e.StudentID
where CourseName = 'Math 101'

-- Task-8.
select c.FirstName, c.LastName, o.Quantity
from Customers c
join
Orders o
on c.CustomerID = o.CustomerID
where Quantity > 3

-- Task-9.
select e.Name, d.DepartmentName
from Employees e
join
Departments d
on e.DepartmentID = d.DepartmentID
where DepartmentName = 'Human Resources'





-- Medium -Level Tasks.

-- Task-10.
select d.DepartmentName, count(e.EmployeeID) as EmployeeCount
from Employees e
join Departments d 
on e.DepartmentID = d.DepartmentID
group by d.DepartmentName
having count(e.EmployeeID) > 5

-- Task-11.
select p.ProductID, p.ProductName
from Products p
left join Sales s 
on p.ProductID = s.ProductID
where s.ProductID IS NULL

-- Task-12.
select c.FirstName, c.LastName,
count(o.OrderID) as TotalOrders
from Customers c
join Orders o 
on c.CustomerID = o.CustomerID
group by c.FirstName, c.LastName
having count(o.OrderID) >= 1

-- Task-13.
select e.Name, d.DepartmentName
from Employees e
join
Departments d
on e.DepartmentID = d.DepartmentID

-- Task-14.

-- Task-15.
select o.OrderID, o.OrderDate, c.FirstName, c.LastName
from Orders o
join
Customers c
on o.CustomerID = c.CustomerID
where year(OrderDate) = 2022

-- Task-16.
select e.Name, e.Salary, d.DepartmentName
from Employees e
join
Departments d
on e.DepartmentID = d.DepartmentID
where DepartmentName = 'Sales' and Salary > 60000

-- Task-17.
select o.orderid, o.orderdate, p.Paymentdate, p.amount
from Orders o
join 
Payments p
on o.OrderID = p.OrderID

-- Task-18.
select p.ProductID, p.ProductName
from Products p
left join
Orders o
on p.ProductID = o.ProductID
where o.ProductID is null





-- Hard-Level Tasks.

-- Task-19.
select e.Name, e.Salary
from Employees e
join (
    select DepartmentID,
	avg(Salary) as AvgSalary
    from Employees
    group by DepartmentID
) deptAvg
  on e.DepartmentID = deptAvg.DepartmentID
where e.Salary > deptAvg.AvgSalary

-- Task-20.
select o.OrderID, o.OrderDate
from Orders o
left join 
Payments p
on o.OrderID = p.OrderID
where p.OrderID is null and o.OrderDate < '2020-01-01'

-- Task-21.
select ProductID, ProductName
from Products p
left join
Categories c
on p.Category = c.CategoryID
where CategoryID is null

-- Task-22.

-- Task-23.
select e.Name, d.DepartmentName
from Employees e
join
Departments d
on e.DepartmentID = d.DepartmentID
where d.DepartmentName like 'M%'

-- Task-24.
select s.SaleID, p.ProductName, s.SaleAmount
from Sales s
join
Products p
on s.ProductID = p.ProductID
where SaleAmount > 500

-- Task-25.
select s.studentid, s.Name
from Students s
left join
Enrollments e
on s.StudentID = e.StudentID
left join
Courses c
on c.CourseID = e.CourseID 
and c.CourseName = 'Math 101'
where c.CourseID is null

-- Task-26.
select o.OrderID, OrderDate, PaymentID
from Orders o
left join
Payments p
on o.OrderID = p.OrderID
where p.PaymentID IS NULL

-- Task-27.
select p.ProductID, p.ProductName, c.CategoryName
from Products p
left join
Categories c
on p.Category = C.CategoryID
where CategoryName in ('Electroncis' , 'Furniture')












