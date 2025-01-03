<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.usermanagement.model.Reservation, com.example.usermanagement.model.User, com.example.usermanagement.model.Room, java.util.List, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Reservation</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f4f4f4;
    }
    h1 {
      color: #333;
      text-align: center;
    }
    form {
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      max-width: 500px;
      margin: 0 auto;
    }
    label {
      display: block;
      margin-top: 10px;
    }
    input[type="datetime-local"], select {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      border: 1px solid #ddd;
      border-radius: 4px;
      box-sizing: border-box;
    }
    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      float: right;
      margin-top: 20px;
    }
    input[type="submit"]:hover {
      background-color: #45a049;
    }
    .back-link {
      display: inline-block;
      margin-top: 20px;
      color: #666;
      text-decoration: none;
    }
    .back-link:hover {
      color: #333;
    }
  </style>
</head>
<body>
<%
  Reservation reservation = (Reservation) request.getAttribute("reservation");
  List<User> users = (List<User>) request.getAttribute("users");
  List<Room> rooms = (List<Room>) request.getAttribute("rooms");
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
%>
<h1>Edit Reservation</h1>
<form action="editReservation" method="post">
  <input type="hidden" name="id" value="<%= reservation.getId() %>">

  <label for="userId">User:</label>
  <select name="userId" id="userId" required>
    <% for (User user : users) { %>
    <option value="<%= user.getId() %>" <%= (user.getId() == reservation.getUser().getId()) ? "selected" : "" %>>
      <%= user.getFirstName() + " " + user.getLastName() %>
    </option>
    <% } %>
  </select>

  <label for="roomId">Room:</label>
  <select name="roomId" id="roomId" required>
    <% for (Room room : rooms) { %>
    <option value="<%= room.getId() %>" <%= (room.getId() == reservation.getRoom().getId()) ? "selected" : "" %>>
      <%= room.getName() %>
    </option>
    <% } %>
  </select>

  <label for="startTime">Start Time:</label>
  <input type="datetime-local" id="startTime" name="startTime" value="<%= dateFormat.format(reservation.getStartTime()) %>" required>

  <label for="endTime">End Time:</label>
  <input type="datetime-local" id="endTime" name="endTime" value="<%= dateFormat.format(reservation.getEndTime()) %>" required>

  <input type="submit" value="Update Reservation">
</form>
<a href="listReservations" class="back-link">Back to Reservation List</a>
</body>
</html>

