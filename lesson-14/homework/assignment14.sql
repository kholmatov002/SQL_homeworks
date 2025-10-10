-- Lesson - 14. Date and time Functions,Practice




-- Easy Tasks.

-- Task-1.
select 
    Name,
    left(Name, charindex(',', Name) - 1) as [Name],
    substring(Name, charindex(',', Name) + 1, len(Name)) as Surname
from TestMultipleColumns

-- Task-2.
select *
from TestPercent
where Strs like '%[%]%'

-- Task-3.
select 
	Vals,
	left(Vals, charindex('.', Vals) - 1) as Split_1,
	substring(Vals, charindex('.', Vals) + 1, len(Vals)) as Split_2
from Splitter

-- Task-4.
select *
from testDots
where len(Vals) - len(replace(Vals, '.', '')) > 2

-- Task-5.
select
    texts,
    len(texts) - len(replace(texts, ' ', '')) as SpaceCount
from CountSpaces

-- Task-6.
select 
    e.Name as Employee,
    e.Salary as EmployeeSalary,
    m.Name as Manager,
    m.Salary as ManagerSalary
from Employee e
join Employee m
    on e.ManagerId = m.Id
where e.Salary > m.Salary

-- Task-7.
select 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    datediff(YEAR, HIRE_DATE, getdate()) as YearsOfService
from Employees
where datediff(YEAR, HIRE_DATE, getdate()) > 10
  and datediff(YEAR, HIRE_DATE, getdate()) < 15




-- Medium Level Tasks.
-- Task-1.
select w1.Id
from weather w1
join weather w2
  on datediff(DAY, w2.RecordDate, w1.RecordDate) = 1
WHERE w1.Temperature > w2.Temperature

-- Task-2.
select
	player_id,
	min(event_date) as first_login 
from Activity
group by player_id

-- Task-3.


-- Task-4.
select
	 EMPLOYEE_ID,
	 FIRST_NAME,
	 LAST_NAME,
	 HIRE_DATE,
		case
			when datediff(year, HIRE_DATE, getdate()) < 1 then 'New Hire'
			when datediff(year, HIRE_DATE, getdate()) between 1 and 5 then 'Junior'
			when datediff(year, HIRE_DATE, getdate()) between 5 and 10 then 'Mid-Level'
			when datediff(year, HIRE_DATE, getdate()) between 10 and 20 then 'Senior'
			else 'Veteran'
		end as Employment_Stage
from Employees

-- Task-5.
select 
    Id,
    VALS,
    case 
        when VALS is null then null
        when patindex('%[0-9]%', VALS) = 1
            then cast(LEFT(VALS, patindex('%[^0-9]%', VALS + 'X') - 1) as int)
        else null
    end as LeadingInteger
from GetIntegers





-- Difficult Tasks.

-- Task-1.

-- Task-2.

-- Task-3.
select a.player_id,
       a.device_id,
	   a.event_date
from Activity a
where a.event_date = (
    select min(event_date)
    from Activity
    where player_id = a.player_id
)

-- Task-4.












