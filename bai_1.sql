create database bai_1;

use bai_1;

create table class(
id int primary key auto_increment,
name varchar(20)
);


create table teacher(
id int primary key auto_increment,
name varchar(20),
age int,
country varchar(20)
);

insert into class(name) values("C06"), ("C07"), ("C08");

select * from class;

delete from class where id = 1;

update class set name = "C10" where id = "2";

insert into teacher(name , age ,country) values("Chánh", 45, "Việt Nam"),("Chánh2", 45, "Việt Nam"),("Chánh3", 45, "Việt Nam");

select * from teacher;

update teacher set name="Thành" where id = 1;

delete from teacher where id=3;
 

 

