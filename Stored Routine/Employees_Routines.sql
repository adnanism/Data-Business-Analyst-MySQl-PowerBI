
/*************************************************/
/*                STORED ROUTINES                */
/*************************************************/

/* -----------------------------------------------------*/
/*           select all employees limit 100             */
/* -----------------------------------------------------*/

Delimiter $$
create procedure First_100_emps() 
begin
select * from employees
limit 100;
end $$
DELIMITER ;

call employees.First_100_emps();


/* -----------------------------------------------------*/
/*           Avarage salary of all employees            */
/* -----------------------------------------------------*/

Delimiter $$
create procedure Average_Salary_Emps()
Begin
select avg(salary) as Average_Salary from salaries;
End $$
Delimiter ;

call employees.Average_Salary_Emps();



/* -----------------------------------------------------*/
/*         Store Procedure with INPUT parameter         */
/* Select employee salary by specific employee number   */
/* -----------------------------------------------------*/

delimiter //
create procedure Employee_Salary(
Employee_No int)
begin
 Select * from Salaries 
 where Emp_no=Employee_no;
 end //
 Delimiter ;
 
 call Employee_Salary(10001);
 
 
 Delimiter //
 create procedure  Employee_with_Salary(
 Employee_no int)
 Begin 
Select e.emp_no,e.first_name,e.last_name,s.salary,s.from_date,s.to_date
 from employees e
 join salaries s on e.emp_no=s.emp_no
 where Employee_no=e.emp_no;
 End //
 Delimiter ;
 
 
 
 
/* -----------------------------------------------------*/
/*         Store Procedure with INPUT parameter         */
/*         Average Salary of employee by emp_no         */
/* -----------------------------------------------------*/

Delimiter //
create procedure Avg_Salary_Emp (
Employee_no int)
Begin
Select e.emp_no,e.first_name,e.last_name, avg(salary) as Avg_Salary from 
employees e
join salaries s on e.emp_no=s.emp_no
where Employee_no=e.emp_no
group by emp_no;
 End //
 Delimiter ;
 
 /* -----------------------------------------------------*/
/*   Store Procedure with INPUT and OUTPUT parameter    */
/*         Average Salary of employee by emp_no         */
/* -----------------------------------------------------*/

Delimiter //
create procedure Avg_Salary_InOut (
in Employee_no int, out p_avg_salary DECIMAL(10,2))
Begin
Select avg(salary)
INTO p_avg_salary
 from employees e
join salaries s on e.emp_no=s.emp_no
where Employee_no=e.emp_no
group by e.emp_no;
 End //
 Delimiter ;
 
 
 /*Create a procedure called ‘emp_info’ that uses as parameters                     */
/* the first and the last name of an individual, and returns their employee number.*/


 delimiter //
 create procedure Emp_info(in p_first_name varchar (100),p_last_name varchar(100), out p_emp_no int)
 begin
 select  e.emp_no
 into p_emp_no
 from employees e
 where e.first_name=p_first_name and e.last_name = p_last_name
 limit 1;
 end //
delimiter ;


/* -------------------------------------------------------------*/
/*                   User Defined Functions                     */
/* -------------------------------------------------------------*/

/* -------------------------------------------------------------*/
/*    Average salary of an employee by emp_no                   */
/* -------------------------------------------------------------*/


delimiter //
create function f_emp_avg_salary(p_emp_no int)
returns decimal(10,2) Deterministic
begin 
declare v_avg_salary decimal (10,2);
select avg(salary) into v_avg_salary
from salaries
where emp_no=p_emp_no
group by emp_no;
return v_avg_salary;
end //
delimiter ;


/* ----------------------------------------------------------------------------------------------------------*/
/*    Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee,  */
/*and returns the salary from the newest contract of that employee.                                          */
/* ----------------------------------------------------------------------------------------------------------*/

delimiter //
create function emp_info(f_first_name varchar (100), f_last_name varchar(100))
returns decimal (10,2) deterministic
begin 
declare v_newest_salary decimal(10,2);
select s.salary
      into v_newest_salary
from employees e
join salaries s on s.emp_no=e.emp_no
where e.first_name=f_first_name and e.last_name=f_last_name
order by s.from_date
limit 1;
return v_newest_salary;
end //
delimiter ;

select employees.emp_info('georgi', 'facello');
