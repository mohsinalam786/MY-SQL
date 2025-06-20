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
#5. Get the top 3 highest-paid employees.
sELECT emp_id, first_name, last_name, department, salary FROM employees ORDER BY salary LIMIT 3;
#6. Find the department with the minimum average salary.
select department, salary from employees order by salary limit 1;
#7. Display the total number of employees in each department, ordered by the number of employees.
SELECT department, COUNT(*) AS total_employees FROM employees GROUP BY department ORDER BY total_employees;
#8. Find the average salary of employees who were hired before 2020.
sELECT emp_id,first_name,last_name,(salary) AS average_salary_before_2020 FROM employees WHERE hire_date<'2020-01-01';
#9. List the names of employees in the IT department ordered by hire date, with the most recently hired employees first.
select first_name, last_name, hire_date from employees where department='IT' order by hire_date;
#10. Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary.
SELECT SUM(salary) AS total_salary FROM employees WHERE hire_date>'2019-01-01';
#11. Get the employee with the lowest salary in the HR department.
select max(salary) as salary from employees where department='hr';
#12. Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments.
SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department ORDER BY total_salary LIMIT 2;
#13. List all employees hired after 2018, ordered by salary, and show only the first 4 employees.
SELECT emp_id, first_name, last_name, department, salary, hire_date FROM employees WHERE hire_date > '2018-12-31' ORDER BY salary LIMIt 4;
#14. Find the highest salary in the IT department, but limit the results to the top 1 result.
select max(salary) as salary from employees where department='it';
#15. Get the average salary of employees in each department and list only departments with an averagesalary greater than $60,000.
SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department HAVING AVG(salary)>60000;


