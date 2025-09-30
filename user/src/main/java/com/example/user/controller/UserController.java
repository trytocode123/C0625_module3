package com.example.user.controller;

import com.example.user.entity.User;
import com.example.user.service.IUserService;
import com.example.user.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserController", value = "/users")
public class UserController extends HttpServlet {
    private final IUserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                try {
                    String name = req.getParameter("name");
                    String email = req.getParameter("email");
                    String country = req.getParameter("country");
                    User user = new User(name, email, country);
                    userService.add(user);
                    try {
                        resp.sendRedirect("/users?action=list");
                    } catch (IOException e) {
                        throw new RuntimeException();
                    }
                } catch (Exception e) {
                    req.getRequestDispatcher("views/user/add.jsp").forward(req, resp);
                }
            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name");
                String email = req.getParameter("email");
                String country = req.getParameter("country");
                userService.update(id, new User(name, email, country));
                try {
                    resp.sendRedirect("/users?action=list");
                } catch (IOException e) {
                    throw new RuntimeException();
                }
                break;
            case "search":
                String countrySearch = req.getParameter("search");
                List<User> users = userService.findByCountry(countrySearch);
                req.setAttribute("userList", users);
                req.getRequestDispatcher("views/user/list.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                List<User> userList = userService.findAll();
                req.setAttribute("userList", userList);
                req.getRequestDispatcher("views/user/list.jsp").forward(req, resp);
                break;
            case "add":
                req.getRequestDispatcher("views/user/add.jsp").forward(req, resp);
                break;
            case "delete":
                int iD = Integer.parseInt(req.getParameter("id"));
                userService.delete(iD);
                try {
                    resp.sendRedirect("/users?action=list");
                } catch (IOException e) {
                    throw new RuntimeException();
                }
                break;
            case "update":
                int iDUpdate = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("id", iDUpdate);
                req.getRequestDispatcher("views/user/update.jsp").forward(req, resp);
                break;
        }
    }
}
