<%@ page session = "true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Assign Projects</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap');

        body {
            background-color: #1e1e1e;
            color: #0ff122;
            font-family: 'Press Start 2P', cursive;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h2 {
            margin-bottom: 20px;
            text-shadow: 2px 2px #000;
        }

        .container {
            width: 80%;
            max-width: 800px;
            background-color: #333;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }

        label, select, button {
            margin: 10px 0;
            width: 100%;
            max-width: 300px;
        }

        select, button {
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-family: 'Press Start 2P', cursive;
            transition: background-color 0.3s, transform 0.3s;
        }

        select {
            background-color: #2c3e50;
            color: #0ff113;
        }

        button {
            background-color: #f39c12;
            color: #1e1e1e;
            cursor: pointer;
        }

        button:hover {
            background-color: #e67e22;
            transform: scale(1.05);
        }

        select:hover {
            background-color: #34495e;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #555;
        }

        th, td {
            padding: 12px;
            text-align: left;
            color: #0ff13c;
        }

        th {
            background-color: #444;
        }

        tr:nth-child(even) {
            background-color: #3b3b3b;
        }

        tr:hover {
            background-color: #444;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Assign Projects to People</h2>
        <form action="assignProject" method="post">
            <label for="person">Person:</label>
            <select id="person" name="personName">
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
                        String sql = "SELECT user_Name FROM internsassistinfo";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();
                        while (rs.next()) {
                            String personName = rs.getString("user_Name");
                %>
                            <option value="<%= personName %>"><%= personName %></option>
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
            </select><br>

            <label for="project">Project:</label>
            <select id="project" name="projectName">
                <% 
                    try {
                        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                        String sql = "SELECT project_name FROM projects";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();
                        while (rs.next()) {
                            String projectName = rs.getString("project_name");
                %>
                            <option value="<%= projectName %>"><%= projectName %></option>
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
            </select><br>

            <button type="submit">Assign Project</button>
        </form>

        <h2>Current Assignments</h2>
        <table>
            <thead>
                <tr>
                    <th>Person</th>
                    <th>Project</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                        String sql = "SELECT internsassistinfo.user_Name, projects.project_name " +
                                     "FROM project_assignments " +
                                     "JOIN internsassistinfo ON project_assignments.user_Name = internsassistinfo.user_Name " +
                                     "JOIN projects ON project_assignments.project_name = projects.project_name";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();
                        while (rs.next()) {
                            String personName = rs.getString("user_Name");
                            String projectName = rs.getString("project_name");
                %>
                            <tr>
                                <td><%= personName %></td>
                                <td><%= projectName %></td>
                            </tr>
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
            </tbody>
        </table>
    </div>
</body>
</html>
