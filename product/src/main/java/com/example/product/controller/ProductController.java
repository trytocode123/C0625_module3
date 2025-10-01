package com.example.product.controller;

import com.example.product.dto.ProductDto;
import com.example.product.entity.Category;
import com.example.product.entity.Product;
import com.example.product.service.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/products")
public class ProductController extends HttpServlet {
    IProductDtoService productDtoService = new ProductDtoService();
    ICategoryService categoryService = new CategoryService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        IProductService productService = new ProductService();
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                String nameProduct = req.getParameter("nameProduct");
                double price = Double.parseDouble(req.getParameter("price"));
                String description = req.getParameter("description");
                String producer = req.getParameter("producer");
                int category = Integer.parseInt(req.getParameter("category"));
                Product product = new Product(nameProduct, price, description, producer, category);
                productService.add(product);
                try {
                    resp.sendRedirect("/products?action=list");
                } catch (IOException e) {
                    throw new RuntimeException();
                }
                break;

            case "search":
                String nameProductSearch = req.getParameter("nameProduct");
                String categorySearch = req.getParameter("category");
                List<ProductDto> productDtoList = productDtoService.find(nameProductSearch, categorySearch);
                List<Category> categoryList = categoryService.findAll();
                req.setAttribute("productList", productDtoList);
                req.setAttribute("categoryList", categoryList);
                req.setAttribute("nameProductSearch", nameProductSearch);
                req.getRequestDispatcher("views/product/list.jsp").forward(req, resp);
                break;
            case "delete":
                int iDDel = Integer.parseInt(req.getParameter("idDel"));
                boolean result = productService.delete(iDDel);
                HttpSession session = req.getSession();
                if (result) {
                    session.setAttribute("toastType", "success");
                    session.setAttribute("toastMessage", "Xóa sản phẩm thành công!");
                } else {
                    session.setAttribute("toastType", "error");
                    session.setAttribute("toastMessage", "Xóa sản phẩm thất bại!");
                }
                try {
                    resp.sendRedirect("/products?action=list");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "update":
                int iD = Integer.parseInt(req.getParameter("id"));
                String nameProductUpdate = req.getParameter("nameProduct");
                double priceUpdate = Double.parseDouble(req.getParameter("price"));
                String descriptionUpdate = req.getParameter("description");
                String producerUpdate = req.getParameter("producer");
                int categoryUpdate = Integer.parseInt(req.getParameter("category"));
                Product productUpdate = new Product(iD,nameProductUpdate, priceUpdate, descriptionUpdate, producerUpdate, categoryUpdate);
                System.out.println(categoryUpdate);
                productService.update(productUpdate);
                try {
                    resp.sendRedirect("/products?action=list");
                } catch (IOException e) {
                    throw new RuntimeException();
                }

                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        List<Category> categoryList = categoryService.findAll();
        switch (action) {
            case "list":
                List<ProductDto> productDtoList = productDtoService.findAll();
                req.setAttribute("productList", productDtoList);
                req.setAttribute("categoryList", categoryList);
                req.getRequestDispatcher("views/product/list.jsp").forward(req, resp);
                break;
            case "add":
                req.setAttribute("categoryList", categoryList);
                req.getRequestDispatcher("views/product/add.jsp").forward(req, resp);
                break;
            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("categoryList", categoryList);
                req.setAttribute("id", id);
                req.getRequestDispatcher("views/product/update.jsp").forward(req, resp);
                break;
        }
    }
}
