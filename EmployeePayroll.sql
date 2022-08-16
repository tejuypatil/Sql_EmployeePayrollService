show databases;
create database sample;
use sample;
show tables;
create table employee_payroll(id int auto_increment, name varchar(40), salary double, start_date date, primary key(id));
desc employee_payroll;
insert into employee_payroll(name, salary, start_date) values
('Bill', 100000.00, '2018-01-03'),
('Mark', 200000.00, '2019-11-13'),
('Charlie', 300000.00, '2020-5-21');
select * from employee_payroll order by name desc;
select * from employee_payroll where name='Bill' or salary >= 300000.00;
select min(salary) from employee_payroll;
select count(salary) from employee_payroll;
select sum(salary) as sum from employee_payroll;
select * from employee_payroll where id in (1,3);
select * from employee_payroll where id between 1 and 3;
select * from employee_payroll limit 2; 
select * from employee_payroll WHERE name LIKE '____%';
update employee_payroll set name = 'Amit' where name = 'Bill';
select * from employee_payroll;

delete from employee_payroll where name='Amit';
alter table employee_payroll add column gender varchar(6) after name;
alter table employee_payroll modify column gender varchar(1);
desc employee_payroll;

create table employee_department 
(department_id int auto_increment, 
department_name varchar(20), 
employee_department_id int , 
primary key(department_id) , 
foreign key(employee_department_id) references employee_payroll(id) );

desc employee_department;

insert into employee_department (department_name , employee_department_id) values('hr', 2 ), ('test' , 3);
select * from employee_department;



select employee_payroll.name, employee_payroll.start_date ,
 employee_department.department_name from employee_payroll 
 inner join employee_department 
 on employee_payroll.id = employee_department.employee_department_id ;
 
 select employee_payroll.name, employee_payroll.start_date ,
 employee_department.department_name from employee_payroll 
 left join employee_department 
 on employee_payroll.id = employee_department.employee_department_id ;
 
 select employee_payroll.name, employee_payroll.start_date ,
 employee_department.department_name from employee_payroll 
 cross join employee_department ;
