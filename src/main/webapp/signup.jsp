<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
  <style>
    /* General Reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Roboto', Arial, sans-serif;
    }

    body {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      color: #fff;
    }

    .container {
      background: #fff;
      color: #333;
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
      max-width: 450px;
      width: 100%;
      animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    h2 {
      text-align: center;
      margin-bottom: 1.5rem;
      font-size: 1.8rem;
      font-weight: 600;
      color: #333;
    }

    .error {
      background-color: #f8d7da;
      color: #721c24;
      padding: 1rem;
      border: 1px solid #f5c6cb;
      border-radius: 8px;
      margin-bottom: 1rem;
      text-align: center;
      font-size: 0.95rem;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      font-size: 0.95rem;
      font-weight: 500;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 0.9rem;
      margin-bottom: 1rem;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 1rem;
      transition: border 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus {
      border: 1px solid #007bff;
      outline: none;
      box-shadow: 0 0 6px rgba(0, 123, 255, 0.2);
    }

    input[type="submit"] {
      width: 100%;
      padding: 0.9rem;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      color: #fff;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: background 0.3s ease, transform 0.2s ease;
    }

    input[type="submit"]:hover {
      background: linear-gradient(135deg, #2575fc, #6a11cb);
      transform: translateY(-2px);
    }

    input[type="submit"]:active {
      transform: translateY(0);
    }

    .text-center {
      text-align: center;
    }

    .mt-4 {
      margin-top: 1rem;
    }

    a {
      color: #2575fc;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s ease;
    }

    a:hover {
      color: #6a11cb;
      text-decoration: underline;
    }

    .footer-note {
      font-size: 0.9rem;
      margin-top: 1rem;
      text-align: center;
      color: #666;
    }

    /* Mobile Responsive Design */
    @media (max-width: 480px) {
      .container {
        padding: 1.5rem;
      }

      h2 {
        font-size: 1.5rem;
      }

      input[type="text"],
      input[type="email"],
      input[type="password"] {
        padding: 0.7rem;
      }

      input[type="submit"] {
        padding: 0.7rem;
        font-size: 0.9rem;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Sign Up</h2>
  <% if(request.getAttribute("error") != null) { %>
  <p class="error"><%= request.getAttribute("error") %></p>
  <% } %>
  <form action="signup" method="post">
    <label for="firstName">First Name</label>
    <input type="text" id="firstName" name="firstName" placeholder="Enter your first name" required>

    <label for="lastName">Last Name</label>
    <input type="text" id="lastName" name="lastName" placeholder="Enter your last name" required>

    <label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="Enter your email" required>

    <label for="phone">Phone</label>
    <input type="text" id="phone" name="phone" placeholder="Enter your phone number" required>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" placeholder="Create a password" required>

    <input type="submit" value="Sign Up">
  </form>
  <p class="text-center mt-4">Already have an account? <a href="login">Login here</a></p>
  <p class="footer-note">By signing up, you agree to our <a href="#">Terms & Conditions</a> and <a href="#">Privacy Policy</a>.</p>
</div>
</body>
</html>
