package com.ecommerce.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobilenumber");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
}
catch(Exception e)
{
	e.printStackTrace();
}
        
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram")) {
            String sql = "INSERT INTO users(name, email, mobilenumber, password, address, city, state, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setLong(3, Long.parseLong(mobile));
            ps.setString(4, password);
            ps.setString(5, address);
            ps.setString(6, city);
            ps.setString(7, state);
            ps.setString(8, country);
            ps.executeUpdate();
            response.sendRedirect("signUp.jsp?msg=valid");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
