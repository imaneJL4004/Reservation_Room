package com.example.usermanagement.servlet.client;

import com.example.usermanagement.dao.ReservationDAO;
import com.example.usermanagement.model.Reservation;
import com.example.usermanagement.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class ClientDashboardServlet extends HttpServlet {
    private ReservationDAO reservationDAO = new ReservationDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        request.getSession().setAttribute("userFirstName", user.getFirstName());

        List<Reservation> userReservations = reservationDAO.getReservationsByUser(user.getId());
        request.setAttribute("reservations", userReservations);
        request.getRequestDispatcher("/clientdashboard.jsp").forward(request, response);
    }
}

