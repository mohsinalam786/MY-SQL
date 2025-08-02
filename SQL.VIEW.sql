use view;
# Create a view showing employee names and salary
create view	salary as select name,salary from employee;
select * from employee;

# Create a view of showing high-earning employees(salary>6000)
create view high_earners as select name,department from employee where salary>60000;

# Create a view that shows total salary by department 
create view department_salary_summary as 
select department,sum(salary) as total_salary
from employee 
group by department;

# Update a View (You can use CREATE OR REPLACE to update)
create or replace view high_earners as select name,salary from employee where salary>65000;

#Drop view
drop view department_salary_summary;

