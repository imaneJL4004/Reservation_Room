<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.usermanagement.dao.UserDAO, com.example.usermanagement.dao.RoomDAO, com.example.usermanagement.model.User, com.example.usermanagement.model.Room, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Reservation</title>
  <style>
    /* Global Styles */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Roboto', Arial, sans-serif;
    }

    body {
      background-color: #f4f4f4;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
    }

    h1 {
      text-align: center;
      color: #1e88e5;
      font-size: 2.5rem;
      margin-bottom: 30px;
    }

    .container {
      background-color: #fff;
      padding: 40px;
      border-radius: 8px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 600px;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      font-size: 1rem;
      color: #333;
      margin-bottom: 5px;
    }

    select, input[type="datetime-local"] {
      padding: 10px;
      font-size: 1rem;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 5px;
      background-color: #f9f9f9;
      width: 100%;
    }

    input[type="submit"] {
      padding: 12px;
      background-color: #1e88e5;
      color: white;
      font-size: 1rem;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #1976d2;
    }

    .back-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      font-size: 1rem;
      color: #1e88e5;
      text-decoration: none;
    }

    .back-link:hover {
      text-decoration: underline;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .container {
        padding: 20px;
        width: 100%;
      }

      h1 {
        font-size: 2rem;
      }

      input[type="submit"] {
        font-size: 1.2rem;
      }
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Add New Reservation</h1>

  <%
    UserDAO userDAO = new UserDAO();
    RoomDAO roomDAO = new RoomDAO();
    List<User> users = userDAO.getAllUsers();
    List<Room> availableRooms = roomDAO.getAvailableRooms();
  %>

  <form action="addReservation" method="post">
    <label>User:</label>
    <select name="userId" required>
      <% for (User user : users) { %>
      <option value="<%= user.getId() %>"><%= user.getFirstName() + " " + user.getLastName() %></option>
      <% } %>
    </select>

    <label>Room:</label>
    <select name="roomId" required>
      <% for (Room room : availableRooms) { %>
      <option value="<%= room.getId() %>"><%= room.getName() %></option>
      <% } %>
    </select>

    <label>Start Time:</label>
    <input type="datetime-local" name="startTime" required>

    <label>End Time:</label>
    <input type="datetime-local" name="endTime" required>

    <input type="submit" value="Add Reservation">
  </form>

  <a href="listReservations" class="back-link">Back to Reservation List</a>
</div>

</body>
</html>
