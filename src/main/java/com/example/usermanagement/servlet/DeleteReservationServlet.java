package com.example.usermanagement.servlet;

import com.example.usermanagement.dao.ReservationDAO;
import com.example.usermanagement.dao.RoomDAO;
import com.example.usermanagement.model.Reservation;
import com.example.usermanagement.model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeleteReservationServlet extends HttpServlet {
    private ReservationDAO reservationDAO = new ReservationDAO();
    private RoomDAO roomDAO = new RoomDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Reservation reservation = reservationDAO.getReservationById(id);

        if (reservation != null) {
            Room room = reservation.getRoom();
            room.setAvailable(true);
            roomDAO.updateRoom(room);

            reservationDAO.deleteReservation(id);
        }

        response.sendRedirect("listReservations");
    }
}

