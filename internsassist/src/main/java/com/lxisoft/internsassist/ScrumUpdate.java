package com.lxisoft.internsassist;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//import java.security.Principal; 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/dailyScrumUpdate")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, 
    maxFileSize = 1024 * 1024 * 10,      
    maxRequestSize = 1024 * 1024 * 50   
)
public class ScrumUpdate extends HttpServlet
{
    Connection connection ;

    public void init()
    {
        String url = "jdbc:mysql://localhost:3306/internsassist";
        String name = "root";
        String password="Jayaram";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, name, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
     //   Principal pri = request.getUserPrincipal();
      //  String namee = pri.getName();
        String date = request.getParameter("date");
        String team = request.getParameter("team");
        String name = request.getParameter("name");
        String task = request.getParameter("tasks");
        String status = request.getParameter("taskStatus");
        String gitLink = request.getParameter("gitLink");
        String reason = request.getParameter("notCompletedReason");
        Part photo = request.getPart("screenshot");
    
        InputStream screenshot = photo.getInputStream();

        String sql = "INSERT INTO scrumUpdate (user_Name, date_time, team, task, task_status, hashlink, reason, photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, date);
            preparedStatement.setString(3, team);
            preparedStatement.setString(4, task);
            preparedStatement.setString(5, status);
            preparedStatement.setString(6, gitLink);
            preparedStatement.setString(7, reason);
            preparedStatement.setBlob(8, screenshot);

            preparedStatement.executeUpdate();
            response.sendRedirect("scrumupdate.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}