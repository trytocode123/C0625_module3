package com.example.danh_sach_khach_hang.repository;

import com.example.danh_sach_khach_hang.entity.KhachHang;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class KhachHangRepository implements IKhachHangRepository {
    static List<KhachHang> khachHangList = new ArrayList<>();

    static {
        khachHangList.add(new KhachHang("Mai Văn Hoàn", LocalDate.parse("1983-08-20"), "Hà Nội", "/pics/img_1.png"));
        khachHangList.add(new KhachHang("Nguyễn Văn Nam", LocalDate.parse("1983-08-21"), "Bắc Giang", "/pics/img_2.png"));
        khachHangList.add(new KhachHang("Nguyễn Thái Hòa", LocalDate.parse("1983-08-22"), "Nam Định", "/pics/img_3.png"));
        khachHangList.add(new KhachHang("Trần Đăng Khoa", LocalDate.parse("1983-08-17"), "Hà Tây", "/pics/img_4.png"));
        khachHangList.add(new KhachHang("Nguyễn Đình Thi", LocalDate.parse("1983-08-19"), "Hà Nội", "/pics/img_5.png"));
    }


    @Override
    public List<KhachHang> findAll() {
        return khachHangList;
    }
}
