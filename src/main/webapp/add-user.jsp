<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add User</title>
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
      max-width: 500px;
      width: 100%;
      text-align: center;
    }

    h1 {
      font-size: 2rem;
      color: #333;
      margin-bottom: 20px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    label {
      font-size: 1.1rem;
      color: #333;
      text-align: left;
    }

    input[type="text"], input[type="email"] {
      padding: 10px;
      font-size: 1rem;
      border: 1px solid #ddd;
      border-radius: 5px;
      width: 100%;
    }

    input[type="submit"] {
      padding: 10px;
      background-color: #3498db;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 1.1rem;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
      background-color: #2980b9;
    }

    a {
      display: inline-block;
      margin-top: 20px;
      color: #3498db;
      text-decoration: none;
      font-size: 1rem;
    }

    a:hover {
      color: #2980b9;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Add New User</h1>
  <form action="addUser" method="post">
    <label for="firstName">First Name:</label>
    <input type="text" name="firstName" id="firstName" required><br><br>

    <label for="lastName">Last Name:</label>
    <input type="text" name="lastName" id="lastName" required><br><br>

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required><br><br>

    <label for="phone">Phone:</label>
    <input type="text" name="phone" id="phone" required><br><br>

    <input type="submit" value="Add User">
  </form>
  <a href="listUsers">Back to User List</a>
</div>

</body>
</html>
