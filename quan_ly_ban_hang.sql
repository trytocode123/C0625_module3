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
o_date date,
o_total_price float
);

create table product(
p_id int auto_increment primary key,
p_name varchar(50),
p_price float
);

create table order_detail(
o_id_order int,
p_id_product int,
primary key(o_id_order, p_id_product),
foreign key (o_id_order) references `order`(o_id),
foreign key (p_id_product) references product(p_id),
od_QTY varchar(50)
);

select * from customer;
select * from `order`;
select * from product;
select * from order_detail;

insert into customer(c_name, c_age) values("Minh Quang", 10), ("Ngoc Oanh", 20),("Hong Ha", 50);
insert into `order`(c_id_customer, o_date) values(1,'2006-03-21'), (2,'2006-03-23'),(1,'2006-03-16');
insert into product(p_name, p_price) values("May Giat", 3),("Tu Lanh", 5),("Dieu Hoa", 7),("Quat", 1),("Bep Dien", 2);
insert into order_detail(o_id_order,p_id_product,od_QTY) values(1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

select o.o_id, o.o_date, o.o_total_price from `order` o;
select c.* from customer c join `order` o on c.c_id = o.c_id_customer group by c.c_id;
select o.* from `order` o join customer c on c.c_id = c_id_customer group by c.c_id;
select c.*, o.c_id_customer from customer c left join `order` o on c.c_id = o.c_id_customer where o.c_id_customer is null;
select p.p_name from product p join order_detail od on p.p_id = od.p_id_product group by p.p_name;
select o.o_id, o.o_date, SUM(od.od_QTY * p.p_price) AS o_total_price, od.p_id_product, p.p_name from `order` o 
join order_detail od
on o.o_id = od.o_id_order
join product p on od.p_id_product = p.p_id
group by o.o_id, od.p_id_product;
