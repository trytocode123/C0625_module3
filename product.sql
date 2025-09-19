create database product;
use product;

create table products(
id int auto_increment primary key,
product_code varchar(20),
product_name varchar(20),
product_price int,
product_amount int,
product_description varchar(50)
);

create table `history`(
id int auto_increment primary key,
product_code varchar(20),
product_name varchar(20),
product_price int,
product_amount int,
product_description varchar(50),
old_product_description varchar(50)
);

insert into products 
(product_code, product_name, product_price, product_amount, product_description, product_status) 
values
('P001', 'Laptop Asus', 18500000.00, 10, 'Laptop gaming RTX 3050', TRUE),
('P002', 'Chuột DareU', 350000.00, 50, 'Chuột chơi game có dây', TRUE),
('P003', 'Bàn phím EK75', 1250000.00, 20, 'Bàn phím cơ DareU EK75', TRUE),
('P004', 'Tai nghe Logitech', 890000.00, 15, 'Tai nghe gaming 7.1', FALSE);

create unique index i_product_id on products(id);
create index i_product_name_price on products(product_name,product_price);
select * from products;
explain select * from products;

create view w_products as 
select p.product_code, p.product_name, p.product_price, p.product_status from products p;

select * from  w_products;
SET sql_safe_updates = 0;
update w_products set  product_price = 20000000 where product_code = 'P001';
drop view w_products;

delimiter //
create procedure p_get_all()
begin
select p.* from products p;
end //
delimiter ;

call p_get_all();

delimiter //
create procedure p_insert()
begin
insert into products (product_code, product_name, product_price, product_amount, product_description, product_status) 
 values('P005', 'Màn hình Dell 24', 3200000.00, 8, 'Màn hình IPS Full HD', TRUE);
end //
delimiter ;

call p_insert();

delimiter //
create procedure p_update(in id_product int, in `description` varchar(50))
begin
update products set product_description = `description` where id = id_product;
end //
delimiter ;

call p_update(2, 'Chuột chơi game không dây');

delimiter //
create procedure p_delete(in id_product int)
begin
delete from products where id = id_product;
end //
delimiter ;

call p_delete(2);

delimiter //
create trigger t_product after 
update on products 
for each row
begin 
insert into `history`(product_code, product_name, product_price, product_amount, product_description,old_product_description) 
values( new.product_code, 
        new.product_name, 
        new.product_price, 
        new.product_amount, 
        new.product_description,
        old.product_description
        );
end //
delimiter ;
update products set product_description = 'Bàn phím cơ Ekko 1231' where id = 3;
select * from `history`;

drop trigger t_product;

