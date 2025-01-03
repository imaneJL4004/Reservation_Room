package com.example.usermanagement.servlet;

import com.example.usermanagement.dao.UserDAO;
import com.example.usermanagement.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AddUserServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        System.out.println("First Name: " + firstName);  // Debugging
        System.out.println("Last Name: " + lastName);  // Debugging
        System.out.println("Email: " + email);  // Debugging
        System.out.println("Phone: " + phone);  // Debugging

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhone(phone);

        userDAO.saveUser(user);
        response.sendRedirect("listUsers");
    }

}
