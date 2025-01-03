package com.example.usermanagement.servlet;

import com.example.usermanagement.dao.RoomDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class DeleteRoomServlet extends HttpServlet {
    private RoomDAO roomDAO = new RoomDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        roomDAO.deleteRoom(id);
        response.sendRedirect("listRooms");
    }
}

