/*Aggregate Funtions*/


/*How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.*/

select count(Distinct dept_no) as total_no_of_departments
from departments;


/*What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?*/

select sum(salary) as Total_Salary from salaries
where from_date> '1997-01-01';


/*1. Which is the lowest employee number in the database?*/
select min(emp_no)
 from employees;
 
 
 /*2. Which is the highest employee number in the database?*/
select max(emp_no)
from employees;

 
 
 /*What is the average annual salary paid to employees who started after the 1st of January 1997?*/
 
Select avg(Salary) as Average_annual_Salary from salaries 
where from_date>'1997-01-01';



/*Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.*/

Select round(avg(Salary),2) as Average_annual_Salary from salaries 
where from_date>'1997-01-01';


/*Select the department number and name from the ‘departments_dup’ table and add a third column 
where you name the department number (‘dept_no’) as ‘dept_info’. 
If ‘dept_no’ does not have a value, use ‘dept_name’.*/

select dept_no, dept_name , coalesce(dept_no,dept_name) as dept_info
from departments;



/*Modify the code obtained from the previous exercise in the following way. Apply the IFNULL() function 
to the values from the first and second column, so that ‘N/A’ is displayed whenever a department number has no value, 
and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.*/

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments;
