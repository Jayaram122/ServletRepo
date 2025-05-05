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

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        int price = Integer.parseInt(request.getParameter("price"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram");

            PreparedStatement ps = con.prepareStatement("UPDATE product SET name=?, category=?, price=? WHERE id=?");
            ps.setString(1, name);
            ps.setString(2, category);
            ps.setInt(3, price);
            ps.setInt(4, id);

            int i = ps.executeUpdate();
            con.close();

            response.sendRedirect("editProduct.jsp?msg=valid");
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("editProduct.jsp?msg=invalid");
        }
    }
}
