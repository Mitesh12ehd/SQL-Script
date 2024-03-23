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

-- inner join

-- que 1
select e.id, e.fname, e.lname, p.id, p.name from employee as e
	inner join project as p on e.id = p.emp_id;
    
select * from employee as e
	inner join project as p on e.id = p.emp_id;

-- que 2
select e.id, e.email_id, e.phone_no, c.first_name, c.last_name
	from employee as e inner join client as c on e.id = c.emp_id 
    where e.city = 'jaipur' and c.city = 'hbd';
    
-- que 3
select * from employee as e left join project as p
	on e.id = p.emp_id;
    
-- que 4
select p.id, p.name, e.fname, e.lname, e.email_id from
	employee as e right join project as p on e.id = p.emp_id;
    
-- que 5
select e.fname, e.lname, p.id, p.name from employee as e
	cross join project as p;
    
-- que 1 without join
select e.id, e.fname, e.lname, p.id, p.name from employee as e,
	project as p where e.id = p.emp_id;