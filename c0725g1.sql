create database if not exists c0725g1;
use c0725g1;
-- tạo bảng
create table jame(
username varchar(50)primary key,
password varchar(50)
);

create table class(
id int primary key auto_increment,
name varchar(10)
);

create table student(
id int primary key auto_increment,
`name` varchar(50),
gender boolean,
birthday date,
email varchar(50),
score float,
username varchar(50),
class_id int,
foreign key(username) references jame(username),
foreign key(class_id) references class(id)
);

create table phone(
phone_number varchar(20) primary key,
student_id int,
foreign key(student_id) references student(id)
);

create table instructor(
id int primary key auto_increment,
`name` varchar(50),
salary float,
birthday date
);

create table instructor_class(
instructor_id int,
class_id int,
start_time date,
end_time date,
primary key(instructor_id,class_id),
foreign key(instructor_id) references instructor(id),
foreign key(class_id) references class(id)
);

insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');

insert into jame(`username`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`username`,`password`)
 values('chau','12345');
 
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);

insert into instructor_class(class_id,instructor_id,start_time,end_time) 
values 
(1,3,'2025-12-01','2025-12-12'),
(2,1,'2025-12-11','2025-12-12'),
(3,1,'2025-09-11','2025-09-12'),
(3,2,'2025-08-11','2025-08-12'),
(1,1,'2025-12-17','2025-12-20'),
(2,2,'2025-12-24','2025-12-30');

insert into student(`name`,birthday, gender,`score`, class_id,`username`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');
 
insert into student(`name`,birthday, gender,`score`, class_id) 
 values ('nguyen van a','1981-12-12',1,8,null),('tran van b','1981-12-12',1,5,null);
 
insert into phone(phone_number,student_id) 
 values(0938305111,1),(0938305112,1),(0938305113,1),
       (0938305222,2),(0938305223,2),
       (0938305333,3);
--   insert into student(`name`,birthday, gender,`point`, class_id,`username`) 
--  values ('nguyen minh hai chau','1981-12-12',1,8,null,'chau');
 
 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);

select * from phone;
select* from class;
select* from student;
select* from jame;
select* from instructor;
select * from instructor_class;

select s.*, c.`name` from student s join class c on c.id = s.class_id;
select s.*, ifnull(c.`name`, "chua co lop") as class  from student s left join class c on c.id = s.class_id;
select s.* from student s where s.`name` like "% hai" or s.`name` like "% huynh";
select s.* from student s where score > 5;
select s.* from student s where `name` like "nguyen %";
select count(id) as count, s.score from student s group by score; 
select count(id) as count, s.score from student s where score > 5 group by score; 
select count(id) as count, s.score from student s where score > 5 group by score having count(id) >=2;
select s.*, c.`name` from student s  join class c on c.id = s.class_id where c.`name` = "c1121g1" order by s.name asc;

select s.*, c.`name`, group_concat(p.phone_number) 
from student s  
join class c on c.id = s.class_id 
left join phone p on s.id = p.student_id
group by s.id
;

select s.* from student s where substring_index(s.`name`,' ', -1) like "h%";
select s.* from student s where month(s.birthday) = 12;

update student s set s.class_id = 3 where s.id = 1;

select s.`name`, s.score from student s order by s.score desc;




