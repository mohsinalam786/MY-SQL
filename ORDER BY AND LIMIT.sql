create database company;
use company;
create table employees(
id int primary key,
name varchar(100),
position varchar(100),
salary decimal(10,2),
date_of_joining date);

insert into employees values(1,"John Doe", "Manager", "55000.00", "2020-01-15");
insert into employees values(2,"Jane Smith", "Developer", "48000.00", "2019-07-10");
insert into employees values(3,"Alice Johnson", "Designer", "45000.00", "2021-03-22");
insert into employees values(4,"Bob Brown", "Developer", "50000.00", "2018-11-01");
      #1.Write a query to retrieve all employees who are Developers.
select * from employees where position="developer"; 
	  #2.Write a query to update the salary of Alice Johnson to 46000.00
 update employees set salary = 46000.00 where id=3;
		#3.Write a query to delete the employee record for Bob Brown.
 delete from employees where id=4;
        #4. Write a query to find the employees who have a salary greater than 48000.
  select * from employees where salary>"48000";   
        #4.Write a query to add a new column email to the employees table.
   alter table employees add email varchar(100);
         #5.Write a query to update the email for John Doe to john.doe@company.com.
   update employees set email = "john.doe@company.com" where id=1;
         #6.Write a query to update the email for John Doe to john.doe@company.com.
   select name,salary from employees;
          #7.Write a query to count the number of employees who joined after January 1, 2020.
   select count(*) as employees_count from employees where date_of_joining > "2020-01-01";   
          #8.Write a query to order the employees by salary in descending order.
  select * from employees order by salary desc;
          #9.Write a query to drop the email column from the employees table.
          
          
          #10.Write a query to find the employee with the highest salary.
 select name,salary from employees order by salary desc limit 1; 
 
 

