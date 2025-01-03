<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.usermanagement.dao.UserDAO, com.example.usermanagement.model.User" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit User</title>
</head>
<body>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  UserDAO userDAO = new UserDAO();
  User user = userDAO.getAllUsers().stream()
          .filter(u -> u.getId() == id)
          .findFirst()
          .orElse(null);
%>
<h1 style="text-align: center;">Edit User</h1>
<form action="editUser" method="post" style="width: 50%; margin: auto;">
  <input type="hidden" name="id" value="<%= user.getId() %>">
  <label>First Name:</label><br>
  <input type="text" name="firstName" value="<%= user.getFirstName() %>" required><br><br>
  <label>Last Name:</label><br>
  <input type="text" name="lastName" value="<%= user.getLastName() %>" required><br><br>
  <label>Email:</label><br>
  <input type="email" name="email" value="<%= user.getEmail() %>" required><br><br>
  <label>Phone:</label><br>
  <input type="text" name="phone" value="<%= user.getPhone() %>" required><br><br>
  <input type="submit" value="Update User">
</form>
<a href="listUsers" style="display: block; text-align: center; margin-top: 20px;">Back to User List</a>
</body>
</html>
