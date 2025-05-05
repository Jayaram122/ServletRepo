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


@WebServlet("/sendMessage")
public class SendMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

    	try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","Jayaram");
			 PreparedStatement pre =c.prepareStatement("insert into user_messages (name,email,message) values (?,?,?)");
			 pre.setString(1, name);
			 pre.setString(2, email);
			 pre.setString(3, message);
			 pre.executeUpdate();
			 response.sendRedirect("messageUs.jsp?msg=valid"); 
			 
		}
		catch(Exception e)
		{
			response.sendRedirect("messageUs.jsp?msg=invalid");
			e.printStackTrace();
		}
    }
}
