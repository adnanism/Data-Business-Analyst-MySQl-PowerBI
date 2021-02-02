/*From emp_manager table, extract the record only for those employees who are manager as well*/
select em1.* from emp_manager em1
 join  emp_manager em2
where em1.emp_no=em2.manager_no
group by em1.emp_no;
