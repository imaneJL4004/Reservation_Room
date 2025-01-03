<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.usermanagement.dao.RoomDAO, com.example.usermanagement.model.Room" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Room</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    RoomDAO roomDAO = new RoomDAO();
    Room room = roomDAO.getAllRooms().stream()
            .filter(r -> r.getId() == id)
            .findFirst()
            .orElse(null);
%>
<h1 style="text-align: center;">Edit Room</h1>
<form action="editRoom" method="post" style="width: 50%; margin: auto;">
    <input type="hidden" name="id" value="<%= room.getId() %>">
    <label>Name:</label><br>
    <input type="text" name="name" value="<%= room.getName() %>" required><br><br>
    <label>Capacity:</label><br>
    <input type="number" name="capacity" value="<%= room.getCapacity() %>" required><br><br>
    <label>Type:</label><br>
    <input type="text" name="type" value="<%= room.getType() %>" required><br><br>
    <input type="submit" value="Update Room">
</form>
<a href="listRooms" style="display: block; text-align: center; margin-top: 20px;">Back to Room List</a>
</body>
</html>

