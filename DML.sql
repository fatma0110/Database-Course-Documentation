select * from department

insert into department (Dname, Manager_ssn, Hiring_date)
values
('Finance', NULL, '2020-01-10'),
('Marketing', NULL, '2021-03-25'),
('Sales', NULL, '2019-06-15'),
('HR', NULL, '2018-09-01'),
('IT', NULL, '2022-04-20')

insert into employee (Fname, Lname, BirthDate, Gender, Supervise_id, Dno)
values
('Ali', 'Khalid', '1982-02-15', 1, NULL, 1),
('Sara', 'Ahmed', '1990-07-20', 0, 1, 2),
('Omar', 'Nasser', '1988-03-10', 1, 1, 1),
('Fatima', 'Hassan', '1995-12-05', 0, 2, 3),
('Yusuf', 'Ibrahim', '1985-06-01', 1, 1, 4)

UPDATE department SET Manager_ssn = 1 WHERE Dnumber = 1
UPDATE department SET Manager_ssn = 2 WHERE Dnumber = 2
UPDATE department SET Manager_ssn = 4 WHERE Dnumber = 3
UPDATE department SET Manager_ssn = 5 WHERE Dnumber = 4
UPDATE department SET Manager_ssn = 3 WHERE Dnumber = 5


insert into department_location (Dnumber, Dlocation)
values
(1, 'Muscat HQ'),
(2, 'Sohar Regional Office'),
(3, 'Salalah Branch'),
(4, 'Muscat HQ'),
(5, 'Online Office')


insert into project (Pname, City, Plocation, Dno)
values
('Cost Optimization', 'Muscat', 'Room A1', 1),
('Rebranding Campaign', 'Sohar', 'MKT Wing', 2),
('Sales Expansion', 'Salalah', 'Sales Floor', 3),
('Employee Wellness', 'Muscat', 'HR Office', 4),
('Cloud Migration', 'Online', 'IT Server Room', 5)


insert into work (Employee_SSN, Project_num, Working_hours)
values
(1, 1, 20),
(2, 2, 25),
(3, 5, 30),
(4, 3, 15),
(5, 4, 20)


insert into dependant (Essn, Dependant_Name, Gender, Bdate)
values
(1, 'Kareem', 1, '2010-09-15'),
(2, 'Layla', 0, '2015-04-22'),
(3, 'Zayd', 1, '2012-08-08'),
(4, 'Nora', 0, '2016-12-01'),
(5, 'Joud', 0, '2013-06-18')


select Fname + ' ' + Lname as [Full Name] from employee

select Pname, City from project where Dno = 2

update project set City = 'Muscat Central' where Pname = 'Cloud Migration'

select * from project

select * from dependant

delete from dependant where Dependant_Name = 'Zayd'

