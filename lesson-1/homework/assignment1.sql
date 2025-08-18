create database assignment1 --database yaratib oldim

use assignment1 --va ushbu yaratgan databasedan foydalnish uchun "use" buyurug'idan foydalandim

--Lesson 1: Introduction to SQL Server and SSMS

--Ushbu mavzu bo'yicha topshiriq 3 qismdan iborat (easy, medium, hard)

--Easy
--1.Define the following terms: data, database, relational database, and table.
--2.List five key features of SQL Server.
--3.What are the different authentication modes available when connecting to SQL Server? (Give at least 2)

--Medium
--4.Create a new database in SSMS named SchoolDB.
--5.Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
--6.Describe the differences between SQL Server, SSMS, and SQL.

--Hard
--7.Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
--8.Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
--9.Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit) You can find the database from this link :https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak


--ANSWERS
--1. Foydalanish maqsadida qo'llash uchun saqlangan, yig'ilgan va qayta ishlangan ma'lumot.
--2. BI, Data Integration, BI Tools, Relational Database Management, Cloud Support
--3. Windows Authentication and SQL Server Authentication


--4. Creating a databse called "SchoolDB"

create database School_DB   --created 
use School_DB   --commanding to use that database

--5. Creating a table called "Studentss" with columns: StudentID, Name, Age

create table Studentss (StudentID int PRIMARY KEY, Name varchar(50), Age int)
select * from Studentss

--6. SQL serverni biz ma'lumotlar bazasi mexanizmi desak, SSMS esa ushbu mexanizmda ishlash uchun kerak bo'lgan boshqruv vositasi. SQL esa ma'lumotlar bazasi bilan muloqot qilish uchun foydalaniladigan til.
--7. 

--8.adding informations to "Studentss" table with "insert into" command
insert into Studentss values (1, 'John', 20)
insert into Studentss values (2,'Alex', 18)
insert into Studentss values (3, 'Sarah', 21)

--9.
--10.