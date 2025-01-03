package com.example.usermanagement.servlet.admin;

import com.example.usermanagement.dao.ReservationDAO;
import com.example.usermanagement.dao.RoomDAO;
import com.example.usermanagement.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class AdminDashboardServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    private RoomDAO roomDAO = new RoomDAO();
    private ReservationDAO reservationDAO = new ReservationDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Integer> stats = new HashMap<>();

        stats.put("totalUsers", userDAO.getAllUsers().size());
        stats.put("totalRooms", roomDAO.getAllRooms().size());
        stats.put("totalReservations", reservationDAO.getAllReservations().size());
        stats.put("availableRooms", roomDAO.getAvailableRooms().size());

        request.setAttribute("stats", stats);
        request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
    }
}

