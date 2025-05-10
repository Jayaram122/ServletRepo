<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Interns Assist</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #333333; /* Dark grey background */
            color: #f5f5f5; /* Light grey text color */
            overflow: hidden; /* Prevent scroll */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            text-align: center;
            max-width: 800px;
            padding: 20px;
            background-color: #333333; /* Dark grey background */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Grey shadow */
        }
        h1 {
            color: #6abf69; /* Light green heading color */
        }
        p {
            margin-bottom: 20px;
            color: #6abf69; /* Light green text color */
        }
        /* Dropdown styles */
        .dropdown {
            position: fixed;
            top: 50%;
            right: 20px;
            transform: translateY(-50%);
            display: inline-block;
            z-index: 102; /* Higher than profile content */
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 100px; /* Adjusted width */
            box-shadow: 0px 8px 16px 0px #f1f1f1;
            z-index: 101; /* Higher than profile image */
        }
        .dropdown:hover .dropdown-content {
            display: block; /* Show dropdown on hover */
        }
        .dropdown-content a {
            color: rgb(5, 0, 0);
            padding: 5px 09px; /* Reduced padding */
            text-decoration: none;
            display: block;
            font-size: 8px; /* Reduced font size */
        }
        .profile-img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 2px solid #6abf69;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <c:choose>
            <c:when test="${empty language}">
                <h1>Welcome to Interns Assist</h1>
                <p>We are here to help you track and develop your internship journey. With Interns Assist, you can manage tasks, track progress, and access resources to enhance your skills and knowledge.</p>
                <p>Start your journey with us!</p>
            </c:when>
            <c:otherwise>
                <h1><c:out value="${language['welcome.heading']}"/></h1>
                <p><c:out value="${language['welcome.message1']}"/></p>
                <p><c:out value="${language['welcome.message2']}"/></p>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Profile Dropdown -->
    <div class="dropdown">
        <a href="profile" style="text-decoration: none;">
            <img src="OIP.jpg" alt="Profile Image" class="profile-img">
            <i class="fa fa-user" style="color: #333; font-size: 18px;"></i>
        </a>
        <div class="dropdown-content">
            <a href="profile" target="f2" class="blank">Profile</a>
            <a href="settings.jsp" target="f2" class="blank">Settings</a>
            <a href="logout">Logout</a>
        </div>
    </div>
</body>
</html>
