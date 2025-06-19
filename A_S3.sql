create database assignment4;
use assignment4;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary int not null ,
    hire_date DATE
);
INSERT INTO employees (emp_id, first_name, last_name, department, salary, hire_date) VALUES
(1, 'John', 'Doe', 'IT', 60000.00, '2019-01-10'),
(2, 'Jane', 'Smith', 'HR', 55000.00, '2018-03-05'),
(3, 'Emily', 'Jones', 'IT', 62000.00, '2020-07-23'),
(4, 'Michael', 'Brown', 'Finance', 70000.00, '2016-05-14'),
(5, 'Sarah', 'Davis', 'Finance', 69000.00, '2017-11-18'),
(6, 'David', 'Johnson', 'HR', 48000.00,'2021-09-10');
#1. Find the average salary of employees in each department.
SELECT department,(salary) AS salary FROM employees GROUP BY department;
#2. Find the total number of employees hired after 2019.
SELECT COUNT(*) AS employees FROM employees WHERE hire_date>'2019-12-31';
#3. List the departments and the total salary of all employees in each department, ordered by the totalsalary.
SELECT department, SUM(salary) AS salary FROM employees GROUP BY department ORDER BY salary;
#4. Find the highest salary in the Finance department.
SELECT MAX(salary) AS salary FROM employees WHERE department='Finance';
sELECT emp_id, first_name, last_name, department, salary FROM employees ORDER BY salary LIMIT 3;
select department, salary from employees order by salary limit 1;
SELECT department, COUNT(*) AS total_employees FROM employees GROUP BY department ORDER BY total_employees;
sELECT emp_id,first_name,last_name,(salary) AS average_salary_before_2020 FROM employees WHERE hire_date<'2020-01-01';
select first_name, last_name, hire_date from employees where department='IT' order by hire_date;
SELECT SUM(salary) AS total_salary FROM employees WHERE hire_date>'2019-01-01';
select max(salary) as salary from employees where department='hr';
SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department ORDER BY total_salary LIMIT 2;
SELECT emp_id, first_name, last_name, department, salary, hire_date FROM employees WHERE hire_date > '2018-12-31' ORDER BY salary LIMIt 4;
select max(salary) as salary from employees where department='it';
SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department HAVING AVG(salary)>60000;


