<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Room Reservation System</title>
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
            flex-direction: column;

            min-height: 100vh;
            padding: 20px;
        }

        /* Navbar Styles */
        nav {
            width: 100%;
            background-color: #1e88e5;
            padding: 1rem 2rem;
            color: white;
            text-align: center;
            font-size: 1.2rem;
            font-weight: bold;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
        }

        /* Container Styles */
        .container {
            max-width: 1200px;
            width: 100%;
            padding: 2rem;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-top: 80px; /* To push content below the navbar */
            text-align: center;
        }

        h1 {
            font-size: 2.5rem;
            color: #1e88e5;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 30px;
        }

        .button-group {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .action-button {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-weight: 500;
            background-color: #1e88e5;
            color: white;
            transition: background-color 0.3s ease;
            font-size: 1rem;
        }

        .action-button:hover {
            background-color: #1976d2;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 1.5rem;
            }

            h1 {
                font-size: 2rem;
            }

            .action-button {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />

<div class="container">
    <div class="content">
        <h1>Welcome to Room Reservation System</h1>
        <p>Manage your room reservations efficiently and easily.</p>

        <div class="button-group">
            <%
                if (session.getAttribute("user") != null) {
            %>
            <a href="index.jsp" class="action-button">Go to Dashboard</a>
            <%
            } else {
            %>
            <a href="login.jsp" class="action-button">Get Started</a>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
