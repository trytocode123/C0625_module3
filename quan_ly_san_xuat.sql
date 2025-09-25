create database quan_ly_san_xuat;

use quan_ly_san_xuat;

create table phieu_xuat(
so_phieu_xuat int auto_increment primary key,
ngay_xuat date
);

create table vat_tu(
ma_vat_tu varchar(20) primary key,
ten_vat_tu varchar(20)
);

create table phieu_xuat_vat_tu(
dg_xuat varchar(50),
sl_xuat varchar(50),
so_phieu_xuat_phieu_xuat int ,
ma_vat_tu_vat_tu varchar(20) ,
primary key(so_phieu_xuat_phieu_xuat,ma_vat_tu_vat_tu),
foreign key(so_phieu_xuat_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key(ma_vat_tu_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap(
so_phieu_nhap int auto_increment primary key,
ngay_nhap date
);

create table phieu_nhap_vat_tu(
dg_nhap varchar(50),
sl_nhap varchar(50),
ma_vat_tu_vat_tu varchar(50),
so_phieu_nhap_phieu_nhap int,
primary key(ma_vat_tu_vat_tu, so_phieu_nhap_phieu_nhap),
foreign key(ma_vat_tu_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_phieu_nhap_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);

create table nha_cung_cap(
ma_nha_cung_cap varchar(20) primary key,
ten_nha_cung_cap varchar(20),
dia_chi varchar(20)
);
create table don_dat_hang(
so_dat_hang int auto_increment primary key,
ngay_dat_hang date,
ma_nha_cung_cap_nha_cung_cap varchar(20),
foreign key(ma_nha_cung_cap_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table don_dat_hang_vat_tu(
so_dat_hang_don_dat_hang int auto_increment ,
ma_vat_tu_vat_tu varchar(20),
primary key(so_dat_hang_don_dat_hang,ma_vat_tu_vat_tu),
foreign key(so_dat_hang_don_dat_hang) references don_dat_hang(so_dat_hang),
foreign key(ma_vat_tu_vat_tu) references vat_tu(ma_vat_tu)
);

create table so_dien_thoai(
sdt varchar(10),
ma_nha_cung_cap_nha_cung_cap varchar(20),
primary key(sdt, ma_nha_cung_cap_nha_cung_cap),
foreign key (ma_nha_cung_cap_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);



















