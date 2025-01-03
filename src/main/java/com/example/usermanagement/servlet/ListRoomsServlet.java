package com.example.usermanagement.servlet;

import com.example.usermanagement.dao.RoomDAO;
import com.example.usermanagement.model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class ListRoomsServlet extends HttpServlet {
    private RoomDAO roomDAO = new RoomDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Room> roomList = roomDAO.getAllRooms();
        request.setAttribute("roomList", roomList);
        request.getRequestDispatcher("list-rooms.jsp").forward(request, response);
    }
}

