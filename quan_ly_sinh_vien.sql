create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
CREATE TABLE class(

         class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

          class_name VARCHAR(60) NOT NULL,

          start_date DATETIME NOT NULL,

          Status BIT

);

CREATE TABLE student(

          student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

          student_name VARCHAR(30) NOT NULL,

          address VARCHAR(50),

          phone VARCHAR(20),

          Status BIT,

          class_id_class INT NOT NULL,

          FOREIGN KEY (class_id_class) REFERENCES class (class_id)

);

CREATE TABLE `subject`(

         sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

         sub_name VARCHAR(30) NOT NULL,

         credit TINYINT NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),

         `status` BIT DEFAULT 1

);

CREATE TABLE mark(

        mark_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

        sub_id_sub INT NOT NULL,

        student_id_student INT NOT NULL,

        mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),

        exam_times TINYINT DEFAULT 1,

        UNIQUE (sub_id_sub, student_id_student),

        FOREIGN KEY (sub_id_sub) REFERENCES `subject` (sub_id),

        FOREIGN KEY (student_id_student) REFERENCES student (student_id)

 );
 
 INSERT INTO class (class_name, start_date, `status`) VALUES
('Java Basic', '2025-01-10 08:00:00', 1),
('Database Fundamentals', '2025-02-15 09:00:00', 1),
('Web Development', '2025-03-01 13:30:00', 0);

INSERT INTO student (student_name, address, phone, `status`, class_id_class) VALUES
('Nguyen Van A', 'Ha Noi', '0901234567', 1, 1),
('Tran Thi B', 'Hai Phong', '0912345678', 1, 2),
('Le Van C', 'Da Nang', '0923456789', 0, 1),
('Pham Thi D', 'HCM City', '0934567890', 1, 3);

INSERT INTO `subject` (sub_name, credit, `status`) VALUES
('SQL Basics', 3, 1),
('Java Programming', 4, 1),
('Web Design', 2, 1),
('Data Structures', 3, 0);

INSERT INTO mark (sub_id_sub, student_id_student, mark, exam_times) VALUES
(1, 1, 85.5, 1),  
(2, 1, 78.0, 1),  
(1, 2, 92.0, 1),  
(3, 2, 74.5, 2), 
(2, 3, 60.0, 1),  
(1, 4, 88.0, 1);  

select * from class;
select * from student;
select * from `subject`;
select * from mark;

select s.sub_name, s.credit 
from `subject` s 
where s.credit  >= all(select s.credit  from`subject` s);

select s.*, m.mark 
from `subject` s join mark m on s.sub_id = m.sub_id_sub 
where m.mark = (select max(m.mark) 
from mark m);

select s.student_id, s.student_name, avg(m.mark) as avg_mark 
from student s join mark m on s.student_id = m.student_id_student 
group by s.student_id 
order by avg_mark desc;

select s.student_id, s.student_name, (select avg(m.mark) from mark m where s.student_id = m.student_id_student) as avg_mark 
from student s 
order by avg_mark desc;
