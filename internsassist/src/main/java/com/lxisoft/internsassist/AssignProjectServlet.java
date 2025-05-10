package com.lxisoft.internsassist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/assignProject")
public class AssignProjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectName = request.getParameter("projectName");
        String personName = request.getParameter("personName");

        String jdbcURL = "jdbc:mysql://localhost:3306/internsassist";
        String dbUser = "root";
        String dbPassword = "Jayaram";

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String sql = "INSERT INTO project_assignments (project_name, user_Name) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1,projectName);
                statement.setString(2, personName);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    response.getWriter().print("Project assigned successfully");
                } else {
                    response.getWriter().print("Failed to assign project");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().print("Database error: " + e.getMessage());
        }
    }
}
