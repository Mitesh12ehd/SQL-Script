create database temp;
use temp;

create table student(
	id int primary key,
    name varchar(255)
);

insert into student values(1,'ankit');
select * from student;
show databases;

drop database if exists temp;
