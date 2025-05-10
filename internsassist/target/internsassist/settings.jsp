<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings</title>
    <style>
        /* Global styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #333333;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            background-color: #007bff;
            color: #ffffff;
            padding: 20px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        h2 {
            margin: 0;
            font-size: 24px;
        }

        .content {
            padding: 20px;
        }

        .btn-logout {
            background-color: #dc3545;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Settings</h2>
        </div>
        <div class="content">
            <!-- Your settings content here -->
            <p>Do you want to log out of your account?</p>
            <form action="logout" method="get">
                <input type="submit" value="Logout" class="btn-logout">
            </form>
        </div>
    </div>
</body>
</html>
