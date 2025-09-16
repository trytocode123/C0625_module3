create database quan_ly_may_tinh;

use quan_ly_may_tinh;

create table computer(
id int auto_increment primary key,
brand varchar(20),
position_put varchar(20)
);

-- Tên, SĐT, Email, Loại khách hàng

create table customer(
`name` varchar(20) primary key,
phone_number varchar(20),
email varchar(20),
type_customer varchar(20),
name_attemp_service varchar(20),
foreign key (name_attemp_service) references service(name_attemp)
);

create table computer_customer(
id_computer int,
name_customer varchar(20),
start_time date,
end_time date,don_dat_hang
primary key(id_computer,name_customer),
foreign key (id_computer) references computer(id),
foreign key (name_customer) references customer(`name`),
total_payment int
);

create table service(
name_attemp varchar(20) primary key,
name_customer varchar(20),
foreign key (name_customer) references customer(`name`)
);