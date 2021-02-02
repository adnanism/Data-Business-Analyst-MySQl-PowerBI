/*IfNull*/

select dept_no, ifnull(dept_name,'Dept_name_Not_given') as dept_name
from departments
order by dept_no;

/*Coalesce */
select dept_no, coalesce(dept_name,'N/A') as dept_name
from departments;

insert into departments values ('d111',Null);


select * from rental 
where return_date is not null;


select rental_id ,ifnull(return_date,'Not yet Returned') as return_date
from rental;
