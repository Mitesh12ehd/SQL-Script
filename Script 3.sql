use org;

-- select
select * from worker;
select salary from worker;
select first_name,salary from worker;

-- dual table
select 55+11;
select now();
select ucase('mitesh');
select lcase('MITESH');

-- where clause
select * from worker where salary > 80000;
select * from worker where department = 'HR';

-- between clause
select * from worker where salary between 80000 and 100000;

-- in clause
select * from worker where department = 'HR' or department = 'admin';
select * from worker where department in ('HR','Admin');

-- Not clause
select * from worker where department not in ('HR','Admin');

-- is null 
insert into worker 
	(worker_id,first_name,last_name,salary,joining_date,department) values
		(009,'dhrumit','patel',100000,'14-02-20 09.00.00',NULL);
select * from worker where department is null;

-- wildcard
select * from worker where first_name like '%te%';
select * from worker where first_name like '_ites_';
select * from worker where first_name like '%tesh';

-- sorting / ordering default is asc
select * from worker order by salary ASC;
select * from worker order by salary DESC;

-- distinict
select distinct department from worker;

-- group by
select department from worker group by department;
select department, count(department) from worker group by department;

-- avg salary per department
select department, AVG(salary) from worker group by department;
-- min max sum
select department, MIN(salary) from worker group by department;
select department, MAX(salary) from worker group by department;
select department, SUM(salary) from worker group by department;

-- group by having
select department, count(department) from worker 
	group by department having count(department) >2;