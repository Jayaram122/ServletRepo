<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
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
            color: #333;
            margin-bottom: 20px;
        }
        h3 {
            font-size: 24px;
            color:  #4d944d;;
            margin-bottom: 20px;
        }
        select, input[type="date"], textarea, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            background-color: #444444; /* Darker input background */
            color: #fff; /* Light input text color */
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
            background-color: #4d944d; /* Darker green on hover */
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
        <h2>Leave Request Form</h2>
        <div class="instruction">
            <p><strong>Attendance and Protocol:</strong> In the event of inability to attend the daily scrum due to emergencies or technical issues, interns must inform/email at least 1 hour prior. The message should include status updates and reasons for absence. Failure to comply twice results in a half day leave in the records. Four instances of late arrivals or early departures will result in 1 day marked as leave in the intern's record. If you reach the office after 10:50 AM or leave office prior to 03:20 PM, it is considered a half day leave. Please ensure that the allotted break times are used. If you have to step out of the office during office hours, you are supposed to seek permission from the person in charge.</p>
            <p><strong>Break Timings:</strong></p>
            <ul>
                <li>Morning: 10:50 am to 11:00 am</li>
                <li>Lunch: 12:50 pm to 1:30 pm</li>
                <li>Evening: 3:20 pm to 3:30 pm</li>
                <li>Friday lunch: 12:45 pm to 2:00 pm</li>
            </ul>
            <p>Leave requests are permissible only for emergencies and medical issues, requiring prior informing, approval, and submission of medical certificates for medical cases. Noncompliance with leave policies or unclear requests may impact performance evaluations and internship progression. Similar requests are to be made for late arrival, early departure, and half-day leave.</p>
            <p><strong>Late Arrival Policy:</strong> Any team member arriving after 9 am without prior approval will be deemed to have taken an unauthorized leave for the day. Consequently, they are not required to report to the office.</p>
            <p><strong>Leave/Holiday Notification:</strong> It is imperative that all leave or holiday requests are communicated in advance. Failure to do so will result in suspension from office for an extended period. This suspension will impact your overall evaluation at the conclusion of your internship.</p>
            <p>Interns are expected to promptly communicate any difficulties encountered in updating their daily work status to the group. While individual responsibility for updating work remains paramount, critical issues should be promptly communicated to the team. Additionally, please restrict phone calls related to your absence, late arrival, and other reporting activities to the hours between 7:30 am to 7:30 pm. Outside of this timeframe, kindly utilize text messages or email to notify the respective person in charge.</p>
        </div>
        <form action="leave" method="post"  onsubmit="showAlert('Leave Request Uploded Successfully.')">
            <h3> Team:</h3>
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
                    } 
                %>
            </select>

            <h3>Leave Type:</h3>
            <select id="leaveType" name="leaveType">
                <% 
                    try {
                        String sql = "SELECT leave_Type FROM team";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();
                        while (rs.next()) {
                            String leave = rs.getString("leave_Type");
                %>
                            <option value="<%= leave %>"><%= leave %></option>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>

             <h3>Leave Start Date:</h3>
            <input type="date" id="leaveStart" name="leaveStart" required>

            <h3>Leave End Date:</h3>
            <input type="date" id="leaveEnd" name="leaveEnd" required>

            <h3>Reason:</h3>
            <textarea id="reason" name="reason" rows="4" required></textarea>

            <button type="submit">Submit Leave Request</button>
        </form>
    </div>
</body>
</html>
