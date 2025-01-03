<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.usermanagement.model.Room" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Available Rooms</title>
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
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 900px;
      margin: 2rem auto;
      background-color: #ffffff;
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    h1 {
      color: #1e88e5;
      text-align: center;
      margin-bottom: 1.5rem;
      font-size: 2rem;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 1.5rem;
    }

    th, td {
      padding: 12px;
      text-align: left;
      border: 1px solid #ddd;
    }

    th {
      background-color: #f1f1f1;
      font-weight: bold;
      text-transform: uppercase;
    }

    td {
      background-color: #fafafa;
    }

    td a {
      display: inline-block;
      padding: 8px 12px;
      background-color: #1e88e5;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      font-weight: 500;
    }

    td a:hover {
      background-color: #1565c0;
    }

    tr:nth-child(even) td {
      background-color: #f9f9f9;
    }

    tr:hover td {
      background-color: #f1f1f1;
    }

    .btn {
      display: inline-block;
      padding: 10px 15px;
      background-color: #1e88e5;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      margin-top: 2rem;
      text-align: center;
      font-weight: 500;
    }

    .btn:hover {
      background-color: #1565c0;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .container {
        padding: 1.5rem;
      }

      h1 {
        font-size: 1.8rem;
      }

      table, th, td {
        font-size: 0.9rem;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Available Rooms</h1>
  <table>
    <thead>
    <tr>
      <th>Room Name</th>
      <th>Capacity</th>
      <th>Type</th>
      <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
      // Retrieve available rooms from the request scope
      List<Room> availableRooms = (List<Room>) request.getAttribute("availableRooms");

      if (availableRooms != null && !availableRooms.isEmpty()) {
        for (Room room : availableRooms) {
    %>
    <tr>
      <td><%= room.getName() %></td>
      <td><%= room.getCapacity() %></td>
      <td><%= room.getType() %></td>
      <td>
        <a href="<%= request.getContextPath() %>/client/makeReservation?roomId=<%= room.getId() %>">Reserve</a>
      </td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="4" style="text-align: center; color: #555;">No available rooms at the moment.</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <a href="<%= request.getContextPath() %>/clientdashboard" class="btn">Back to Dashboard</a>
</div>
</body>
</html>
