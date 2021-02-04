/* There can be multiple entries for an employee who has changed to different departments*/
Select emp_no, from_date, to_date, count(emp_no) as total_number
from dept_emp
group by emp_no
having total_number>1;

/*get the latest department info of the employee using VIEW*/
create or replace view v_dept_emp_last_date as
select emp_no, max(from_date) as from_date, max(to_date) as to_date
from dept_emp
group by emp_no;

select * from v_dept_emp_last_date;


/*Create a view that will extract the average salary of all managers registered in the database. 
Round this value to the nearest cent.
you should obtain the value of 67047.29.*/

create or replace view Avg_salary_managers as select round(avg(s.salary),2) as Avg_salary 
from salaries s
join dept_manager dm on s.emp_no=dm.emp_no;

select* from avg_salary_managers;

