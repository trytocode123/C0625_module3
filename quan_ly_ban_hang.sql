create database quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer(
c_id int auto_increment primary key,
c_name varchar(50),
c_age int
);

create table `order`(
o_id int auto_increment primary key,
c_id_customer int,
foreign key (c_id_customer) references customer(c_id),
o_date datetime
);

create table product(
p_id int auto_increment primary key,
p_name varchar(50),
p_price float
);

create table order_detail(
o_id_order int,
p_id_product int,
primary key(o_id, p_id),
foreign key (o_id_order) references `order`(o_id),
foreign key (p_id_product) references product(p_id),
od_QTY varchar(50)
);