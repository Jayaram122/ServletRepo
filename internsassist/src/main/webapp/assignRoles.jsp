<%@ page session = "true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Roles</title>
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
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #ffffff;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #fff;
        }
        select, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solidrgb(95, 216, 107);
            font-size: 14px;
            background-color: #f0eced;
            color: #151414;
        }
        button {
            background-color: rgb(95, 216, 107);
            color: rgb(32, 30, 30);
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #cb404c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Assign Roles</h2>
        <%
            String action = request.getParameter("action");
            String name = request.getParameter("name");
        %>
        <form action="roles" method="post">
            <label for="person">Person:</label>
            <select id="person" name="personName">
                <option><%= name %></option>
            </select>

            <label for="roles">Roles:</label>
            <select id="roles" name="role">
                <option value="admin">Admin</option>
                <option value="intern">Intern</option>
                <option value="gc">GC</option>
            </select>

            <button type="submit" name="action" value="<%= (action != null && action.equals("assign")) ? "assign" : "change" %>">Submit</button>
        </form>
    </div>
</body>
</html>
