/*Select ten records from the “titles” table to get a better idea about its content.
Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, 
999903,'1977-09-14','Johnathan','Creek','M','1999-01-01'
who has started working in this position on October 1st, 1997.*/

select * from titles
limit 10;

insert into employees(emp_no,birth_date, first_name,last_name,gender,hire_date)
values ('999903','1977-09-14','Johnathan','Creek','M','1999-01-01');

select * from employees
where emp_no=999903;

insert into titles(emp_no,title,from_date,to_date)
values('999903','Senior Engineer','1997-10-01','9999-01-01');

SELECT *
FROM titles
ORDER BY emp_no DESC
LIMIT 10;


/*Insert information about the individual with employee number 999903 into the “dept_emp” table. 
He/She is working for department number 5, and has started work on  October 1st, 1997; 
her/his contract is for an indefinite period of time.
Hint: Use the date ‘9999-01-01’ to designate the contract is for an indefinite period.*/

insert into dept_emp(emp_no,dept_no,from_date,to_date)
 values('999903','d005','1997-10-01','9999-01-01');
 
 select * from dept_emp
 order by emp_no desc
 limit 10;
