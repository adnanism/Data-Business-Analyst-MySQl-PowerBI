/*Extract the information about all department managers who were hired between 
the 1st of January 1990 and the 1st of January 1995.*/

select * from dept_manager
where emp_no in (select emp_no from employees
 where hire_date between '1990-01-01' and '1995-01-01');
 
 
 
 /*Select the entire information for all employees whose job title is “Assistant Engineer”. 
Hint: To solve this exercise, use the 'employees' table.*/

select * from employees 
where emp_no in  (select emp_no from titles  where title like 'Assistant Engineer') ;
