create database learningDB

use learningDB

CREATE TABLE Instructors ( 
    InstructorID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Categories ( 
    CategoryID INT PRIMARY KEY, 
    CategoryName VARCHAR(50) 
); 
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    Title VARCHAR(100), 
    InstructorID INT, 
    CategoryID INT, 
    Price DECIMAL(6,2), 
    PublishDate DATE, 
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID), 
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) 
); 
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    JoinDate DATE 
); 
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollDate DATE, 
    CompletionPercent INT, 
    Rating INT CHECK (Rating BETWEEN 1 AND 5), 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 

-- Instructors 

INSERT INTO Instructors VALUES 
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'), 
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21'); 

-- Categories 

INSERT INTO Categories VALUES 
(1, 'Web Development'), 
(2, 'Data Science'), 
(3, 'Business'); 

-- Courses 

INSERT INTO Courses VALUES 
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'), 
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'), 
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'), 
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01');

-- Students 

INSERT INTO Students VALUES 
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'), 
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'), 
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10'); 

-- Enrollments 

INSERT INTO Enrollments VALUES 
(1, 201, 101, '2023-04-10', 100, 5), 
(2, 202, 102, '2023-04-15', 80, 4), 
(3, 203, 101, '2023-04-20', 90, 4), 
(4, 201, 102, '2023-04-22', 50, 3), 
(5, 202, 103, '2023-04-25', 70, 4), 
(6, 203, 104, '2023-04-28', 30, 2), 
(7, 201, 104, '2023-05-01', 60, 3);

---------------------------------------------------

-- Beginner Level
--1. Count total number of students. 
select count(*) as [total number of students] from Students
--2. Count total number of enrollments. 
select count(*) as [total number of enrollments] from Enrollments
--3. Find average rating of each course. 
select avg(Rating) as [avg rating] , CourseID from Enrollments group by CourseID
--4. Total number of courses per instructor. 
select count(*) as [courses], InstructorID from Courses group by InstructorID
--5. Number of courses in each category. 
select count(*) as [course_count],CategoryID from Courses group by CategoryID
--6. Number of students enrolled in each course. 
select count(*) as [No.students], CourseID from Enrollments group by CourseID
--7. Average course price per category. 
select avg(price) as [avg price], CategoryID from Courses group by CategoryID
--8. Maximum course price. 
select max(price) as [maximum course price] from Courses
--9. Min, Max, and Avg rating per course. 
select min(rating) as [min rating], max(rating) as [max rating], avg(rating) as [avg rating], CourseID 
from Enrollments group by CourseID
--10. Count how many students gave rating = 5.
select count(*) as [No.student] from Enrollments where Rating = 5

---------------------------------------------------------------------------

--Intermediate Level 

--1. Average completion percent per course. 
select avg(CompletionPercent) as [Average completion], CourseID from Enrollments group by CourseID
--2. Find students enrolled in more than 1 course. 
select StudentID, count(*) as [course count] from Enrollments group by StudentID having count(*)>1
--3. Calculate revenue per course (price * enrollments).	
select c.CourseID, c.price * count(e.EnrollmentID) as [revenue] from Courses c join Enrollments e on c.CourseID = e.CourseID
group by c.CourseID, c.Price
--4. List instructor name + distinct student count. 
select i.FullName,count(e.studentid) as [student count] from Instructors i join Courses c on i.InstructorID = c.InstructorID
join Enrollments e on e.CourseID = c.CourseID group by i.FullName
--5. Average enrollments per category. 
select c.categoryid, avg(ec.enrollmentCount) as [Average enrollments] from Courses c
join (select CourseID, count(*) as enrollmentCount from Enrollments group by CourseID) as ec on c.courseid = ec.courseid
group by c.CategoryID
--6. Average course rating by instructor. 
select c.InstructorID, avg(e.rating) as [avg rating] from Courses c join Enrollments e on c.CourseID = e.CourseID
group by c.InstructorID
--7. Top 3 courses by enrollment count. 
select top 3 CourseID,count(*) as [enrollmentCount] from Enrollments group by CourseID order by enrollmentCount desc
--8. Average days students take to complete 100% (use mock logic). 
select StudentID,CourseID,DATEDIFF(DAY,EnrollDate,DATEADD(DAY, 7, EnrollDate)) as daysToComplete from Enrollments where CompletionPercent=100
--9. Percentage of students who completed each course.
select CourseID,count(*)*100/count(StudentID) as [completion percennt] from Enrollments where CompletionPercent=100 group by CourseID
--10. Count courses published each year.
select YEAR(PublishDate) as [publishYear], count(CourseID) as [No.Course] from Courses group by YEAR(PublishDate)