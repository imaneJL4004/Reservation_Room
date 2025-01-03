<%@ page import="com.example.usermanagement.model.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
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
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            max-width: 1200px;
            width: 90%;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            font-size: 2.5rem;
            color: #1e88e5;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            background-color: #1e88e5;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            font-size: 1rem;
            margin-bottom: 20px;
        }

        .btn:hover {
            background-color: #1976d2;
        }

        /* Table Styling */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            text-align: center;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            font-size: 1rem;
        }

        th {
            background-color: #1e88e5;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }

        tr:nth-child(even) td {
            background-color: #f1f1f1;
        }

        .actions a {
            color: #1e88e5;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 3px;
            font-size: 0.9rem;
        }

        .actions a:hover {
            background-color: #f1f1f1;
        }

        .actions a.delete {
            color: #e74c3c;
        }

        .actions a.delete:hover {
            background-color: #fbe4e4;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                font-size: 0.9rem;
            }

            .container {
                padding: 20px;
            }

            .btn {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>User List</h1>
    <a href="add-user.jsp" class="btn">Add New User</a>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<com.example.usermanagement.model.User> userList =
                    (List<User>) request.getAttribute("userList");
            if (userList != null) {
                for (com.example.usermanagement.model.User user : userList) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getFirstName() %></td>
            <td><%= user.getLastName() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getPhone() %></td>
            <td class="actions">
                <a href="edit-user.jsp?id=<%= user.getId() %>">Edit</a> |
                <a href="deleteUser?id=<%= user.getId() %>" class="delete">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No users found!</td>
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
