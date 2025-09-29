package com.example.danh_sach_khach_hang.entity;

import java.time.LocalDate;

public class KhachHang {
    String ten;
    LocalDate ngaySinh;
    String diaChi;
    String img;

    public KhachHang() {
    }

    public KhachHang(String ten, LocalDate ngaySinh, String diaChi, String img) {
        this.ten = ten;
        this.ngaySinh = ngaySinh;
        this.diaChi = diaChi;
        this.img = img;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public LocalDate getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(LocalDate ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
