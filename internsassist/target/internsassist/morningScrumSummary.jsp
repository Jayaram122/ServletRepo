<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.security.Principal"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leave Request Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            background-color: #333;
        }
        .container {
            background-color: #666666;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
            margin: auto;
            overflow: auto;
        }
        h2 {
            font-size: 24px;
            color: #fff;
            margin-bottom: 20px;
        }
        h3 {
            font-size: 24px;
            color: #4d944d;
            margin-bottom: 20px;
        }
        select, input[type="text"], button {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            background-color: #444444;
            color: #fff;
        }
        button {
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 18px;
        }
        button:hover {
            background-color: #218838;
        }
        .instruction {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            line-height: 1.6;
            color: #333;
        }
        input[type="submit"]:hover {
            background-color: #4d944d;
        }
    </style>
    <script>
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Daily Scrum Summary</h2>
        <div class="instruction">
            <p><strong>Attendance at daily scrum meetings is mandatory for all interns:</strong> Each participant must promptly update the scrum summary following each meeting.</p>
            <ul>
                <li>Daily Scrum Timing: 9:00 AM to 9:15 AM</li>
            </ul>
        </div>
        <form action="morning" method="post" onsubmit="showAlert('Leave Request Uploaded Successfully.')">
            <h3>Team *:</h3>

<%Principal pri = request.getUserPrincipal();
String name = pri.getName();%>
<input type="text" name="name" id="name" value="<%= name %>" readonly>

            <select id="team" name="team">
                <% 
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    String jdbcURL = "jdbc:mysql://localhost:3306/internsassist";
                    String dbUser = "root";
                    String dbPassword = "Jayaram";
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                        String sql = "SELECT team FROM team";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();
                        while (rs.next()) {
                            String team = rs.getString("team");
                %>
                            <option value="<%= team %>"><%= team %></option>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </select>

            <h3>Present for Daily Scrum? *</h3>
            <input type="radio" id="present" name="attendance" value="yes" required>
            <label for="present">yes</label>
            <input type="radio" id="absent" name="attendance" value="no" required>
            <label for="absent">no</label>

            <h3>Scrum In-charge *:</h3>
            <select id="charge" name="charge">
                <% 
                    try {
                        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                        String sql = "SELECT scrumInCharge FROM team";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();
                        while (rs.next()) {
                            String charge = rs.getString("scrumInCharge");
                %>
                            <option value="<%= charge %>"><%= charge %></option>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </select>

            <h3>Yesterday's Tasks *:</h3>
            <h4>Mention Project Name and Number Of Tasks</h4>
            <input type="text" id="yproject" name="yproject" required>

            <h3>Yesterday's Tasks Status *:</h3>
            <input type="radio" id="completed" name="status" value="Completed" required>
            <label for="completed">completed</label>
            <input type="radio" id="notcompleted" name="status" value="NotCompleted" required>
            <label for="notcompleted">not completed</label>

            <h3>Today's Project Name *:</h3>
            <input type="text" id="tproject" name="tproject" required>

            <h3>Today's Task 1 *:</h3>
            <input type="text" id="t1project" name="t1project" required>

            <h3>Today's Task 2 *:</h3>
            <input type="text" id="t2project" name="t2project" required>

            <h3>Today's Task 3 *:</h3>
            <input type="text" id="t3project" name="t3project" required>

            <h3>Any other additional Tasks:</h3>
            <input type="text" id="aproject" name="aproject">

            <h3>If you are stuck/require assistance, explain in brief:</h3>
            <input type="text" id="stuck" name="stuck">

            <button type="submit">Submit Leave Request</button>
        </form>
    </div>
</body>
</html>
