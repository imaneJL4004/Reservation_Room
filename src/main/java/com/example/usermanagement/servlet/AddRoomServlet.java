package com.example.usermanagement.servlet;

import com.example.usermanagement.dao.RoomDAO;
import com.example.usermanagement.model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AddRoomServlet extends HttpServlet {
    private RoomDAO roomDAO = new RoomDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String type = request.getParameter("type");

        Room room = new Room();
        room.setName(name);
        room.setCapacity(capacity);
        room.setType(type);

        roomDAO.saveRoom(room);
        response.sendRedirect("listRooms");
    }
}

