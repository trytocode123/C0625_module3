package com.example.calculator.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Calculator", value = "/calculator")
public class Calculator extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float firstNum;
        float secondNum;
        String operator = req.getParameter("operator");
        try {
            firstNum = Float.parseFloat(req.getParameter("first"));
            secondNum = Float.parseFloat(req.getParameter("second"));
            req.setAttribute("first", firstNum);
            req.setAttribute("second", secondNum);
            switch (operator) {
                case "Addition":
                    float sum = firstNum + secondNum;
                    req.setAttribute("sum", sum);
                    req.getRequestDispatcher("views/calculator/add.jsp").forward(req, resp);
                    break;
                case "Division":
                    float division = firstNum / secondNum;
                    req.setAttribute("division", division);
                    try {
                        if (secondNum == 0) {
                            throw new Exception("Can not divide zero");
                        }
                        req.getRequestDispatcher("views/calculator/divide.jsp").forward(req, resp);
                    } catch (Exception e) {
                        req.setAttribute("error", e.getMessage());
                        req.getRequestDispatcher("views/calculator/canNotDivideZero.jsp").forward(req, resp);
                    }
                    break;
                case "Minus":
                    float minus = firstNum - secondNum;
                    req.setAttribute("minus", minus);
                    req.getRequestDispatcher("views/calculator/minus.jsp").forward(req, resp);
                    break;
                case "Multiplication":
                    float multiplication = firstNum * secondNum;
                    req.setAttribute("multiplication", multiplication);
                    req.getRequestDispatcher("views/calculator/multi.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            req.getRequestDispatcher("views/home.jsp").forward(req, resp);
        }


    }
}
