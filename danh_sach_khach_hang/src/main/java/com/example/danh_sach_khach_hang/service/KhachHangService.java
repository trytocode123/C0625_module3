package com.example.danh_sach_khach_hang.service;

import com.example.danh_sach_khach_hang.entity.KhachHang;
import com.example.danh_sach_khach_hang.repository.IKhachHangRepository;
import com.example.danh_sach_khach_hang.repository.KhachHangRepository;

import java.util.List;

public class KhachHangService implements IKhahHangServive {
    IKhachHangRepository khachHangRepository = new KhachHangRepository();

    @Override
    public List<KhachHang> findALl() {
        return khachHangRepository.findAll();
    }
}
