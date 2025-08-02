create database funciton;
use funciton;
create table employees(
emp_id int,
name varchar(50),
monthly_salary decimal(10,2));

insert into employees(emp_id,name,monthly_salary)
values(1,'Bob',25000),
(2,'Chalie',15000),
(3,'Alice',35000),
(5,'Beck',65000);
alter table employees
add column marks int;

SET SQL_SAFE_UPDATES = 0;
update employees
set marks = (98) where emp_id=1;
update employees
set marks = (87) where emp_id=2;
update employees
set marks = (72) where emp_id=3;
update employees
set marks = (64) where emp_id=5;

#Square Num function
DELIMITER //
CREATE FUNCTION square_num(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
RETURN n*n;
END//
DELIMITER ;
SELECT EMP_ID,SQUARE_NUM(EMP_ID) FROM EMPLOYEES;

#CONVERT CELSIUS TO FAHRENHEIT
DELIMITER //
CREATE FUNCTION C_TO_F(C INT)
RETURNS INT
deterministic
BEGIN
RETURN C*9/5+32;
END//
DELIMITER ;
SELECT C_TO_F(35);

#ADDING 2 NUMBERS
DELIMITER //
CREATE FUNCTION ADDITION(N int ,n1 int)
returns int 
deterministic
begin
return n+n1;
end//
delimiter ;

select addition(10,55);

#Annual salary function
delimiter //
create function get_annual_salary(monthly decimal(10,2))
returns decimal(10,2)
deterministic
begin
return monthly*12;
end//
delimiter ;
select name,get_annual_salary(monthly_salary) as annual_salary from employees;

#Tax functon
delimiter //
create function tax(monthly decimal(10,2))
returns decimal(10,2)
deterministic
begin
return monthly/10;
end//
delimiter ;
select name,tax(monthly_salary) as tax from employees;


