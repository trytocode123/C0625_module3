create database quan_ly_su_dung_may_tinh;

use quan_ly_su_dung_may_tinh;

create table computer(
id int auto_increment primary key,
brand varchar(20),
position_put varchar(20)
);


create table customer(
id int auto_increment primary key,
`name` varchar(20),
phone_number varchar(20),
email varchar(20),
type_customer varchar(20),
name_attemp_service varchar(20)
);

create table computer_customer(
id_customer int,
id_computer int,
start_time date,
end_time date,
primary key(id_computer,id_customer),
foreign key (id_computer) references computer(id),
foreign key (id_customer) references customer(id),
total_payment int
);

create table service(
id int auto_increment primary key,
name_attemp varchar(20),
price int
);

create table customer_service(
id_customer int,
id_service int,
primary key(id_customer,id_service),
foreign key (id_customer) references customer(id),
foreign key (id_service) references service(id)
);