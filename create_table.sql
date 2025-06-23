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



