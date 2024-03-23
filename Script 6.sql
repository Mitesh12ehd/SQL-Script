use bank;

create table customer(
	id int primary key,
    cname varchar(225),
    Address varchar(225),
    Gender char(2),
    City varchar(225),
    Pincode int
);

-- insert
insert into customer values 
	(1251,'Ram kumar','Rajkot','M','Rajkot','363310'),
    (1300,'ishan shukli','Ahmd','M','Ahmd','363310'),
    (245,'abd','Surat','M','Surat','363310'),
    (210,'abc','Goa','F','Goa','363310'),
    (500,'mnp','Sanand','F','Sanand','363310');
insert into customer(id,cname,address,Gender,City,Pincode) 
	values (151,'Mitesh','Chavda','M','Snagar','363310');
insert into customer(id,cname) values (121,'bob');


-- update
update customer set address = 'mumbai', gender='M' where id=121;

-- update multiple row 
set sql_safe_updates = 0;
update customer set pincode = 1100000;
update customer set pincode = pincode+ 1;
set sql_safe_updates = 1;


-- delete
delete from customer where id=121;
-- delete whole table (won't work in safe mode)
delete from customer;



-- drop table customer
-- cascade feature and setnull feature

create table customer(
	id int primary key,
    cname varchar(225),
    Address varchar(225),
    Gender char(2),
    City varchar(225),
    Pincode int
);
insert into customer values
	(1,'Ram kumar','Rajkot','M','Rajkot','363310');
    
create table order_detail(
	order_id int primary key,
    delivery_date date,
    cust_id int,
    foreign key(cust_id) references customer(id)
		on delete cascade
);
insert into order_detail value (3,'2019-03-11',1);
insert into order_detail value (4,'2019-03-12',1);

delete from customer where id=1;

-- check same feature for on delete set null

select * from customer;
select * from order_detail;


-- replace
create table customer(
	id int primary key,
    cname varchar(225),
    Address varchar(225),
    Gender char(2),
    City varchar(225),
    Pincode int
);

insert into customer values 
	(1251,'Ram kumar','Rajkot','M','Rajkot','363310'),
    (1300,'ishan shukli','Ahmd','M','Ahmd','363310'),
    (245,'abd','Surat','M','Surat','363310'),
    (210,'abc','Goa','F','Goa','363310'),
    (500,'mnp','Sanand','F','Sanand','363310');
    
replace into customer (id,city) values (1251,'colony');

replace into customer (id,cname,city) 
	values (1333,'dhrumit','colony');
    
replace into customer set id=1300, cname = 'Mac', city = 'America';

replace into customer(id,cname,city)
	select id,cname,city from customer where id=500