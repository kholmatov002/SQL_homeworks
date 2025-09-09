-- Lesson - 12. Practise.


-- Task-1. Combine Two Tables.
select p.FirstName, 
	   p.LastName,
	   a.city,
	   a.state
from Person p
left join
Address a
on p.personId = a.personId

-- Task-2.
select emp1.name
from employee emp1
left join employee emp2
on emp1.managerid = emp2.id
where emp1.salary > emp2.salary

-- Task-3.
select email
from Person
group by email
having count(email) > 1

-- Task-4.

-- Task-5.
select g.name, g.parentname
from girls g
left join
boys b
on g.parentname = b.parentname
where b.id is null


-- Task-6.



-- Task-7.
select isnull(cart1.item,'') as cart1_item,
	   isnull(cart2.item,'') as cart2_item from cart1
full join cart2
on cart1.item = cart2.Item

-- Task-8.
select c.name as Customers
from Customers c
left join orders o
on c.id = o.customerid
where o.id is null

-- Task-9.
select st.student_id,
	   st.student_name,
	   e.subject_name,
	   count(*) as attended_exam
from examinations e
join  students st
on e.student_id = st.student_id
group by st.student_id, st.student_name, e.subject_name
order by st.student_name, e.subject_name
