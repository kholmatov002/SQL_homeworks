-- Lesson-8. Practice.


-- Easy-Level Tasks.

-- Task-1.
select Category,
count(StockQuantity) as TotalProducts
from Products 
group by Category

-- Task-2.
select Category,
avg(Price) as AvgPrice
from Products 
where Category = 'Electronics'
group by Category

-- Task-3.
select FirstName,  LastName, City
from Customers
where City like 'L%'

-- Task-4.
select ProductName
from Products
where ProductName like '%er'

-- Task-5.
select FirstName, LastName, City
from Customers
where City like '%a'

-- Task-6.
select top 1 ProductName, Price
from Products
order by Price desc

-- Task-7.
select StockQuantity,
	case
		when StockQuantity < 30 then 'Low Stock'
		else 'Sufficent' end as 'Label Stocks'
from Products

-- Task-8.
select Country,
count(CustomerID) as TotalCustomers
from Customers
group by Country

-- Task-9.
select 
	max(Quantity) as MaxQuantity,
	min(Quantity) as MinQuantity
from Orders





-- Medium-Level Tasks.

-- Task-10.
select distinct CustomerID
from Orders
	where OrderDate between '2023-01-01' and '2023-01-31'
    and CustomerID not in (select CustomerID from Invoices)

-- Task-11.
select ProductName
from Products
union all
select ProductName
from Products_Discounted

-- Task-12.
select ProductName
from Products
union 
select ProductName
from Products_Discounted

-- Task-13.
select year(OrderDate) as [Year],
avg(Quantity) as AvgOrder
from Orders
group by year(OrderDate) 

-- Task-14.
select ProductName,
	case
		when Price > 500 then 'High'
		when Price between 100 and 500 then 'Mid'
		else 'Low' end as 'PriceGroup'
from Products

-- Task-15.
select district_name, [2012], [2013]
into Population_Each_Year
from
(select district_name, Year, Population
    from City_Population) as SourceTable
pivot
(
    sum(Population)
    for Year in ([2012], [2013])
) as PivotTable

select * from Population_Each_Year

-- Task-16.
select ProductID,
	sum(SaleAmount) as TotalAmount
from Sales
group by ProductID

-- Task-17.
select ProductName 
from Products
where ProductName like '%oo%'

-- Task-18.
select Year, [Bektemir], [Chilonzor], [Yakkasaroy]
into Population_Each_City
from
(
    select district_name, Year, Population
    from City_Population
) as SourceTable
pivot
(
    sum(Population)
    for district_name in ([Bektemir], [Chilonzor], [Yakkasaroy])
) as PivotTable

select * from Population_Each_City





-- Hard-Level Tasks.

-- Task-19.
select top 3 CustomerID,
	sum(TotalAmount) as TotalAmont
from Invoices
group by CustomerID
order by TotalAmont desc

-- Task-20.
select district_name, Year, Population
from Population_Each_Year
unpivot
(
    Population for Year in ([2012], [2013])
) as UnpivotTable

-- Task-21.
select P.ProductName,
       count(S.SaleID) as TimesSold
from Products P
join Sales S
  on P.ProductID = S.ProductID
group by P.ProductName

-- Task-22.
select Year, City, Population
from Population_Each_City
unpivot
(
    Population for City in ([Bektemir], [Chilonzor], [Yakkasaroy])
) as UnpivotTable
















