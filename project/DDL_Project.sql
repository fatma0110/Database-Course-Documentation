create database trainingDB;

use trainingDB;

--table1: Trainee
create table Trainee(
	trainee_id int primary key identity(1,1),
	trainee_name varchar(100) not null,
	gender varchar(10) check(gender in ('male','female')),
	email varchar(50) unique not null,
	background varchar(100)
)
--Table2: Trainer
create table Trainer(
	trainer_id int primary key identity(1,1),
	trainer_name varchar(100) not null,
	specialty varchar(100),
	phone varchar(11),
	email varchar(50) unique not null
)
--Table3: Course
create table Course(
	course_id int primary key identity(1,1),
	title varchar(50) not null,
	category varchar(50),
	duration_hours int,
	course_level varchar(20) check(course_level in ('Beginner', 'Intermediate', 'Advanced'))
)
--Table4: Schedule
create table Schedule(
	schedule_id int primary key identity(1,1),
	course_id int,
	trainer_id int,
	start_date date not null,
	end_date date not null,
	time_slot varchar(50) check(time_slot in ('Morning', 'Evening', 'Weekend')) ,
	foreign key (course_id) references Course(course_id),
	foreign key (trainer_id) references Trainer(trainer_id)
)
--Table5: Enrollment
create table Enrollment(
	enrollment_id int primary key identity(1,1),
	trainee_id int,
	course_id int,
	enrollment_date date,
	foreign key (trainee_id) references Trainee(trainee_id),
	foreign key (course_id) references Course(course_id)
)
