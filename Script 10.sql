create database if not exists views_ex;
use views_ex;

create table employee(
	id int primary key,
    fname varchar(255),
    lname varchar(255),
    Age int,
    email_id varchar(255),
    phone_no int,
    city varchar(255)
);
insert into employee values 
	(1,'Aman','proto',32,'aman@gmail.com',898,'Delhi'),
    (2,'yagya','narayan',44,'yagya@gmail.com',222,'Palam'),
    (3,'rahul','bd',22,'rahul@gmail.com',444,'KKr'),
    (4,'jatin','hermit',31,'jatin@gmail.com',666,'raipur'),
    (5,'pk','pandey',21,'pk@gmail.com',555,'jaipur');
    
select * from employee;

-- creating a view
create view custom_view as select fname,age from employee;

-- viewing a view
select * from custom_view;

-- altering a view
alter view custom_view as select fname,lname,age from employee;

-- drop view
drop view if exists custom_view;