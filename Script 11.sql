create database org;
use org;

create table worker(
	worker_id int not null primary key auto_increment,
    first_name char(25),
    last_name char (25),
    salary int(15),
    joining_date datetime,
    department char(25)
);

insert into worker values
	(001, 'monika', 'arora', 100000, '14-02-20 09.00.00', 'HR'),
    (002, 'niharika', 'verma', 80000, '14-06-11 09.00.00', 'Admin'),
    (003, 'vishal', 'singhal', 300000, '14-02-20 09.00.00', 'HR'),
    (004, 'amitabh', 'singh', 500000, '14-02-20 09.00.00', 'Admin'),
    (005, 'vivek', 'bhati', 500000, '14-06-11 09.00.00', 'Admin'),
    (006, 'vipul', 'diwan', 200000, '14-06-11 09.00.00', 'Account'),
    (007, 'satish', 'kumar', 75000, '14-01-20 09.00.00', 'Account'),
    (008, 'geetika', 'chauhan', 90000, '14-04-20 09.00.00', 'Admin');

create table bonus(
	worker_ref_id int,
    bonus_amount int(10),
    bonus_date datetime,
    foreign key(worker_ref_id)
		references worker(worker_id)
        on delete cascade
);

insert into bonus values
	(001,5000,'16-02-20'),
    (002,3000,'16-06-11'),
    (003,4000,'16-02-20'),
    (001,4500,'16-02-20'),
    (002,3000,'16-06-11');
    
create table title(
	worker_ref_id int,
    worker_title char(25),
    affected_from datetime,
    foreign key(worker_ref_id)
		references worker(worker_id)
        on delete cascade
);

insert into title values
	(001,'Manager','2016-02-20 00:00:00'),
    (002,'executive','2016-06-11 00:00:00'),
    (008,'executive','2016-06-11 00:00:00'),
    (005,'Manager','2016-06-11 00:00:00'),
    (004,'Asst. Manager','2016-06-11 00:00:00'),
    (004,'Asst. Manager','2016-06-11 00:00:00'),
    (007,'executive','2016-06-11 00:00:00'),
    (006,'lead','2016-06-11 00:00:00'),
    (003,'lead','2016-06-11 00:00:00');
    
-- que 1
select first_name as worker_name from worker;

-- 2
select upper(first_name) from worker;

-- 3
select distinct department from worker;
select department from worker group by department;

-- 4
select substring(first_name,1,3) from worker;

-- 5
select instr(first_name,'b') from worker where first_name = 'amitabh';

-- 6
select rtrim(first_name) from worker;

-- 7
select ltrim(department) from worker;

-- 8
select distinct department,length(department) from worker;

-- 9
select replace(first_name,'a','A') from worker;

-- 10
select concat(first_name, ' ', last_name) as complete_name from worker;

-- 11
select * from worker order by first_name ASC;

-- 12
select * from worker order by first_name ASC, department DESC;

-- 13
select * from worker where first_name = 'vipul' or first_name = 'satish';
select * from worker where first_name in ('vipul','satish');

-- 14
select * from worker where first_name not in ('vipul','satish');

-- 15
select * from worker where department like 'admin%';

-- 16
select * from worker where first_name like '%a%';

-- 17
select * from worker where first_name like '%a';

-- 18
select * from worker where first_name like '%h' and length(first_name) = 6;
select * from worker where first_name like '_____h';

-- 19
select * from worker where salary between 100000 and 500000;

-- 20 
select * from worker where year(joining_date) = 2014 and 
	month(joining_date) = 02;

-- 21
select department, count(*) from worker where department = 'Admin';

-- 22
select concat(first_name,' ',last_name) as fullname, salary from worker 
	where salary between 50000 and 100000;
    
-- 23
select department, count(worker_id) from worker group by department
	order by count(worker_id) DESC;
    
-- 24 
select w.* from worker as w inner join title as t
	on w.worker_id = t.worker_ref_id
    where t.worker_title = 'manager';
    
-- 25
select worker_title,count(*) from title group by worker_title
	having count(*) > 1;
    
-- 26
select * from worker where mod(worker_id,2) != 0;
-- 27
select * from worker where mod(worker_id,2) = 0;

-- 28
create table worker_clone like worker;
insert into worker_clone select * from worker;

-- 29
select worker.* from worker inner join worker_clone using(worker_id);

-- 30
select * from worker left join worker_clone using(worker_id)
	where worker_clone.worker_id is null;
    
-- 31
select current_timestamp();

-- 32
select * from worker order by salary DESC limit 5;

-- 33
select * from worker order by salary DESC limit 4,1;

-- 34
select salary from worker w1 where 5 = (
	select count(distinct w2.salary) from worker w2
    where w2.salary >= w1.salary
);

-- 35
select * from worker w1,worker w2 where w1.salary = w2.salary
	and w1.worker_id != w2.worker_id;
    
-- 36
select max(salary) from worker
	where salary not in (select max(salary) from worker);
    
-- 37
select * from worker
	union all
    select * from worker order by worker_id;
    
-- 38
select worker_id from worker where worker_id not in
	(select worker_ref_id from bonus);
    
-- 39 works only if auto increament
select * from worker where worker_id <=
	(select count(*)/2 from worker);
    
-- 40
select department from worker group by department 
	having count(department) < 4;
    
-- 41
select department,count(*) as dept_count from worker 
	group by department;
    
-- 42
select * from worker where worker_id in
	(select max(worker_id) from worker); 

-- 43
select * from worker where worker_id in 
	(select min(worker_id) from worker);

-- 44
(select * from worker order by worker_id DESC limit 5)
	order by worker_id ASC;
    
-- 45
select w.department,w.first_name,w.salary from
(select max(salary) as maxsal,department from worker 
	group by department) as temp
    inner join
    worker as w on temp.department = w.department and
    temp.maxsal = w.salary;
    
-- 46
select distinct salary from worker w1 where 3 >= (
	select count(distinct salary) from worker w2
		where w1.salary <= w2.salary
) order by w1.salary DESC;

select distinct salary from worker order by salary DESC limit 3;

-- 47
select distinct salary from worker w1 where 3 >= (
	select count(distinct salary) from worker w2
		where w1.salary >= w2.salary
) order by w1.salary DESC;

select distinct salary from worker order by salary ASC limit 3;

-- 48
select distinct salary from worker w1 where n >= (
	select count(distinct salary) from worker w2
		where w1.salary <= w2.salary
) order by w1.salary DESC;

select distinct salary from worker order by salary DESC limit n;

-- 49
select department, sum(salary) from worker group by department;

-- 50
select first_name from worker where salary = (
	select max(salary) from worker
);