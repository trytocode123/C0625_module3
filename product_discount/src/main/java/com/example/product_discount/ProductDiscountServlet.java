package com.example.product_discount;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "discountServlet", value = "/discount")
public class ProductDiscountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int listPrice = Integer.parseInt(req.getParameter("listPrice"));
        float discountPercent = Float.parseFloat(req.getParameter("discountPercent"));
        float discountAmount = listPrice * discountPercent * 0.01f;
        req.setAttribute("listPrice", listPrice);
        req.setAttribute("discountPercent", discountPercent);
        req.setAttribute("discountAmount", discountAmount);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(req, resp);
    }
}