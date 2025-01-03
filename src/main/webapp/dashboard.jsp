<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard - User Management System</title>
  <style>
    /* Global Styles */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Roboto', Arial, sans-serif;
    }

    body {
      background-color: #f8f8f8;
      color: #333;
      padding: 20px;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 40px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }

    h1 {
      font-size: 2.2rem;
      color: #2c3e50;
      margin-bottom: 30px;
      font-weight: bold;
      text-align: center;
    }

    /* Stats Grid Layout */
    .stats-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 20px;
      justify-items: center;
      margin-top: 30px;
    }

    /* Stat Card Styling */
    .stat-card {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      padding: 30px;
      text-align: center;
      width: 100%;
      transition: transform 0.3s ease;
    }

    .stat-card:hover {
      transform: translateY(-5px);
    }

    .stat-card h2 {
      font-size: 2.5rem;
      margin: 0;
      color: #3498db;
    }

    .stat-card p {
      margin: 10px 0 0;
      color: #7f8c8d;
      font-size: 1.2rem;
    }

    /* Back to Home Link */
    .back-link {
      display: inline-block;
      margin-top: 30px;
      padding: 12px 30px;
      background-color: #3498db;
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
      text-align: center;
      font-size: 1.1rem;
      transition: background-color 0.3s ease;
    }

    .back-link:hover {
      background-color: #2980b9;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .container {
        padding: 20px;
      }

      h1 {
        font-size: 1.8rem;
      }

      .stats-grid {
        grid-template-columns: 1fr 1fr;
      }

      .back-link {
        padding: 10px 20px;
        font-size: 1rem;
      }
    }
  </style>
</head>
<body>
<jsp:include page="navbar.jsp" />

<div class="container">
  <h1>Dashboard</h1>

  <div class="stats-grid">
    <%
      Map<String, Integer> stats = (Map<String, Integer>) request.getAttribute("stats");
    %>
    <div class="stat-card">
      <h2><%= stats.get("totalUsers") %></h2>
      <p>Total Users</p>
    </div>
    <div class="stat-card">
      <h2><%= stats.get("totalRooms") %></h2>
      <p>Total Rooms</p>
    </div>
    <div class="stat-card">
      <h2><%= stats.get("totalReservations") %></h2>
      <p>Total Reservations</p>
    </div>
    <div class="stat-card">
      <h2><%= stats.get("availableRooms") %></h2>
      <p>Available Rooms</p>
    </div>
  </div>

  <a href="index.jsp" class="back-link">Back to Home</a>
</div>
</body>
</html>
