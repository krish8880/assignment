use assignment_module3;

create  table customers(
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

insert into customers(customer_id, cust_name, city, grade, salesman_id) values
(3002, 'Nick Rimando', 'New York', 100,5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', 100, 5005);


select *
from customers;

-- 1 
select  customer_id, cust_name, city, grade, salesman_id
from customers
where city ='New York' and grade <= 100;


-- 2
select customer_id,cust_name,city,grade,salesman_id
from customers
where city='new york' and grade>100 ;

-- 3 

create table orders(
order_id int primary key ,
purchase_amount decimal(10,2),
order_date date,
customer_id int ,
salesman_id int
);

insert into orders(order_id,purchase_amount,order_date,customer_id,salesman_id) values
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.60, '2012-04-25', 3002, 5000);

select *
from orders;

select purchase_amount,order_id,(purchase_amount/6000*100),(100-purchase_amount/6000*100)
from orders
where purchase_amount >3000;

-- 4
select sum(purchase_amount) as total_purchase_amount
from orders;

-- 5

select customer_id,purchase_amount
from orders
order by purchase_amount desc;

-- 6
create table products(
product_id int auto_increment primary key,
product_price int,
stock int,
product_name varchar(50)
);

insert into  products(product_price,stock,product_name) values
(50000.00,10,'laptop'),
(20000.00,60,'mobile'),
(1000.00,40,'wacth');


select *
from products;

select avg (product_price) as avg_price
from  products;
-- 7 


CREATE TABLE emp (
	frist_name varchar(50),
    last_name varchar(50),
    emp_id INT PRIMARY KEY auto_increment,
    job_id int,
    department_name VARCHAR(100),
    location VARCHAR(100)
);


INSERT INTO emp (frist_name,last_name,job_id, department_name, location) VALUES
('narendra','modi',10, 'Finance', 'New York'),
('anant','mahindra',20, 'finance', 'Toronto'),
('mukesh','ambani',30, 'Sales', 'London'),
('ronaldo','Cristiano',40, 'HR', 'Toronto');

select *
from emp;

select *
from emp
where  location='Toronto';

-- 8

create table emplooyes(
emp_id int auto_increment primary key ,
salary int ,
job_id varchar(20),
frist_name varchar(50),
last_name varchar(50));


insert into emplooyes(job_id,salary,frist_name,last_name) values
('mk_man',500000,'modi','narendra'),
('desiner',100000,'virat','kohli'),
('marketing',400000,'salman','khan'),
('HR',330000,'baburao','ganpatrao');

select *
from emplooyes;

select emp_id,frist_name,last_name,job_id
from emplooyes
where salary < (select max(salary)
from emplooyes
where job_id='mk_man');
 


-- 9

create table department(
dep_id int primary key ,
dep_name varchar(50),
first_name varchar(50),
last_name varchar(50)
);

insert into department(dep_id,dep_name,first_name,last_name) values
(10,'marketing','narendra','modi'),
(20,'HR','ronaldo','cristiano'),
(30,'maneger','mukesh','ambani'),
(40,'boss','krish','gajjar'),
(50,'programer','elon','musk'),
(60,'worker','trump','donald'),
(70,'info tech','anant','ambani'),
(80,'hod','amitabh','bachchan'),
(90,'accounting','baburao','ganpatrao'),
(100,'finance','salman','khan');

select *
from department;

select *
from department
where dep_id='40' or dep_id='80';

-- 10

 select *
 from emplooyes;
 
select count(frist_name) as count_employees,
avg(salary) as avg_salary
from emplooyes;

-- 11 
create table q11(
first_name varchar(50),
last_name varchar(50),
job_id int ,
dep_id int);

insert into q11(first_name,last_name,job_id,dep_id) values
('krish','gajjar',169,1),
('narendra','modi',169,1),
('ronaldo','cristiano',170,2),
('trump','donald',171,3),
('mukesh','ambani',172,4);

select *
from q11;

select first_name,last_name,job_id,dep_id
from q11
where job_id =169;

-- 12 

select *
from emplooyes;

select avg(salary)
from emplooyes;

select frist_name,last_name, salary
from emplooyes
where salary > (select avg(salary) from emplooyes)
order by (salary);

-- 13

select frist_name,department_name,job_id
from emp
where department_name = 'Finance';

-- 14 
create table q14(
    emp_id INT PRIMARY KEY,
    salary INT,
    job_id VARCHAR(20),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dep_name varchar(100)
);


insert into q14 (emp_id,salary,job_id,first_name,last_name,dep_name) values
(170,50000,1,'narendre','modi','finance'),
(171,30000,1,'ronaldo','cristiano','marketing'),
(172,10000,1,'trump','dolanld','accounting'),
(173,90000,1,'baburao','canpatrao','tech into'),
(174,500000,1,'virat','kohli','hod'),
(175,40000,1,'mukesh','ambani','tech into'),
(176,600000,1,'anant','ambani','hod'),
(179,700000,1,'salman','kahn','accounting'),
(181,800000,1,'sarukh','kahn','marketing'),
(182,1000000,1,'hritik','roshan','finance');


select *
from q14;

select frist_name ,last_name,salary
from q14
where salary < (select salary from q14 where  emp_id =182);

-- 15 

delimiter $$
create procedure count_emp_department()
begin 
	select dep_name,count(emp_id) as emp_count
    from q14
    group by dep_name;
end $$  

delimiter ;

call count_emp_department();

-- 16 
create table add_emp(
emp_id int  key,
emp_name varchar(100),
department varchar(50),
hire_date date);


delimiter $$
create procedure add_emplooyes (in id int,name_emp varchar(100), in dep varchar(50),hire_d date)
begin 
	insert into add_emp (emp_id ,emp_name,department,hire_date)
    values(id,name_emp,dep,hire_d);
end $$
delimiter ;

call add_emplooyes(4,'virat kohli','it','2025-04-29');

select *
from add_emp;
-- 17 
delimiter $$
create procedure delete_emp(delete_department varchar(50))
begin 
	delete from add_emp
	where department =delete_department;
end $$
delimiter ;

call delete_emp('data science');
SET SQL_SAFE_UPDATES=0;

select *
from add_emp;
-- 18
delimiter $$
create procedure top_salary()
begin
select job_id,max(salary)
from emplooyes
group by job_id;
end $$ 
delimiter ;d

call top_salary();

-- 19 
create table q19 (
    emp_id int auto_increment primary  key,
    salary decimal (10,2),
    job_id varchar(50),
    first_name varchar(50),
    last_name varchar(50));

insert  into q19 (job_id, salary, first_name, last_name)
values 
    ('mk_man', 500000.00, 'modi', 'narendra'),
    ('designer', 100000.00, 'virat', 'kohli'),
    ('marketing', 400000.00, 'salman', 'khan'),
    ('HR', 330000.00, 'baburao', 'ganpatrao');


delimiter $$

create procedure promote_emp(
    in emp_id_input int,
    in new_salary decimal(10,2),
    in new_job_id varchar(50)
)
begin
    update q19
    set salary = new_salary,
        job_id = new_job_id
    where emp_id = emp_id_input;
end $$

delimiter ;
call promote_emp(2, 120000, 'manager');


select*
from q19;


-- 20
create table q20 (
    emp_id int auto_increment primary key,
    salary int,
    job_id varchar(20),
    first_name varchar(50),
    last_name varchar(50),
    manager_id int,
    dep_id int
);

insert into q20 (salary, job_id, first_name, last_name, manager_id, dep_id) values
(10000, 'mk_man', 'narendra', 'modi', 1, 1),
(20000, 'desiner', 'virat', 'kohli', 2, 2),
(400000, 'marketing', 'salman', 'khan', 3, 3),
(330000, 'HR', 'baburao', 'ganpatrao', 4, 4);



delimiter $$ 

create procedure manager_to_dep(in _dep_id  int,in _manager_id int )
begin 
 update q20
 set manager_id = _manager_id
 where dep_id= _dep_id;
 end $$
 
 delimiter ;

SET SQL_SAFE_UPDATES=0;

 call manager_to_dep(2,5);
 
 select *
 from q20;