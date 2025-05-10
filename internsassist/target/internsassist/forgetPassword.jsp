<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #333333; /* Dark grey background */
        color: #f2f2f2; /* Light grey text */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    h2 {
        font-size: 2em;
        margin-bottom: 20px;
        text-align: center;
    }

    form {
        background-color: #6abf69; /* Light green form background */
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
        width: 400px; /* Adjust the width as needed */
    }

    input[type="email"],
    input[type="text"],
    input[type="password"] {
        padding: 15px;
        margin-bottom: 20px;
        border: none;
        border-radius: 8px;
        background-color: #4d4d4d; /* Dark grey input background */
        color: #ffffff; /* White text */
        width: 100%;
        box-sizing: border-box;
        padding-left: 30px; /* Add padding for the icon */
    }

    input[type="submit"] {
        padding: 15px;
        border: none;
        border-radius: 8px;
        background-color: #4d4d4d; /* Dark grey button */
        color: #ffffff; /* White text */
        width: 100%;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #333333; /* Darker grey on hover */
    }

    .login-link {
        text-align: center;
        margin-top: 20px;
    }

    .login-link a {
        color: #ffffff; /* White text */
        text-decoration: none;
    }

    .login-link a:hover {
        text-decoration: underline;
    }

    .input-with-icon {
        position: relative;
    }

    .input-with-icon i {
        position: absolute;
        left: 10px;
        top: 35%;
        transform: translateY(-50%);
        color: #ffffff; /* Icon color */
        
    }
</style>
</head>
<body>

<div class="container">
    <h2>Forgot Password</h2>
    <form action="ForgotPasswordServlet" method="post">
        <div class="input-with-icon">
            <i class="fas fa-user"></i>
            <input type="text" id="userName" name="name" required placeholder="Enter your User_Name">
        </div><br>

        <div class="input-with-icon">
            <i class="fas fa-lock"></i>
            <input type="password" id="newPassword" name="newPassword" required placeholder="Enter your new password">
        </div><br>

        <div class="input-with-icon">
            <i class="fas fa-lock"></i>
            <input type="password" id="ReEnterPassword" name="ReEnterPassword" required placeholder="Re-enter your new password">
        </div><br>

        <input type="submit" value="Submit">
    </form>
    <div class="login-link">
        <a href="#">Back to Login</a>
    </div>
</div>

</body>
</html>
