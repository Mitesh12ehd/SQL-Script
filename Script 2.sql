create database org;
show databases;
use org;

create table worker(
	worker_id int not null primary key auto_increment,
    first_name char(25),
    last_name char(25),
    salary int(15),
    joining_date datetime,
    department char(25)
);

insert into worker 
	(worker_id,first_name,last_name,salary,joining_date,department) values
		(001,'Monika','patel',100000,'14-02-20 09.00.00','HR'),
        (002,'Mitesh','Chavda',80000,'14-02-20 09.00.00','Admin'),
        (003,'Aheen','Solanki',90000,'14-02-20 09.00.00','Account'),
        (004,'Shivam','lad',70000,'14-02-20 09.00.00','HR'),
        (005,'het','patel',60000,'14-02-20 09.00.00','Admin'),
        (006,'dhruv','asodiya',80000,'14-02-20 09.00.00','HR'),
        (007,'jaimin','chodhri',50000,'14-02-20 09.00.00','Account'),
        (008,'jay','patel',40000,'14-02-20 09.00.00','HR');
        

select * from worker;
        
create table bonus(
	worker_ref_id int,
    bonus_amount int(10),
    bonus_date datetime,
    foreign key(worker_ref_id)
		references worker(worker_id)
        on delete cascade
);
     
insert into bonus(worker_ref_id,bonus_amount,bonus_date) values
	(001,5000,'16-02-20'),
    (002,3000,'16-06-11'),
    (003,4000,'16-02-20'),
    (001,4500,'16-02-20'),
    (002,3500,'16-06-11');

create table title(
	worker_ref_id int,
    worker_title char(25),
    affected_from datetime,
    foreign key(worker_ref_id)
		references worker(worker_id)
        on delete cascade
);
insert into title (worker_ref_id,worker_title,affected_from) values
	(001,'manager','14-02-20 09.00.00'),
    (002,'executive','14-02-20 09.00.00'),
    (008,'executive','14-02-20 09.00.00'),
    (005,'manager','14-02-20 09.00.00'),
    (004,'assist','14-02-20 09.00.00'),
    (007,'manager','14-02-20 09.00.00'),
    (006,'lead','14-02-20 09.00.00'),
    (003,'manager','14-02-20 09.00.00');

select * from bonus;
select * from title;