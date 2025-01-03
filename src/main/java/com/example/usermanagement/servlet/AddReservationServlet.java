package com.example.usermanagement.servlet;

import com.example.usermanagement.dao.ReservationDAO;
import com.example.usermanagement.dao.RoomDAO;
import com.example.usermanagement.dao.UserDAO;
import com.example.usermanagement.model.Reservation;
import com.example.usermanagement.model.Room;
import com.example.usermanagement.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AddReservationServlet extends HttpServlet {
    private ReservationDAO reservationDAO = new ReservationDAO();
    private UserDAO userDAO = new UserDAO();
    private RoomDAO roomDAO = new RoomDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        String startTimeStr = request.getParameter("startTime");
        String endTimeStr = request.getParameter("endTime");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        Date startTime, endTime;
        try {
            startTime = dateFormat.parse(startTimeStr);
            endTime = dateFormat.parse(endTimeStr);
        } catch (ParseException e) {
            throw new ServletException("Invalid date format", e);
        }

        User user = userDAO.getUserById(userId);
        Room room = roomDAO.getRoomById(roomId);

        if (user != null && room != null && room.isAvailable()) {
            Reservation reservation = new Reservation();
            reservation.setUser(user);
            reservation.setRoom(room);
            reservation.setStartTime(startTime);
            reservation.setEndTime(endTime);

            reservationDAO.saveReservation(reservation);

            room.setAvailable(false);
            roomDAO.updateRoom(room);

            response.sendRedirect("listReservations");
        } else {
            response.sendRedirect("add-reservation.jsp?error=invalid");
        }
    }
}

