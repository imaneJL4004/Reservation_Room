package com.example.usermanagement.servlet;

import com.example.usermanagement.dao.UserDAO;
import com.example.usermanagement.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class ListUsersServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userDAO.getAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("list-users.jsp").forward(request, response);
    }
}
