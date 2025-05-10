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

@WebServlet("/leave")
public class leaveServlet extends HttpServlet {
    String username2;

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        
        Principal principal = request.getUserPrincipal();
        if (principal != null) {
            username2= principal.getName();
    
        } else {
            response.getWriter().println("error");
            // Handle the case when no user is authenticated
        }
        LocalDateTime datetime = LocalDateTime.now();

 String team =  request.getParameter("team");
 String leaveType =  request.getParameter("leaveType");
 String leaveStartDate =  request.getParameter("leaveStart");
 String leaveEndDate =  request.getParameter("leaveEnd");
 String reason =  request.getParameter("reason");

 String jdbcURL = "jdbc:mysql://localhost:3306/internsassist";
        String dbUser = "root";
        String dbPassword = "Jayaram";

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String sql = "INSERT INTO leaves (user_name, date_Time, team, leave_Type, leave_Start,leave_End,reason) VALUES (?,?,?,?,?,?,?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1,username2);
                statement.setObject(2, datetime);
                statement.setString(3, team);
                statement.setString(4, leaveType);
                statement.setString(5, leaveStartDate);
                statement.setString(6, leaveEndDate);
                statement.setString(7, reason);
                 statement.executeUpdate();
    
               response.sendRedirect("leave.jsp");
                 
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().print("Database error: " + e.getMessage());
        }


    }
}