--Trainee Perspective 

--1. Show all available courses (title, level, category) 
select title, course_level, category from Course

--2. View beginner-level Data Science courses 
select title,category,course_level from Course where course_level='Beginner' and category='Data Science'

--3. Show courses this trainee is enrolled in
select c.title from Enrollment e join Course c on e.course_id = c.course_id where trainee_id = 1

--4. View the schedule (start_date, time_slot) for the trainee's enrolled courses 
select s.start_date,s.time_slot from Enrollment e join Schedule s on e.course_id = s.course_id
where trainee_id = 1

--5. Count how many courses the trainee is enrolled in 
select trainee_id, count(course_id) as [No.courses] from Enrollment group by trainee_id

--6. Show course titles, trainer names, and time slots the trainee is attending 
select c.title, t.trainer_name,s.time_slot from Enrollment e join Course c on e.course_id = c.course_id
join Schedule s on c.course_id = s.course_id join Trainer t on t.trainer_id = s.trainer_id where e.trainee_id=1

--Trainer Perspective 

--1. List all courses the trainer is assigned to 
select s.trainer_id,c.title from Course c join Schedule s on s.course_id = c.course_id

--2. Show upcoming sessions (with dates and time slots) 
select start_date,end_date,time_slot from Schedule where start_date>GETDATE() and trainer_id =1

--3. See how many trainees are enrolled in each of your courses 
select c.title, count(e.trainee_id) as [trainee_count] from Schedule s join Course c on s.course_id = c.course_id
join Enrollment e on c.course_id = e.course_id where s.trainer_id=1 group by c.title;

--4. List names and emails of trainees in each of your courses 
select t.trainee_name, t.email from Enrollment e join Trainee t on e.trainee_id = t.trainee_id
join Course c on e.course_id = c.course_id join Schedule s on c.course_id = s.course_id
where s.trainer_id = 1 

--5. Show the trainer's contact info and assigned courses 
select tr.phone, tr.email, c.title from Trainer tr join Schedule s on tr.trainer_id = s.trainer_id
join Course c on s.course_id = c.course_id
where tr.trainer_id = 1

--6. Count the number of courses the trainer teaches 
select trainer_id, count(course_id) as [course_count] from Schedule
group by trainer_id

--Admin Perspective 

--1. Add a new course (INSERT statement) 
insert into Course(title,category,duration_hours,course_level)
values ('Machine Learning','Data Science',40,'Intermediate')

--2. Create a new schedule for a trainer 
insert into Schedule(course_id,trainer_id,start_date,end_date,time_slot)
values(5,3,'2025-08-01','2025-08-12','Evening')

--3. View all trainee enrollments with course title and schedule info 
select e.enrollment_id, tr.trainee_name as [trainee], c.title, s.start_date, s.end_date ,s.time_slot
from Enrollment e join Trainee tr on e.trainee_id = tr.trainee_id
join Course c   on e.course_id   = c.course_id
join Schedule s on c.course_id   = s.course_id

--4. Show how many courses each trainer is assigned to 
select trainer_id, count(course_id) as [course_count] from Schedule group by trainer_id

--5. List all trainees enrolled in "Data Basics" 
-- we dont have a course with this name: "Data Basics", but the query will be like the following:
select t.trainee_name,t.email from Enrollment e join Trainee t on e.trainee_id = t.trainee_id
join Course c on e.course_id = c.course_id where c.title = 'Data Basics'
-- i will write the query for the course "Database Fundamentals"
select t.trainee_name,t.email from Enrollment e join Trainee t on e.trainee_id = t.trainee_id
join Course c on e.course_id = c.course_id where c.title = 'Database Fundamentals'

--6. Identify the course with the highest number of enrollments 
select c.title, count(e.trainee_id) as [No.enrollments] from Course c
join Enrollment e on c.course_id = e.course_id group by c.title order by [No.enrollments] desc

--7. Display all schedules sorted by start date 
select * from Schedule order by start_date asc