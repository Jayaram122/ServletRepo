<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Meeting Links</title>
    <style>
  
   .content-area {
   float: right;
   width: 20px;  /* Adjust width as needed */
   }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            background-color: #fff;
            padding: 18px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 600px; /* Adjust width as needed */
            height: 400px; /* Adjust height as needed */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        h2 {
            font-size: 40px; /* Increase font size for h2 */
            margin-bottom: 20px;
        }
        .meeting-link {
            margin: 10px 0;
            text-align: center;
        }
        .meeting-link a {
            text-decoration: none;
            color: #6abf69;
            font-size: 24px;
        }
        .meeting-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body style="background-color: #333333; color: #333333">
    <div class="container">
        <h2>Scrum Summary</h2>
        <div class="meeting-link">
            <a href="morningScrumSummary.jsp" target="f2">Scrum Summary (morning)</a>
        </div>
        <div class="meeting-link">
            <a href="scrumupdate.jsp" target="f2">Scrum Update (evening)</a>
        </div>
</body>
</html>
