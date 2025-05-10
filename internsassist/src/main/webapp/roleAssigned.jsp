<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Role Change</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Coiny&display=swap');
        body {
            font-family: 'Coiny', cursive;
            background-color: rgb(31, 111, 45);
            color: #c3073f;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }
        h2 {
            color: #ffffff;
            margin-bottom: 20px;
        }
        p {
            color: #ffffff;
            margin-bottom: 20px;
        }
        a, button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            background-color: rgb(95, 216, 107);
            color: rgb(32, 30, 30);
            text-decoration: none;
            font-size: 14px;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }
        a:hover, button:hover {
            background-color: #cb404c;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Role Assigned</h2>
        <p>The role has been successfully assigned.</p>
        <a href="blank.jsp">Go to Home</a>
        <a href="AllInternsDetails.jsp">Assign Another Role</a>
    </div>
</body>
</html>
