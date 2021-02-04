/*************************************************/
/*        MySQL CASE  Find Full gender           */
/*************************************************/

select emp_no,first_name,last_name,
CASE 
when gender='M' then 'male'
else 'female'
end as gender
from employees;

/*Second way*/

select emp_no,first_name,last_name,
CASE gender
when 'M' then 'male'
else 'female'
end as gender
from employees;



/*Using If*/

select emp_no, first_name,last_name,
if(gender='M','Male','Female') As  Gender
from employees;



/*obtain a result set containing the employee number, first name, 
and last name of all employees with a number higher than 109990. 
Create a fourth column in the query, indicating whether this employee is also a manager, 
according to the data provided in the dept_manager table, or a regular employee. */

select e.emp_no,e.first_name,e.last_name,
case 
when dm.emp_no is not null then 'Manager'
else 'Not Manager'
end as Manager_or_notManager
from employees e
left join dept_manager dm on e.emp_no=dm.emp_no
where e.emp_no>109990;

/*Extract a dataset containing the following information  
employee number, first name, and last name. Add two columns at the end – 
one showing the difference between the maximum and minimum salary of that employee, and another one saying 
whether this salary raise was higher than $30,000 or NOT.*/

Select e.emp_no,e.first_name,e.last_name,
max(salary)-min(salary) as Salary_Diff,
Case 
when max(salary)-min(salary)>30000 then 'Greater 30k'
else 'Less 30k'
end as Salary_Raise
from employees e
join salaries s on e.emp_no=s.emp_no
group by e.emp_no;

/*Using If*/

Select e.emp_no,e.first_name,e.last_name,max(Salary)-min(Salary) as Salary_diff,
if(max(Salary)-min(Salary)>30000, 'Yes','No') Salary_Raise_More_Thn_30K
from employees e
join salaries s on e.emp_no=s.emp_no
group by e.emp_no;


/*Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column,
 called “current_employee” saying “Is still employed” if the employee is still working in the company, or 
 “Not an employee anymore” if they aren’t.
Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise. */

Select e.emp_no,e.first_name,e.last_name,curdate(),
case 
when max(de.to_date)> curdate() then 'Employed'
else 'Not employed'
end as Status_of_Employee
from employees e 
join dept_emp de on e.emp_no=de.emp_no
group by e.emp_no;
