<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.usermanagement.model.Reservation" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Client Dashboard</title>
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

        h1, h2 {
            color: #1e88e5;
            margin-bottom: 20px;
            text-align: center;
        }

        h1 {
            font-size: 2rem;
        }

        h2 {
            font-size: 1.5rem;
            margin-top: 2rem;
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            background-color: #1e88e5;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 1.5rem;
            text-align: center;
            font-weight: 500;
        }

        .btn:hover {
            background-color: #1565c0;
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
            font-weight: 600;
            text-transform: uppercase;
        }

        td {
            background-color: #fafafa;
        }

        td a {
            color: #1e88e5;
            text-decoration: none;
            font-weight: 500;
        }

        td a:hover {
            text-decoration: underline;
        }

        tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        tr:hover td {
            background-color: #f1f1f1;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 1.5rem;
            }

            h1 {
                font-size: 1.8rem;
            }

            h2 {
                font-size: 1.3rem;
            }

            table, th, td {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container">
    <%
        // Access user and reservation list from request scope
        String firstName = (String) session.getAttribute("userFirstName");
        List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    %>
    <h1>Welcome, <%= firstName %>!</h1>
    <a href="<%= request.getContextPath() %>/client/availableRooms" class="btn">View Available Rooms</a>
    <h2>Your Reservations</h2>
    <table>
        <thead>
        <tr>
            <th>Room</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (reservations != null && !reservations.isEmpty()) {
                for (Reservation reservation : reservations) {
        %>
        <tr>
            <td><%= reservation.getRoom().getName() %></td>
            <td><%= sdf.format(reservation.getStartTime()) %></td>
            <td><%= sdf.format(reservation.getEndTime()) %></td>
            <td>
                <a href="<%= request.getContextPath() %>/client/editReservation?id=<%= reservation.getId() %>">Edit</a> |
                <a href="<%= request.getContextPath() %>/client/cancelReservation?id=<%= reservation.getId() %>"
                   onclick="return confirm('Are you sure you want to cancel this reservation?')">Cancel</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="4" style="text-align: center; color: #555;">No reservations found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
