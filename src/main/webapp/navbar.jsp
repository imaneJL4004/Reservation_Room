<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.usermanagement.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Reservation System</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', Arial, sans-serif;
        }

        body {
            background-color: #f4f4f4;
            margin: 0;
        }

        nav.navbar {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }

        .navbar-links {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .welcome-text {
            font-size: 1rem;
            margin-right: 1rem;
            font-weight: 500;
        }

        .nav-button {
            padding: 0.8rem 1.2rem;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .login-btn {
            background-color: transparent;
            color: white;
            border: 2px solid white;
        }

        .login-btn:hover {
            background-color: white;
            color: #6a11cb;
            transform: scale(1.05);
        }

        .signup-btn {
            background-color: #3688f4;
            color: white;
        }

        .signup-btn:hover {
            background-color: #3688f4;
            transform: scale(1.05);
        }

        .logout-btn {
            background-color: #3688f4;
            color: white;
        }

        .logout-btn:hover {
            background-color: #4135e5;
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            nav.navbar {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
                padding: 1rem;
            }

            .navbar-links {
                flex-direction: column;
                align-items: flex-start;
                width: 100%;
            }

            .nav-button {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
<nav class="navbar">
    <a href="container.jsp" class="navbar-brand">Room Reservation System</a>
    <div class="navbar-links">
        <%
            User currentUser = (User) session.getAttribute("user");
            if (currentUser != null) {
        %>
        <span class="welcome-text">Welcome, <%= currentUser.getFirstName() %>!</span>
        <form action="logout" method="post" style="margin: 0;">
            <button type="submit" class="nav-button logout-btn">Logout</button>
        </form>
        <%
        } else {
        %>
        <a href="login.jsp" class="nav-button login-btn">Login</a>
        <a href="signup" class="nav-button signup-btn">Sign Up</a>
        <%
            }
        %>
    </div>
</nav>
</body>
</html>
