-- Lesson-9. Joins (Only inner with table relationships)


-- Easy-Level Tasks.

-- Task-1.
select P.ProductName, S.SupplierName
from Products P
cross join
Suppliers S

-- Task-2.
select D.DepartmentName, E.Name
from Departments D
cross join
Employees E

-- Task-3.
select S.SupplierName, P.ProductName 
from Products P
join
Suppliers S
on P.SupplierID = S.SupplierID

-- Task-4.
select C.FirstName, C.LastName, O.OrderID
from Orders O
join
Customers C
on O.CustomerID = C.CustomerID

-- Task-5.
select C.CourseName, S.Name 
from Courses C
cross join Students S

-- Task-6.
select P.ProductName, O.OrderID
from Products P
join Orders O
on P.ProductID = O.ProductID

-- Task-7.
select E.Name, D.DepartmentName
from Employees E
join Departments D
on E.DepartmentID = D.DepartmentID

-- Task-8.
select S.Name, E.CourseID
from Students S
join Enrollments E
on S.StudentID = E.StudentID

-- Task-9.
select O.CustomerID, P.PaymentID
from Payments P
join Orders O
on P.OrderID = O.OrderID

-- Task-10.
select P.Price, O.OrderID
from Products P
join Orders O
on P.ProductID = O.ProductID
where P.Price > 100





-- Medim Level Tasks.
 
-- Task-11.
select E.Name, D.DepartmentName
from Employees E
cross join Departments D
where E.DepartmentID <> D.DepartmentID

-- Task-12.
select o.OrderID, p.ProductName, o.Quantity, p.StockQuantity
from Orders o
join Products p
on o.ProductID = p.ProductID
where o.Quantity > p.StockQuantity

-- Task-13.
select C.FirstName, C.LastName, S.ProductID, S.SaleAmount
from Customers C
join Sales S
on C.CustomerID = S.CustomerID
where S.SaleAmount >= 500

-- Task-14.
select st.Name, c.CourseName
from Enrollments e
join Students st
on e.StudentID = st.StudentID
join Courses c
on e.CourseID = c.CourseID

-- Task-15.
select p.ProductName, s.SupplierName
from Products p
join Suppliers s
on p.SupplierID = s.SupplierID
where s.SupplierName like '%Tech%'

-- Task-16.
select o.OrderID, o.TotalAmount, p.Amount
from Orders o
join Payments p
on o.OrderID = p.OrderID
where p.Amount < o.TotalAmount

-- Task-17.
select e.Name, d.DepartmentName
from Employees e
join Departments d
on e.DepartmentID = d.DepartmentID

-- Task-18.
select p.ProductName, c.CategoryName
from Products p
JOIN Categories c
on p.Category = c.CategoryID
where c.CategoryName IN ('Electronics', 'Furniture')

-- Task-19.
select s.SaleID, s.ProductID, s.SaleAmount, c.FirstName, c.LastName, c.Country
from Sales s
JOIN Customers c
on s.CustomerID = c.CustomerID
where c.Country = 'USA'

-- Task-20.
select o.OrderID, o.TotalAmount, c.FirstName, c.LastName, c.Country
from Orders o
JOIN Customers c
on o.CustomerID = c.CustomerID
where c.Country = 'Germany'
and o.TotalAmount > 100





-- Hard Level Tasks.

-- Task-21.

-- Task-22.
select p.PaymentID, o.OrderID, p.Amount, 
       (o.Quantity * pr.Price) AS ExpectedAmount
from Payments p
JOIN Orders o 
	on p.OrderID = o.OrderID
JOIN Products pr 
	on o.ProductID = pr.ProductID
WHERE p.Amount <> (o.Quantity * pr.Price)

-- Task-23.
select s.StudentID, s.Name -- , e.CourseID to check the NULLs
from Students s
LEFT JOIN Enrollments e 
on s.StudentID = e.StudentID
where e.CourseID is null

-- Task-24.

-- Task-25.
select c.CustomerID, c.FirstName, c.LastName, o.OrderID
from Customers c
JOIN Orders o 
	on c.CustomerID = o.CustomerID
LEFT JOIN Payments p 
	on o.OrderID = p.OrderID
where p.PaymentID is null
