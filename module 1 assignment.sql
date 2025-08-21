Q1: Create Tables

Create the following 3 tables with appropriate constraints:

Students

StudentID (INT, Primary Key)

Name (VARCHAR(50), NOT NULL)

Age (INT, check Age >= 17)

DepartmentID (INT, Foreign Key → Departments.DepartmentID)

Departments

DepartmentID (INT, Primary Key)

DepartmentName (VARCHAR(50), NOT NULL, UNIQUE)

Courses

CourseID (INT, Primary Key)

CourseName (VARCHAR(50), NOT NULL)

DepartmentID (INT, Foreign Key → Departments.DepartmentID)

create database assignment;
use  assignment;

--table department--
create table departments
(
department_id int primary key
, departmentname varchar(50) not null unique
, )

insert into  departments( department_id, departmentname)
values ( 1 , 'commerce'),
(2, 'science'),
(3, 'english'),
(4, 'math'),
(5, 'social')

select*from departments

--table course--

create table course 
(
course_id int  primary key
,course_name varchar (50) not null
, department_id int foreign key references departments(department_id)
,)

insert into course( course_id, course_name, department_id)
values
(1, 'dataScience', 1),
(2, 'fullStack' , 2),
(3 , 'devops', 3),
(4, 'java', 4 ),
(5, 'python', 5)

select*from course

--table student--

create table students
( student_id int primary key
, name varchar(50) not null
, age int check (AGE>=17)
, department_id  int foreign key references departments(department_id)
,)

insert into students( student_id,name,age,department_id)
values
(1, 'himani',23,1)
,(2,'ashoo',25,4)
,(3,'tannoo',20,5)
,(4,'pavan',18,3)
,(5,'amrit',28,2)

EXEC sp_tables;



select*from students
where name = 'tannoo'


select*from departments
where department_id=5

select*from course
where department_id=5

-----------------------------------------------------------------------------------------------------

Q2: Insert Data

Insert at least 5 records in each table. Example:

Departments: Computer Science, Mechanical, Electrical, Civil, Electronics.

Students: Insert students with different ages and departments.

Courses: Insert courses like DBMS, Thermodynamics, Circuits, Structures, AI, mapped to their departments.


insert into departments(department_id, departmentname)
values
(6,'computer science'),(7,'mechanical'),(8,'electrical'),(9,'civil'),(10,'electronics')

insert into students(student_id,name,age,department_id)
values(6,'sham',19, 6),(7,'ram',27,7),(8,'john',30,8),(9,'harry',31,9),(10,'sneha',32,10)

insert into course(course_id,course_name)
values(6,'dbmb'),(7,'thermodynamics'),(8,'circuits'),(9,'structures'),(10,'ai')

insert into course(department_id)
values(6),(7),(8),(9),(10)

select*from departments
where department_id = 7

select*from students
where department_id =7

select *from course
where course_id=7

---------------------------------------------------------------------------------------------------------------
Q3: Apply WHERE & Operators

Write SQL queries for the following:

Display all students whose age is greater than 20.

Display all courses of the "Computer Science" department.

Display all students who belong to the "Electronics" department.

Display students whose age is between 18 and 22.

select* from students
where age>20

select*from course
select* from departments
where departmentname='computer science'

select * from students
where student_id=department_id
select*from departments
where departmentname='electronics'

select*from students
where age between 18 and 20

-----------------------------------------------------------------------------------------------------------------
Q4: Joins

Perform joins on the tables:

INNER JOIN Students with Departments (to show student names with their department names).

LEFT JOIN Courses with Departments (to show all courses, even if some department does not exist).

RIGHT JOIN Students with Courses (to show all courses, even if no student has enrolled in them).

select s.name as name , d.departmentname as departmentname
from students s inner join departments d
on s.department_id=d.department_id

select*from students join departments
on students.department_id=departments.department_id

select * from course left join departments
on course.department_id=departments.department_id

select* from course right join  students
on course.department_id=students.department_id

-----------------------------------------------------------------------------------------------------------