package com.demo.online;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class LoginServletMethod {

	public static int save(EmployeeDto e1)  {
		String url="jdbc:mysql://localhost:3306/student_db";
    	String user_name = "root";
    	String user_pass = "Jayaram";
    	int status = 0;
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			Connection connection = DriverManager.getConnection(url,user_name,user_pass);
		
		String query= "insert into user (name,password,email,country) values(?,?,?,?)";
			PreparedStatement pre = connection.prepareStatement(query);
			pre.setString(1, e1.getName());
			pre.setInt(2, e1.getPassword());
			pre.setString(3, e1.getEmail());
			pre.setString(4, e1.getCountry());
		 status = pre.executeUpdate();
			
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	return status;
	}
	
}
