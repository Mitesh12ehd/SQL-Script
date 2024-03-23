create database bank;
use bank;

create table account(
	id int primary key,
    name varchar(255) unique,
    balance int,
    constraint acc_balance_check CHECK(balance > 1000)
);

insert into account(id,name,balance) 
	values(1,'A',10000);

insert into account(id,name,balance) 
	values(2,'B',500);


-- default contraint
drop table account;
create table account(
	id int primary key,
    name varchar(255) unique,
    balance int default 0
);

insert into account(id,name) 
	values(1,'A');
insert into account(id,name) 
	values(2,'B');
select * from account;
