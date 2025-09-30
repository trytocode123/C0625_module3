CREATE DATABASE users_manager;
USE users_manager; 
create table users ( 
      id int(3) NOT NULL AUTO_INCREMENT, 
      name varchar(120) NOT NULL, 
      email varchar(220) NOT NULL, 
      country varchar(120), 
      PRIMARY KEY (id) 
);


insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
insert into users(name, email, country) values('Alice','alice@example.com','USA');
insert into users(name, email, country) values('Bao','bao@fpt.vn','Viet Nam');
insert into users(name, email, country) values('Yuki','yuki@jp.co','Japan');
insert into users(name, email, country) values('Maria','maria@es.es','Spain');
insert into users(name, email, country) values('Hans','hans@de.de','Germany');
insert into users(name, email, country) values('Salah','salah@eg.com','Egypt');
insert into users(name, email, country) values('Chen','chen@cn.cn','China');
insert into users(name, email, country) values('David','david@uk.co','UK');

select * from users;