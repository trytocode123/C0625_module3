package com.example.product.controller;

import com.example.product.entity.Product;
import com.example.product.service.IProductService;
import com.example.product.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/products")
public class ProductController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        IProductService productService = new ProductService();
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "list":
                List<Product> productList = productService.findAll();
                req.setAttribute("productList", productList);
                req.getRequestDispatcher("views/product/list.jsp").forward(req, resp);
                break;
        }
    }
}
