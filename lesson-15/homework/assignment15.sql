-- Lesson - 15. Subqueries and Exists.


-- Level 1: Basic Subqueries
-- Task-1. Find Employees with Minimum Salary.
select 
	id,
	name,
	salary
from employees
where salary = (select min(salary) from employees)

-- Task-2. Find Products Above Average Price.
select *
from products
where price	> (select avg(price) from products)





-- Level 2: Nested Subqueries with Conditions
-- Task-3. Find Employees in Sales Department Task: Retrieve employees who work in the "Sales" department.
select name
from employees
where department_id = (
    select id
    from departments
    where department_name = 'Sales'
)

-- with joins
select e.id,
	   name,
	   d.department_name
from employees e
join departments d
on department_id = d.id
where d.id = 1

-- Task-4. Find Customers with No Orders.
select name
from customers 
where customer_id not in (
		select customer_id
		from orders 
)

-- with joins
select c.customer_id,
	   c.name
from customers c  
left join orders o
on c.customer_id = o.customer_id
where o.order_id is null





-- Level 3: Aggregation and Grouping in Subqueries.
-- Task-5.Find Products with Max Price in Each Category.
select *
from products p
where price = (
		select max(price)
		from products
		where p.category_id = category_id
)

-- Task-6. Find Employees in Department with Highest Average Salary.
select name,
	   max(salary)
from employees e
where department_id = (
			select departmanet_id
			from departments
			where id = e.department_id
)





-- Level 4: Correlated Subqueries
-- Task-7. Find Employees Earning Above Department Average.
select id,
	   name,
	   salary
from employees e1
where e1.salary > (
		select avg(salary)
		from employees
		where department_id = e1.department_id
)

-- Task-8. Find Students with Highest Grade per Course.
select s.student_id,
	   s.name, 
	   g.course_id, 
	   g.grade
from students s
join grades g 
on s.student_id = g.student_id
where g.grade = (
    select max(g2.grade)
    from grades g2
    where g2.course_id = g.course_id
)





-- Level 5: Subqueries with Ranking and Complex Conditions.
-- Task-9. Find Third-Highest Price per Category.
select id,
	   product_name,
	   price
from products p1
where price = (
		select top 3 max(price)
		from products
		where p1.category_id = category_id
)

-- Task-10.
select id,
	   name, 
	   salary,
	   department_id
from employees e
where salary > (
        select avg(salary)
        from employees
)
and salary < (
        select max(salary)
        from employees e2
        where e2.department_id = e.department_id
)











