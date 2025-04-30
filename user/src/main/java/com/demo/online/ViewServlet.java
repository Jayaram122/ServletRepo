package com.demo.online;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet{
 
	Connection connection;
	public void init()
	{
		String url="jdbc:mysql://localhost:3306/student_db";
    	String user_name = "root";
    	String user_pass = "Jayaram";
    	int status = 0;
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 connection = DriverManager.getConnection(url,user_name,user_pass);
    	}
    	catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
	{
		List<EmployeeDto> list = new ArrayList<>();
		String query= "select * from user";
		try
		{
		PreparedStatement pre = connection.prepareStatement(query);
		ResultSet re = pre.executeQuery();
		while(re.next())
		{
			EmployeeDto e1 = new EmployeeDto();
			e1.setId(re.getInt(1));
		    e1.setName(re.getString(2));
			e1.setPassword(re.getInt(3));
			e1.setEmail(re.getString(4));
			e1.setCountry(re.getString(5));
			list.add(e1);
			
		}
	    request.setAttribute("list", list);
	    request.getRequestDispatcher("view.jsp").forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
