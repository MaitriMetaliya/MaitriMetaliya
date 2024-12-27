Create database insitute;
Use insitute;
Create Table students
(
id Int  auto_increment primary key,
sname varchar(100)
);

Create table Courses
(
id Int auto_increment primary key,
cname varchar(100),
fees int
);

Create table student_courses
(
student_id int ,
course_id int,
foreign key (student_id) references students(id),
foreign key (course_id) references Courses(id)
);

Insert Into students(sname)
values ('Alex'),('Raju'),('Shamu');

Insert Into Courses( id ,cname,fees)
values(101,'Java',2000);

Insert Into Courses (cname ,fees)
values('sql',4000),('php','1000');

Select * from Courses;
Select * from students;
Select * from student_courses;
insert into student_courses (student_id ,course_id)
values(1,101),(2,103),(3,101);

Select sname ,cname from students
join 
student_courses on student_courses.student_id = students.id
join 
courses on student_courses.course_id = Courses.id;

Select sname ,count(cname) from students
join
student_courses on student_courses.student_id = students.id
join
courses on student_courses.course_id = Courses.id
group by sname;

Select sname ,sum(fees) from students
join
student_courses on student_courses.student_id = students.id
join
courses on student_courses.course_id = Courses.id
group by sname;


