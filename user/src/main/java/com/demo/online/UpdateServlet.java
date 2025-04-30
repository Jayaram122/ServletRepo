package com.demo.online;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String query = "SELECT * FROM user WHERE id=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                EmployeeDto e = new EmployeeDto();
                e.setId(rs.getInt("id"));
                e.setName(rs.getString("name"));
                e.setPassword(rs.getInt("password"));
                e.setEmail(rs.getString("email"));
                e.setCountry(rs.getString("country"));
                request.setAttribute("user", e);
                request.getRequestDispatcher("Update.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int password = Integer.parseInt(request.getParameter("password"));
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        String updateQuery = "UPDATE user SET name=?, password=?, email=?, country=? WHERE id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(updateQuery);
            ps.setString(1, name);
            ps.setInt(2, password);
            ps.setString(3, email);
            ps.setString(4, country);
            ps.setInt(5, id);
            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("ViewServlet");
            } else {
                response.getWriter().println("Update failed!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
