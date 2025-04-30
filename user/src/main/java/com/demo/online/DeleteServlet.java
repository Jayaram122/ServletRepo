package com.demo.online;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

    Connection connection;

    public void init() {
        String url = "jdbc:mysql://localhost:3306/student_db";
        String user_name = "root";
        String user_pass = "Jayaram";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user_name, user_pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String query = "DELETE FROM user WHERE id = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(query);
            pre.setInt(1, id);
            int i = pre.executeUpdate();

            if (i > 0) {
                response.sendRedirect("ViewServlet");  
            } else {
                response.setContentType("text/html");
                response.getWriter().println("<h3>Row Not Deleted</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Exception occurred: " + e.getMessage());
        }
    }
}
