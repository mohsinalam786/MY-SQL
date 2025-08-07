create database venom;
use venom;

create table employees(
    emp_id int not null primary key,
    name varchar(20) not null,
    department varchar(20) not null,
    salary int not null
    );
    
insert into employees(emp_id,name,department,salary) values(1,"john","hr",5000),
(2,"alice","it",7000),
(3,"bob","finance",6000),
(4,"eve","it",8000),
(5,"charlie","finance",7500);

create table departments(
    dept_id int not null primary key,
    dept_name varchar(10) not null
    );

insert into departments(dept_id,dept_name) values(1,"hr"),(2,"it"),(3,"finance");

#1. Find employees with salaries greater than the average salary of all employees. 

select name from employees where emp_id =(select emp_id 
from employees group by emp_id order by avg(salary) desc limit 1);

#2. Find employees whose salary is higher than the salary of 'Alice'. 

select name from employees where salary>(select salary from employees  where name ="Alice");

#3.List employees who belong to a department that has the name 'IT'.

select name from employees where emp_id in(select 
emp_id from employees where department = "it");

#4. Get the names of employees who earn the highest salary in their department. 

select name,department from employees where salary in(select max(salary) from employees group by department);

#5. Retrieve the departments where at least one employee earns more than 7000. 

select department from employees where salary in(select salary from employees  where salary>7000);

#6. List employees who do not belong to any department in the departments table.

select name from employees where emp_id not in ( select dept_id from departments);

#7. Find the second-highest salary among employees.

select name,salary from employees where emp_id =(select emp_id from 
employees group by emp_id order by salary desc limit 1 offset 1);

#8. Retrieve the names of employees who work in the department with the highest number of employees.

select name from employees where department in (select department from employees group by department having count(emp_id) = (
select count(emp_id) from employees group by department order by count(emp_id) desc limit 1));

#9.Find employees who earn more than the average salary in their department. 

select name, department, salary from employees e1 where salary > 
( select avg(salary)from employees e2 where e2.department = e1.department);

#10. Retrieve employees whose salary is above 7000 and belong to departments in the departments table. 

select name from employees where salary > 7000 and department in ( select dept_name from departments);

#11.List all departments that have no employees. 

select department from employees where emp_id in(select emp_id from employees where department is null);

#12.Find employees who have the same salary as another employee in a different department.

select name from employees where salary in ( select salary from employees group by salary having count(distinct emp_id) > 1);

#13.Get the total salary of the department with the maximum total salary. 

select department,sum(salary) as total_salary,max(salary) as 
max_salary from employees group by department having department in
(select department from employees);

#14.Retrieve employees whose department has more than two employees. 

select name from employees where department in(select department from employees where emp_id > 1);

#15. Find employees whose salary is higher than the average salary of employees in the IT department.

select name from employees where salary >(select avg(salary) from employees );





















































