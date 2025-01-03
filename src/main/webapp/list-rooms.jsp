<%@ page import="com.example.usermanagement.model.Room" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room List</title>
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
            height: 100vh;
            padding: 20px;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 1000px;
            width: 90%;
            text-align: center;
        }

        h1 {
            font-size: 2.5rem;
            color: #1e88e5;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #e3f2fd;
            font-weight: bold;
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

        .add-room-link a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #1e88e5;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        .add-room-link a:hover {
            background-color: #1976d2;
        }

        .back-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #1e88e5;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 20px;
        }

        .back-link:hover {
            background-color: #1976d2;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Room List</h1>

    <div class="add-room-link">
        <a href="add-room.jsp">Add New Room</a>
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Capacity</th>
            <th>Type</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Room> roomList = (List<Room>) request.getAttribute("roomList");
            if (roomList != null) {
                for (Room room : roomList) {
        %>
        <tr>
            <td><%= room.getId() %></td>
            <td><%= room.getName() %></td>
            <td><%= room.getCapacity() %></td>
            <td><%= room.getType() %></td>
            <td class="action-links">
                <a href="edit-room.jsp?id=<%= room.getId() %>">Edit</a> |
                <a href="deleteRoom?id=<%= room.getId() %>">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5">No rooms found!</td>
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
