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

@WebServlet("/AddProductServlet")
public class ProductNew extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("productName");
		String category = request.getParameter("productCategory");
		int price = Integer.parseInt(request.getParameter("productPrice"));
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","Jayaram");
			 PreparedStatement pre =c.prepareStatement("insert into product (name,category,price) values (?,?,?)");
			 pre.setString(1, name);
			 pre.setString(2, category);
			 pre.setInt(3, price);
			 pre.executeUpdate();
			 response.sendRedirect("addNewProduct.jsp?msg=valid"); 
			 
		}
		catch(Exception e)
		{
			response.sendRedirect("addNewProduct.jsp?msg=invalid");
			e.printStackTrace();
		}
		
		
	}

}
