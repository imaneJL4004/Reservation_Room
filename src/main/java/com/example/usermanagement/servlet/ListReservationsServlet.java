package com.example.usermanagement.servlet;

import com.example.usermanagement.dao.ReservationDAO;
import com.example.usermanagement.model.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class ListReservationsServlet extends HttpServlet {
    private ReservationDAO reservationDAO = new ReservationDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Reservation> reservationList = reservationDAO.getAllReservations();
        request.setAttribute("listReservations", reservationList);
        request.getRequestDispatcher("list-reservations.jsp").forward(request, response);
    }
}

