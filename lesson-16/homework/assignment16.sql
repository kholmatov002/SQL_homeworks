-- Lesson - 16. CTEs and Derived Tables

-- Easy Tasks.

-- Task-1.
declare @nums int         -- 11111111111111111111111111111111111111111111111111111111111111111111111111
select @nums

-- Task-2.
select e.FirstName, e.LastName, dt.TotalSales
from Employees e
join (
    select EmployeeID, sum(SalesAmount) as TotalSales
    from Sales
    group by EmployeeID
) dt
    on e.EmployeeID = dt.EmployeeID;

-- Task-3.
with cte as (
	select avg(salary) as Avg_Salary
	from Employees
)
select Avg_Salary 
from cte

-- Task-4.
select p.ProductID,
	   p.ProductName,
	   dt.Highest_sales
from Products p
join (
	select productid,
		   sum(salesamount) as Highest_sales
	from Sales
	group by ProductID
) dt
on p.ProductID = dt.ProductID

-- Task-5.
with Numbers as (
    -- Anchor member: start with 1
    select 1 as num
    union all
    -- Recursive member: keep doubling
    select num * 2
    from Numbers
    where num * 2 < 1000000
)
select num
from Numbers

-- Task-6.
with cte as (
	select e.Employeeid,
		   e.firstname,
		   e.lastname,
		   count(salesid) as Total_Sales
		   from Employees e
		   join sales s
		   on s.EmployeeID = e.EmployeeID
		   group by e.EmployeeID, FirstName, LastName
)
select 
	  employeeid,
	  firstname,
	  lastname,
	  total_sales
from cte
where Total_Sales > 5

-- Task-7.
with cte as (
		select s.ProductID,	
		sum(SalesAmount) as Total_Sales
		from Sales s
		group by s.ProductID
)
select  p.productid,
	    p.productname,
	    Total_sales
from cte
join products p
on p.productid = cte.ProductID
where Total_Sales > 500

-- Task-8.
with avgsalary as(
		select avg(Salary) as avg_salary
		from Employees
)
select EmployeeID,
	   FirstName,
	   LastName,
	   Salary,
	   avg_salary
from Employees e
cross join avgsalary a
where e.Salary > a.avg_salary





-- Medium Tasks.
-- Task-1.
SELECT top 5
    e.employeeid,
    e.firstname,
    e.lastname,
    t.order_count
FROM (
    SELECT 
        s.employeeid,
        COUNT(s.SalesID) AS order_count
    FROM Sales s
    GROUP BY s.employeeid
) t
JOIN Employees e 
ON e.employeeid = t.employeeid
ORDER BY t.order_count DESC

-- Task-2.
select p.CategoryID,
	   sum(t.TotalSales) as Total_Sales
from (
	select 
		s.productid,
	    sum(SalesAmount) as TotalSales
	from Sales s
	group by s.ProductID
) t
join Products p
on p.ProductID = t.ProductID
group by p.CategoryID

-- Task-3.
--1111111111111111111111111111111111111111111111111111111111111111111111111

-- Task-4.

-- Task-5.
select sum(SalesAmount) as TotalSales
from Sales
group by month(SaleDate)

-- Task-5.
select sum(SalesAmount) as TotalSales
from Sales
group by EmployeeID




select * from Sales
select * from Employees









