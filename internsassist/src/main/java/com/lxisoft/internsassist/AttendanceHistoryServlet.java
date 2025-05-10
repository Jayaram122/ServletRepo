package com.lxisoft.internsassist;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.security.Principal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/attendanceHistoryServlet")
public class AttendanceHistoryServlet extends HttpServlet {

    String url;
    String username;
    String password;
    String username2;

    @Override
    public void init() throws ServletException {
        url = "jdbc:mysql://localhost:3306/internsassist";
        username = "root";
        password = "Jayaram";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Principal principal = request.getUserPrincipal();
        username2 = principal.getName();
        List<Internsassist> records = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String query = "SELECT * FROM attendance WHERE user_Name = ?";
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, username2);
                try (ResultSet rs = statement.executeQuery()) {
                    while (rs.next()) {
                        String name = rs.getString("user_Name");
                        LocalDateTime datetime = rs.getObject("date_Time", LocalDateTime.class);
                        String status = rs.getString("status");
                        records.add(new Internsassist(name, datetime, status));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("records", records);
        request.getRequestDispatcher("/attendanceHistory.jsp").forward(request, response);
    }


}
