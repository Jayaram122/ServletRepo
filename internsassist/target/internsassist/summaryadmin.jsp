<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lxisoft.internsassist.Scrum" %>
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
    max-width: 1200px; /* Adjust this value as needed */
    width: 120%; /* Adjust this value as needed for responsiveness */
    margin: auto;
    padding: 40px;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

    </style>
</head>
<body>

<header>
    <h1>Scrum Details</h1>
</header>

<div class="container">
    <h1>Scrum Records</h1>
    <% List<Scrum> scrumList = (List<Scrum>) request.getAttribute("scrumList"); %>
    <table>
        <thead>
            <tr>
                <th>Sl. No</th>
                <th>Name *</th>
                <th>Date * Time</th>
                <th>Team *</th>
                <th>Present for Daily Scrum? *</th>
                <th>Scrum In-charge *</th>
                <th>Yesterday's Tasks *</th>
                <th>Yesterday's Tasks Status *</th>
                <th>Today's Project Name *</th>
                <th>Today's Task 1 *</th>
                <th>Today's Task 2 *</th>
                <th>Today's Task 3 *</th>
                <th>Any other additional Tasks</th>
                <th>If you are stuck/require assistance, explain in brief. </th>
            </tr>
        </thead>
        <tbody>
        <% 
            if (scrumList != null && !scrumList.isEmpty()) {
                for (Scrum leave : scrumList) {
        %>
            <tr>
                <td><%= leave.getSlNo() %></td>
                <td><%= leave.getUserName() %></td>
                <td><%= leave.getDateTime() %></td>
                <td><%= leave.getTeam() %></td>
                <td><%= leave.getAttendace() %></td>
                <td><%= leave.getScrumInCharge() %></td>
                <td><%= leave.getYesterdayTask() %></td>
                <td><%= leave.getTask_status() %></td>
                <td><%= leave.getProjectName() %></td>
                <td><%= leave.getTask1() %></td>
                <td><%= leave.getTask2() %></td>
                <td><%= leave.getTask3() %></td>
                <td><%= leave.getAdditional() %></td>
                <td><%= leave.getStuck() %></td>
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
