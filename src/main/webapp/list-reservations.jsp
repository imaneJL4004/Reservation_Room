<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.usermanagement.model.Reservation, java.util.List, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reservation List</title>
  <style>
    body {
      background-color: #f4f4f4;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      padding: 20px;
      font-family: Arial, sans-serif;
    }

    h1 {
      font-size: 2rem;
      color: #1e88e5;
      margin-bottom: 20px;
      text-align: center;
    }

    .container {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      width: 90%;
      max-width: 1000px;
      padding: 30px;
      margin-top: 20px;
      text-align: center;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      background-color: #fff;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 12px;
      text-align: center;
    }

    th {
      background-color: #e3f2fd;
    }

    tr:hover {
      background-color: #f5f5f5;
    }

    .action-links a {
      margin-right: 10px;
      color: #1e88e5;
      text-decoration: none;
    }

    .action-links a:hover {
      text-decoration: underline;
    }

    .add-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      background-color: #1e88e5;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 4px;
    }

    .add-link:hover {
      background-color: #1976d2;
    }

    .back-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      color: #1e88e5;
      text-decoration: none;
    }

    .back-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Reservation List</h1>
  <a href="add-reservation.jsp" class="add-link">Add New Reservation</a>

  <table>
    <thead>
    <tr>
      <th>ID</th>
      <th>User</th>
      <th>Room</th>
      <th>Start Time</th>
      <th>End Time</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Reservation> reservationList = (List<Reservation>) request.getAttribute("listReservations");
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
      if (reservationList != null && !reservationList.isEmpty()) {
        for (Reservation reservation : reservationList) {
    %>
    <tr>
      <td><%= reservation.getId() %></td>
      <td><%= reservation.getUser().getFirstName() + " " + reservation.getUser().getLastName() %></td>
      <td><%= reservation.getRoom().getName() %></td>
      <td><%= dateFormat.format(reservation.getStartTime()) %></td>
      <td><%= dateFormat.format(reservation.getEndTime()) %></td>
      <td class="action-links">
        <a href="editReservation?id=<%= reservation.getId() %>">Edit</a>
        |
        <a href="deleteReservation?id=<%= reservation.getId() %>" onclick="return confirm('Are you sure you want to delete this reservation?');">Delete</a>
      </td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="6">No reservations found!</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>

  <a href="index.jsp" class="back-link">Back to Home</a>
</div>

</body>
</html>
