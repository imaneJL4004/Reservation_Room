<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Room</title>
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
            width: 100%;
            max-width: 600px;
        }

        h1 {
            font-size: 2rem;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-size: 1.1rem;
            color: #333;
        }

        input[type="text"], input[type="number"] {
            padding: 8px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            font-size: 1rem;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Add New Room</h1>
    <form action="addRoom" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="capacity">Capacity:</label>
        <input type="number" id="capacity" name="capacity" required><br>

        <label for="type">Type:</label>
        <input type="text" id="type" name="type" required><br>

        <input type="submit" value="Add Room">
    </form>

    <a href="listRooms">Back to Room List</a>
</div>

</body>
</html>
