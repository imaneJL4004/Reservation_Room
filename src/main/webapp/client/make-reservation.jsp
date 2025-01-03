<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Make Reservation</title>
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
      max-width: 600px;
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
      font-size: 1.8rem;
    }

    form {
      margin-top: 1.5rem;
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: #3688f4;
      font-weight: 500;
    }

    input[type="datetime-local"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 1rem;
    }

    input[type="submit"], .btn {
      display: inline-block;
      padding: 10px 20px;
      background-color: #1e88e5;
      color: white;
      text-decoration: none;
      border: none;
      border-radius: 5px;
      font-weight: 500;
      cursor: pointer;
      text-align: center;
    }

    input[type="submit"]:hover, .btn:hover {
      background-color: #1565c0;
    }

    .btn {
      margin-top: 1rem;
      text-decoration: none;
    }

    .btn.back {
      background-color: #354bdc;
    }

    .btn.back:hover {
      background-color: #354bdc;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .container {
        padding: 1.5rem;
      }

      h1 {
        font-size: 1.6rem;
      }

      input[type="datetime-local"] {
        font-size: 0.9rem;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Make Reservation for ${room.name}</h1>
  <form action="${pageContext.request.contextPath}/client/makeReservation" method="post">
    <input type="hidden" name="roomId" value="${room.id}">
    <label for="startTime">Start Time:</label>
    <input type="datetime-local" id="startTime" name="startTime" required>
    <label for="endTime">End Time:</label>
    <input type="datetime-local" id="endTime" name="endTime" required>
    <input type="submit" value="Make Reservation" class="btn">
  </form>
  <a href="${pageContext.request.contextPath}/client/availableRooms" class="btn back">Back to Available Rooms</a>
</div>
</body>
</html>
