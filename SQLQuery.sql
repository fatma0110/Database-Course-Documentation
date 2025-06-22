create database companyDB;

use companyDB;

create table department(
	Dnumber int primary key identity(1,1),
	Dname varchar(25) not null,
	Manager_ssn int,
	Hiring_date date not null
)

create table department_location(
	Dnumber int,
	Dlocation varchar(100),
	primary key (Dnumber, Dlocation),
	foreign key (Dnumber) references department(Dnumber)
)

create table employee(
	SSN int primary key identity(1,1),
	Fname varchar(15) not null,
	Lname varchar(15) not null,
	BirthDate date,
	Gender bit,
	Supervise_id int,
	Dno int,
	foreign key (Supervise_id) references Employee(SSN),
	foreign key (Dno) references department(Dnumber)
)

create table project(
	Pnum int primary key identity(1,1),
	Pname varchar(100),
	city varchar(50),
	Plocation varchar(100),
	Dno int,
	foreign key (Dno) references department(Dnumber)
)

create table work(
	Employee_SSN int,
	Project_num int,
	Working_hours int not null,
	foreign key (Employee_SSN) references employee(SSN),
	foreign key (Project_num) references project(Pnum),
	primary key (Employee_SSN,Project_num)
)

create table dependant(
	Essn int,
	Dependant_Name varchar(25) not null,
	gender bit,
	Bdate date,
	foreign key (Essn) references employee(SSN),
	primary key (Essn,Dependant_Name)
)

alter table department
	add foreign key (Manager_ssn) references employee(SSN)



insert into department(Dname,Manager_ssn,Hiring_date)
values('IT',null,'2020-09-15')

insert into department(Dname,Manager_ssn,Hiring_date)
values('Business',null,'2022-08-25')

select * from department



insert into employee(Fname,Lname,BirthDate,Gender,Supervise_id,Dno)
values('Bushra','Khamis','1997-09-08','1',null,2)

insert into department(Dname,Manager_ssn,Hiring_date)
values('Business',null,'2022-08-25')

select * from employee

update department set Manager_ssn = 1 where Dnumber = 1
update department set Manager_ssn = 2 where Dnumber = 2

insert into department_location(Dnumber, Dlocation)
values(1, 'Building A - Floor 2'),(2, 'Building B - Floor 3')

select * from department_location

insert into project(Pname, city, Plocation, Dno)
values('AI Chatbot', 'Muscat', 'Lab 101', 1),('ERP System', 'Muscat', 'Server Room', 2)

select * from project

insert into work(Employee_SSN, Project_num, Working_hours)
values(1, 1, 20),(2, 2, 30)

select * from work

insert into dependant(Essn, Dependant_Name, gender, Bdate)
values(1, 'Jahad', 1, '2010-08-15'),(2, 'Mohammed', 1, '2012-03-22')

select * from dependant


