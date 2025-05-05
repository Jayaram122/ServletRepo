package com.ecommerce.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import java.util.*;
import com.ecommerce.model.Order;


@WebServlet("/cancelOrders")
public class CancelOrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Order> cancelOrders = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM orders WHERE status = 'Cancelled'");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cancelOrders.add(new Order(
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

        request.setAttribute("cancelOrders", cancelOrders);
        request.getRequestDispatcher("cancelOrders.jsp").forward(request, response);
    }
}
