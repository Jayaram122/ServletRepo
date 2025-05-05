package com.ecommerce.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/messages")
public class MessagesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String> messages = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT message FROM messages");

            while (rs.next()) {
                messages.add(rs.getString("message"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("messages", messages);
        request.getRequestDispatcher("messages.jsp").forward(request, response);
    }
}
