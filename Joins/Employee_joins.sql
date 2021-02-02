/*If you currently have the ‘departments_dup’ table set up, use DROP COLUMN to remove the ‘dept_manager’ column 
from the ‘departments_dup’ table.
Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.
(If you don’t currently have the ‘departments_dup’ table set up, create it. Let it contain two columns: dept_no and dept_name.
 Let the data type of dept_no be CHAR of 4, and the data type of dept_name be VARCHAR of 40. Both columns are allowed to have null values. 
 Finally, insert the information contained in ‘departments’ into ‘departments_dup’.)
Then, insert a record whose department name is “Public Relations”.
Delete the record(s) related to department number two.
Insert two new records in the “departments_dup” table. Let their values in the “dept_no” column be “d010” and “d011”.*/


drop table if exists departments_dup;

create table departments_dup
(dept_no char(4), dept_name varchar(40),
primary key (dept_no),
unique key (dept_name));

INSERT INTO `departments_dup` VALUES 
('d001','Marketing'),
('d002','Finance'),
('d003','Human Resources'),
('d004','Production'),
('d005','Development'),
('d006','Quality Management'),
('d007','Sales'),
('d008','Research'),
('d009','Customer Service');


ALTER TABLE departments_dup
DROP PRIMARY KEY; 

ALTER TABLE departments_dup
DROP INDEX dept_name; 

ALTER TABLE departments_dup
MODIFY dept_no CHAR(4) NULL;

INSERT INTO departments_dup(dept_name) VALUES 
('Public Relations');

DELETE FROM departments_dup
WHERE dept_no = 'd011';

INSERT INTO departments_dup(dept_no) VALUES 
('d010'),
('d011');


/*********************************************************************************************/



/*Joins*/


/*Extract a list containing information about all managers’ employee number, first and last name, department number,
 and hire date. */

select t.title, e.emp_no, e.first_name, e.last_name,e.hire_date
from titles t
join employees e on t.emp_no=e.emp_no
where title ='manager';

/*Join the 'employees' and the 'dept_manager' tables to return a subset of all the 
employees whose last name is Markovitch. 
See if the output contains a manager with that name.  
‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. 
Order by 'dept_no' descending, and then by 'emp_no'.*/


select e.emp_no, e.first_name, e.last_name, d.dept_no,d.from_date
from employees e
left join dept_manager d on e.emp_no=d.emp_no
where e.last_name='Markovitch'
order by d.dept_no desc,e.emp_no;


/*Extract a list containing information about all managers’ employee number, first and last name, 
department number, and hire date. Use the old type of join syntax to obtain the result.*/
select e.emp_no,e.first_name,e.last_name,e.hire_date from employees e,
dept_manager dm
where e.emp_no=dm.emp_no
order by dm.dept_no desc, e.emp_no;


/*Select the first and last name, the hire date, 
and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.*/

select e.first_name,e.last_name,e.hire_date ,t.title
from employees e
join titles t on e.emp_no=t.emp_no
where first_name ='Margareta' and last_name ='Markovitch';

/*cross join with Department Manager and Departments to see possible combination*/

select * from departments
cross join dept_manager ;


/*cross join with Department Manager and Departments to see possible combination
but except for the department he/she is already in*/

select  * from departments d
cross join dept_manager dm
where d.dept_no<> dm.dept_no;


/*Use a CROSS JOIN to return a list with all possible combinations between managers 
from the dept_manager table and department number 9.*/

select* from dept_manager dm
cross join departments d
where dm.dept_no='d009';



/*Return a list with the first 10 employees with all the departments they can be assigned to.
Hint: Don’t use LIMIT; use a WHERE clause.*/

select  * from employees
cross join departments
where employees.emp_no<=10010;


/*Select all managers’ first and last name, hire date, job title, start date, and department name.*/
select e.first_name,e.last_name , e.hire_date,t.title, t.from_date, d.dept_name, dm.emp_no
from dept_manager dm
join employees e on dm.emp_no=e.emp_no
join titles t on dm.emp_no=t.emp_no
join departments d on dm.dept_no=d.dept_no
where title = 'manager'
order by e.emp_no;

/*How many male and how many female managers do we have in the ‘employees’ database?*/

select e.gender,count(e.gender) as total_female_managers
from employees e
join dept_manager dm on e.emp_no=dm.emp_no
group by e.gender;


/*Average salary of employees by each department */

select d.dept_name, avg(s.Salary) as Total_Salaries
from departments d
join dept_emp de on d.dept_no=de.dept_no
join salaries s on s.emp_no= de.emp_no
group by d.dept_no;


/*Click 'Continue' and execute the query. What do you think is the meaning of 
the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)?
- operator : tell mysql to left this out. so basically, same as without using ORDER BY*/

SELECT *
FROM
    (SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date
    FROM employees e
    WHERE last_name = 'Denis' 
		UNION 
	SELECT NULL AS emp_no, NULL AS first_name, NULL AS last_name, dm.dept_no, dm.from_date
    FROM dept_manager dm) AS a
ORDER BY -a.emp_no DESC;


