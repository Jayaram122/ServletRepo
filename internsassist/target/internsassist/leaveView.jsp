<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lxisoft.internsassist.Leave" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leave Records</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            margin: 20px;
            background-color: #333333;
        }
        header, footer {
            text-align: center;
            padding: 10px 0;
            background-color: #6abf69;
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        table, th, td {
            border: 1px solid #dddddd;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background-color:#6abf69;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        h1 {
            text-align: center;
            color: #333333;
        }
        .container {
            width: 80%;
            margin: auto;
        }
    </style>
</head>
<body>

<header>
    <h1>Company Name</h1>
</header>

<div class="container">
    <h1>Leave Records</h1>
    <% List<Leave> leavesList = (List<Leave>) request.getAttribute("leavesList"); %>
    <table>
        <thead>
            <tr>
                <th>Sl. No</th>
                <th>User Name</th>
                <th>Date Time</th>
                <th>Team</th>
                <th>Leave Type</th>
                <th>Leave Start Date</th>
                <th>Leave End Date</th>
                <th>Reason</th>
            </tr>
        </thead>
        <tbody>
        <% 
            if (leavesList != null && !leavesList.isEmpty()) {
                for (Leave leave : leavesList) {
        %>
            <tr>
                <td><%= leave.getSlNo() %></td>
                <td><%= leave.getUserName() %></td>
                <td><%= leave.getDateTime() %></td>
                <td><%= leave.getTeam() %></td>
                <td><%= leave.getLeaveType() %></td>
                <td><%= leave.getLeaveStartDate() %></td>
                <td><%= leave.getLeaveEndDate() %></td>
                <td><%= leave.getReason() %></td>
            </tr>
        <% 
                }
            } else {
        %>
            <tr>
                <td colspan="8" style="text-align:center;">No leave records found.</td>
            </tr>
        <% 
            }
        %>
        </tbody>
    </table>
</div>

<footer>
    <p>&copy; 2024 Company Name. All rights reserved.</p>
</footer>

</body>
</html>
