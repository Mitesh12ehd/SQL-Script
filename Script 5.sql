create database shopping;
use shopping;

create table account(
	id int primary key,
    name varchar(255) unique,
    balance int not null default 0
);

-- add new column
alter table account add interest float not null default 0;

-- modify data type
alter table account modify interest double not null default 0;

-- rename column
alter table account change column interest 
	saving_interest float not null default 0;

-- drop column
alter table account drop column saving_interest;

-- rename table
alter table account rename to account_detail;

select * from account_detail;