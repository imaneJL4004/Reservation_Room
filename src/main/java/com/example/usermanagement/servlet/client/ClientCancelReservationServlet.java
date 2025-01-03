package com.example.usermanagement.servlet.client;

import com.example.usermanagement.dao.ReservationDAO;
import com.example.usermanagement.dao.RoomDAO;
import com.example.usermanagement.model.Reservation;
import com.example.usermanagement.model.Room;
import com.example.usermanagement.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ClientCancelReservationServlet extends HttpServlet {
    private ReservationDAO reservationDAO = new ReservationDAO();
    private RoomDAO roomDAO = new RoomDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reservationId = Integer.parseInt(request.getParameter("id"));
        User user = (User) request.getSession().getAttribute("user");

        Reservation reservation = reservationDAO.getReservationById(reservationId);

        // Verify that the reservation belongs to the current user
        if (reservation != null && reservation.getUser().getId() == user.getId()) {
            Room room = reservation.getRoom();
            room.setAvailable(true);

            // Update room availability and delete reservation
            roomDAO.updateRoom(room);
            reservationDAO.deleteReservation(reservationId);
        }

        response.sendRedirect(request.getContextPath() + "/clientdashboard");
    }
}

