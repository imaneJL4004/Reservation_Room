<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.usermanagement.model.Reservation" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Reservation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #3688f4;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="datetime-local"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }
        .btn {
            display: inline-block;
            padding: 10px 15px;
            background-color: #3688f4;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .btn-cancel {
            background-color: #354bdc;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <%
        Reservation reservation = (Reservation) request.getAttribute("reservation");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    %>
    <h1>Edit Reservation</h1>
    <form action="<%= request.getContextPath() %>/client/editReservation" method="post">
        <input type="hidden" name="reservationId" value="<%= reservation.getId() %>">

        <div class="form-group">
            <label>Room: <%= reservation.getRoom().getName() %></label>
        </div>

        <div class="form-group">
            <label for="startTime">Start Time:</label>
            <input type="datetime-local" id="startTime" name="startTime"
                   value="<%= sdf.format(reservation.getStartTime()) %>" required>
        </div>

        <div class="form-group">
            <label for="endTime">End Time:</label>
            <input type="datetime-local" id="endTime" name="endTime"
                   value="<%= sdf.format(reservation.getEndTime()) %>" required>
        </div>

        <button type="submit" class="btn">Update Reservation</button>
        <a href="<%= request.getContextPath() %>/clientdashboard" class="btn btn-cancel">Cancel</a>
    </form>
</div>
</body>
</html>

