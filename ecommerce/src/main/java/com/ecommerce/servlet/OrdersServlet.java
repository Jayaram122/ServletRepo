package com.ecommerce.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import com.ecommerce.model.*;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Order> orders = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM orders WHERE status = 'Pending'");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                orders.add(new Order(rs.getInt("id"), rs.getString("customer"), rs.getString("product"), rs.getString("status")));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
}

