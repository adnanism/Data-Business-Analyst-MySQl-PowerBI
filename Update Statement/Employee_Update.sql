SET autocommit = 0;

SELECT *
FROM employees
WHERE emp_no = '999903';

update employees
set first_name ='Stella', gender = 'M'
where emp_no='999903';

rollback;

update employees
set first_name ='Sally'
where emp_no=999903;

commit;

SET autocommit = 1;
