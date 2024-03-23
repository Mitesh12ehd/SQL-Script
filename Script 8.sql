create database company;
use company;

create table dept1(
	empid int primary key,
    name varchar(255),
    role varchar(255)
);

create table dept2( 
	empid int primary key,
    name varchar(255),
    role varchar(255)
);

insert into dept1 values 
	(1,'A','engineer'),
    (2,'B','salesman'),
    (3,'C','manager'),
    (4,'D','salesman'),
    (5,'E','engineer');
    
insert into dept2 values
	(3,'C','manager'),
    (6,'F','marketing'),
    (7,'G','salesman');
    
-- list out all the employees in the company
select* from dept1
	union
select * from dept2;

-- list out all the employee in all department who work as salesman
select * from dept1 where role = 'salesman'
	union
select * from dept2 where role = 'salesman';
    
-- list out all the employee who work in both department
select dept1.* from dept1 inner join dept2 using(empid);
                                                                                                                                                                                                                                                                                                                                      
-- list out all employee who works in dept1 but not in dept2
select dept1.* from dept1 left join dept2 using(empid) 
	where dept2.empid is null;