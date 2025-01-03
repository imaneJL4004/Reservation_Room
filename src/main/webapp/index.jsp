<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management System</title>
    <style>
        /* Reset and Base Styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', Arial, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #eef2f3, #ffffff);
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            height: 100%;
        }

        h1 {
            font-size: 2rem;
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: 700;
        }

        .menu {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 30px;
        }

        .menu a {
            display: inline-block;
            padding: 12px 25px;
            background: #3498db;
            color: #fff;
            text-decoration: none;
            font-size: 1rem;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .menu a:hover {
            background: #1d78c1;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        @media (max-width: 768px) {
            .menu {
                flex-direction: column;
                gap: 10px;
            }

            .menu a {
                width: 100%;
                text-align: center;
            }
        }

        footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9rem;
            color: #2c3e50;
        }

        footer a {
            color: #3498db;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container">
    <h1>Welcome to User Management System</h1>
    <p>Manage users, rooms, and reservations all in one place.</p>
    <div class="menu">
        <a href="dashboard">Dashboard</a>
        <a href="listUsers">View Users</a>
        <a href="listRooms">View Rooms</a>
        <a href="listReservations">View Reservations</a>
    </div>
</div>


</body>
</html>
