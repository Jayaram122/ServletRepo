package com.ecommerce.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
		 HttpSession session = request.getSession();
		 session.setAttribute("userEmail", email);
		 
    	if(email.equals("admin12@gmail.com") &&  password.equals("Admin@123"))
    	{
             
    		response.sendRedirect("admin.jsp");
    	}
    	else
    	{
    		try
    		{
    			Class.forName("com.mysql.cj.jdbc.Driver");
    		}
    		catch(Exception e)
    		{
    			e.printStackTrace();
    		}
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram")) {
            String sql = "SELECT name FROM users WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                request.setAttribute("name", rs.getString("name"));
                request.getRequestDispatcher("home.jsp").forward(request, response);
            } else {
            	response.sendRedirect("login.jsp?msg=invalid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	}
    }
}
