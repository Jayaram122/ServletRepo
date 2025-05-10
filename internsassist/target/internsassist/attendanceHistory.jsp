<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="com.lxisoft.internsassist.Internsassist" %>



<!DOCTYPE html>
<html>
<head>
    <title>Attendance History</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color:#4d944d;
        }
    </style>
</head>
<body>
    <h1>Attendance History</h1>
    <table>
        <tr>
            <th>Date & Time</th>
            <th>Status</th>
        </tr>
        <%
            List<Internsassist> records = (List<Internsassist>) request.getAttribute("records");
            if (records != null) {
                for (Internsassist record : records) {
        %>
        <tr>
            <td><%= record.getDatetime() %></td>
            <td><%= record.getStatus() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">No records found.</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
