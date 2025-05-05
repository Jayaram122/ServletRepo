package com.ecommerce.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.*;
import java.util.*;
import com.ecommerce.model.Order;

@WebServlet("/deliveredOrders")
public class DeliveredOrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Order> deliveredOrders = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM orders WHERE status = 'Delivered'");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                deliveredOrders.add(new Order(
                    rs.getInt("id"),
                    rs.getString("customer"),
                    rs.getString("product"),
                    rs.getString("status")
                ));
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("deliveredOrders", deliveredOrders);
        request.getRequestDispatcher("deliveredOrders.jsp").forward(request, response);
    }
}

