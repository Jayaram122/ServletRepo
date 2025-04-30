package com.demo.online;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	PrintWriter out = response.getWriter();
	String name= request.getParameter("name");
	int password= Integer.parseInt(request.getParameter("password"));
	String email= request.getParameter("email");
	String country= request.getParameter("country");
	EmployeeDto e1 = new EmployeeDto();
	e1.setName(name);
	e1.setPassword(password);
	e1.setEmail(email);
	e1.setCountry(country);
	
	int i = LoginServletMethod.save(e1);
	if(i>0)
	{
		out.println("Insertion successful");
		//request.getRequestDispatcher("success.html").include(request,response);
	}
	else
	{
		out.println("Insertion Failure");
	}
	}
}
