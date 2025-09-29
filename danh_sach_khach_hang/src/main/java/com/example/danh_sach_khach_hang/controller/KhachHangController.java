package com.example.danh_sach_khach_hang.controller;


import com.example.danh_sach_khach_hang.entity.KhachHang;
import com.example.danh_sach_khach_hang.service.IKhahHangServive;
import com.example.danh_sach_khach_hang.service.KhachHangService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "KhachHangController", value = "/khach-hang")
public class KhachHangController extends HttpServlet {
    IKhahHangServive khahHangServive = new KhachHangService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<KhachHang> khachHangList = khahHangServive.findALl();
        req.setAttribute("khachHangList", khachHangList);
        req.getRequestDispatcher("views/khach_hang/findAll.jsp").forward(req, resp);
    }
}
