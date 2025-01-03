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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ClientMakeReservationServlet extends HttpServlet {
    private ReservationDAO reservationDAO = new ReservationDAO();
    private RoomDAO roomDAO = new RoomDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
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

        Room room = roomDAO.getRoomById(roomId);

        if (room != null && room.isAvailable()) {
            Reservation reservation = new Reservation();
            reservation.setUser(user);
            reservation.setRoom(room);
            reservation.setStartTime(startTime);
            reservation.setEndTime(endTime);

            reservationDAO.saveReservation(reservation);

            room.setAvailable(false);
            roomDAO.updateRoom(room);

            response.sendRedirect(request.getContextPath() + "/clientdashboard");
        } else {
            response.sendRedirect(request.getContextPath() + "/client/ble?error=unavailable");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        Room room = roomDAO.getRoomById(roomId);
        request.setAttribute("room", room);
        request.getRequestDispatcher("/client/make-reservation.jsp").forward(request, response);
    }
}

