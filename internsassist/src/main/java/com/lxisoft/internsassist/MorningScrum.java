package com.lxisoft.internsassist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.time.LocalDateTime;

@WebServlet("/morning")
public class MorningScrum extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Principal principal = request.getUserPrincipal();
        String username = (principal != null) ? principal.getName() : "Unknown";
        LocalDateTime datetime = LocalDateTime.now();

        String attendance = request.getParameter("attendance");
        String status = request.getParameter("status");

        String team = request.getParameter("team");
        String charge = request.getParameter("charge");
        String yproject = request.getParameter("yproject");
        String tproject = request.getParameter("tproject");
        String t1project = request.getParameter("t1project");
        String t2project = request.getParameter("t2project");
        String t3project = request.getParameter("t3project");
        String aproject = request.getParameter("aproject");
        String stuck = request.getParameter("stuck");

        String jdbcURL = "jdbc:mysql://localhost:3306/internsassist";
        String dbUser = "root";
        String dbPassword = "Jayaram";

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String sql = "INSERT INTO scrummorning (user_Name, date_time, team, attendance, scrumInCharge, yesterdayTask, task_status, projectName, task1, task2, task3, addtional, stuck) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setObject(2, datetime);
                statement.setString(3, team);
                statement.setString(4, attendance);
                statement.setString(5, charge);
                statement.setString(6, yproject);
                statement.setString(7, status);
                statement.setString(8, tproject);
                statement.setString(9, t1project);
                statement.setString(10, t2project);
                statement.setString(11, t3project);
                statement.setString(12, aproject);
                statement.setString(13, stuck);

                statement.executeUpdate();
                response.sendRedirect("morningScrumSummary.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().print("Database error: " + e.getMessage());
        }
    }
}
