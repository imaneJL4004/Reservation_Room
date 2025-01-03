package com.example.usermanagement.servlet.client;

import com.example.usermanagement.dao.ReservationDAO;
import com.example.usermanagement.dao.RoomDAO;
import com.example.usermanagement.model.Reservation;
import com.example.usermanagement.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ClientEditReservationServlet extends HttpServlet {
    private ReservationDAO reservationDAO = new ReservationDAO();
    private RoomDAO roomDAO = new RoomDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reservationId = Integer.parseInt(request.getParameter("id"));
        User user = (User) request.getSession().getAttribute("user");

        Reservation reservation = reservationDAO.getReservationById(reservationId);

        // Verify that the reservation belongs to the current user
        if (reservation != null && reservation.getUser().getId() == user.getId()) {
            request.setAttribute("reservation", reservation);
            request.getRequestDispatcher("/client/edit-reservation.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/clientdashboard");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int reservationId = Integer.parseInt(request.getParameter("reservationId"));
        String startTimeStr = request.getParameter("startTime");
        String endTimeStr = request.getParameter("endTime");

        Reservation reservation = reservationDAO.getReservationById(reservationId);

        // Verify that the reservation belongs to the current user
        if (reservation != null && reservation.getUser().getId() == user.getId()) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            try {
                Date startTime = dateFormat.parse(startTimeStr);
                Date endTime = dateFormat.parse(endTimeStr);

                reservation.setStartTime(startTime);
                reservation.setEndTime(endTime);

                reservationDAO.updateReservation(reservation);

                response.sendRedirect(request.getContextPath() + "/clientdashboard");
            } catch (ParseException e) {
                throw new ServletException("Invalid date format", e);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/clientdashboard");
        }
    }
}

