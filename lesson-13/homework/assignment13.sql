--  Lesson - 13. Practice: String Functions, Mathematical Functions.

-- Easy Tasks.

-- Task-1.
select cast(EMPLOYEE_ID as varchar) + '-' + FIRST_NAME + ' ' + LAST_NAME as Employee_info
from Employees

-- Task-2.
update Employees
set phone_number = replace(phone_number, '124', '999')
where phone_number like '%124%'

-- Task-3.
select 
    first_name as [First Name],
    len(first_name) as [Name Length]
from Employees
where first_name like 'A%' 
   or first_name like 'J%' 
   or first_name like 'M%'
order by first_name

-- Task-4.
select MANAGER_ID,
	sum(Salary) as Total_Salary
from Employees
group by MANAGER_ID

-- Task-5.
select Year1,
	   greatest(Max1,Max2,Max3) as High_value
from TestMax

-- Task-6.
select id, movie, description
from cinema
where id % 2 = 1
and description <> 'boring'

-- Task-7.
select *
from SingleOrder
order by 
    case when Id = 0 then 1 else 0 end,
Id

-- Task-8.
	-- 1st option.
select 
    coalesce(ssn, passportid, itin) as FirstNonNull
from person

	--2nd option
select id,
	 case
        when ssn is not null then ssn
        when passportid is not null then passportid
        when itin is not null then itin
        else null
	 end as FirstNonNull
from person





--Medium Tasks

-- Task-1.
select 
    FullName,
    parsename(replace(FullName, ' ', '.'), 3) as FirstName,
    parsename(replace(FullName, ' ', '.'), 2) as MiddleName,
    parsename(replace(FullName, ' ', '.'), 1) as LastName
from Students

-- Task-2.
select distinct CustomerID, DeliveryState
from Orders 
where CustomerID in 
(
    select CustomerID
    from Orders
    where DeliveryState = 'CA'
)
and DeliveryState = 'TX'

-- Task-3.
select Product,
	   UnitPrice,
	   EffectiveDate
from Products
where UnitPrice > 100

-- Task-4.
select First_Name,
       Last_Name
from Employees
where (First_Name + Last_Name) LIKE '%a%a%a%'

-- Task-5.
select DEPARTMENT_ID,
	   hire_date,
	   count(EMPLOYEE_ID) as TotalEmps
from Employees
group by DEPARTMENT_ID  





-- Hard - Level Tasks.

-- Task-1.
select 
    s1.StudentID,
    s1.FullName,
    (
        select sum(s2.Grade)
        from Students s2
        where s2.StudentID <= s1.StudentID
    ) as CumulativeGrade
from Students s1
order by s1.StudentID

-- Task-2.
select s.StudentName, s.Birthday
from Student s
join (
    select Birthday
    from Student
    group by Birthday
    having count(*) > 1
) bday
on s.Birthday = bday.Birthday
order by s.Birthday, s.StudentName

-- Task-3.
-- 1st - way.
select 
    case when PlayerA < PlayerB then PlayerA else PlayerB end as Player1,
    case when PlayerA < PlayerB then PlayerB else PlayerA end as Player2,
    sum(Score) as TotalScore
from PlayerScores

group by 
    case when PlayerA < PlayerB then PlayerA else PlayerB end,
    case when PlayerA < PlayerB then PlayerB else PlayerA end
order by Player1, Player2


-- 2nd - way.
select 
    Player1,
    Player2,
    sum(Score) as TotalScore
from (
    select 
        case when PlayerA < PlayerB then PlayerA else PlayerB end as Player1,
        case when PlayerA < PlayerB then PlayerB else PlayerA end as Player2,
        Score
    from PlayerScores
) as T1
group by Player1, Player2
order by Player1, Player2


-- Task-4.
declare @my_str varchar(30) = 'tf56sd#%OqH',
@checker int = 1, @uppercase varchar(30) = '', @lowercase varchar(30) = '', @integers varchar(30) = '',
@other_chars varchar(30) = ''

while @checker <= len(@my_str)
begin

if ASCII(SUBSTRING(@my_str, @checker, 1)) between 48 and 57
  set @integers = @integers + SUBSTRING(@my_str, @checker, 1)
else if ASCII(SUBSTRING(@my_str, @checker, 1)) between 65 and 90
  set @uppercase = @uppercase + SUBSTRING(@my_str, @checker, 1)
else if ASCII(SUBSTRING(@my_str, @checker, 1)) between 97 and 122
  set @lowercase = @lowercase + SUBSTRING(@my_str, @checker, 1)
else
  set @other_chars = @other_chars + SUBSTRING(@my_str, @checker, 1)
set @checker = @checker + 1

end

select @uppercase as uppercase, @lowercase as lowercase, @integers as integers, @other_chars as other_chars