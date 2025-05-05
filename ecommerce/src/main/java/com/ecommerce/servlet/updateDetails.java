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

@WebServlet("/updateDetails")
public class updateDetails extends HttpServlet {


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String name = request.getParameter("name");
	    long number = Long.parseLong(request.getParameter("number"));
	    String address = request.getParameter("address");
	    String city = request.getParameter("city");
	    String state = request.getParameter("state");
	    String country = request.getParameter("country");
	    HttpSession session = request.getSession();
	    String email = (String) session.getAttribute("userEmail");

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram");
	        PreparedStatement ps = con.prepareStatement("UPDATE users SET name = ?,mobilenumber = ?,address = ?, city = ?,state = ?,country = ?  WHERE email = ?");
	        ps.setString(1, name);
	        ps.setLong(2, number);
	        ps.setString(3, address);
	        ps.setString(4, city);
	        ps.setString(5, state);
	        ps.setString(6,country);
	        ps.setString(7,email);
	        int rowsUpdated = ps.executeUpdate();
	        response.sendRedirect("changeDetails.jsp?msg=update");
	       
	        con.close();
	    } catch (Exception e) {
	        response.sendRedirect("changeDetails.jsp?msg=updateError");
	        e.printStackTrace();
	    }

	}

}
