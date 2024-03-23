create database if not exists joinPractice;
use joinPractice;

create table employee(
	id int primary key,
    fname varchar(255),
    lname varchar(255),
    Age int,
    email_id varchar(255),
    phone_no int,
    city varchar(255)
);

create table client(
	id int primary key,
    first_name varchar(255),
    last_name varchar(255),
    age int,
    email_id varchar(255),
    phone_no int,
    city varchar(255),
    emp_id int,
    foreign key(emp_id) references employee(id)
);

create table project(
	id int primary key,
    emp_id int,
    name varchar(255),
    startdate date,
    client_id int,
    foreign key(emp_id) references employee(id),
    foreign key(client_id) references client(id)
);

insert into employee values 
	(1,'Aman','proto',32,'aman@gmail.com',898,'Delhi'),
    (2,'yagya','narayan',44,'yagya@gmail.com',222,'Palam'),
    (3,'rahul','bd',22,'rahul@gmail.com',444,'KKr'),
    (4,'jatin','hermit',31,'jatin@gmail.com',666,'raipur'),
    (5,'pk','pandey',21,'pk@gmail.com',555,'jaipur');
    
insert into client values
	(1,'mac','rogers',47,'mac@gmail.com',333,'kolkata',3),
	(2,'max','poirir',27,'max@gmail.com',222,'kolkata',3),
	(3,'peter','jain',24,'peter@gmail.com',111,'Delhi',1),
	(4,'sushant','agarval',23,'sushant@gmail.777',333,'hbd',5),
	(5,'pralap','singh',36,'pralap@gmail.com',7767,'mumbai',2);
    
insert into project values
	(1,1,'A','2021-04-21',3),
    (2,2,'B','2021-03-12',1),
    (3,3,'C','2021-01-16',5),
    (4,3,'D','2021-04-27',2),
    (5,5,'E','2021-05-01',4);
    
select * from employee;
select * from client;
select * from project;

-- SUB - QUERIES

-- employess with age 30
-- where clause in same table
select * from employee where age in 
	(select age from employee where age > 30);
    
-- employee detail working in more than 1 project
-- where clause in diffrent table
select * from employee where id in 
	(select emp_id from project group by emp_id 
		having count(emp_id) > 1);
        
-- employee detail having age > avg age
-- single value subquery
select * from employee where age > 
	(select avg(age) from employee);
    
-- from clause - derived table
-- select max age person whose first name has 'a' char in his name
select max(age) from 
	(select * from employee where fname like '%a%') as temp;

-- co-related
-- find 3rd oldest employee
select * from employee e1 where 3 = (
	select count(e2.age) from employee e2 where e2.age >= e1.age);