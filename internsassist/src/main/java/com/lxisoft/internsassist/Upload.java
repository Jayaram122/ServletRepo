package com.lxisoft.internsassist;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.security.Principal;
import java.sql.DriverManager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

@WebServlet("/Upload")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class Upload extends HttpServlet {

    String url;
    String pass;
    String name;
    Connection conection;
    Internsassist intern;

    public void init() {
        url = "jdbc:mysql://localhost:3306/internsassist";
        name = "root";
        pass = "Jayaram";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            conection = DriverManager.getConnection(url, name, pass);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Principal pri = request.getUserPrincipal();
        String user_Name = pri != null ? pri.getName() : null;

        if (user_Name == null) {
            response.getWriter().println("User is not authenticated.");
            return;
        }

         intern = new Internsassist();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Part part = request.getPart("image");
        InputStream input = part != null ? part.getInputStream() : null;

        try {
            // Fetch existing values from the database
            String selectQuery = "SELECT name, mail_Id, phoneNumber FROM internsassistinfo WHERE user_Name = ?";
            PreparedStatement selectPre = conection.prepareStatement(selectQuery);
            selectPre.setString(1, user_Name);
            ResultSet rs = selectPre.executeQuery();

            if (rs.next()) {
                String currentName = rs.getString("name");
                String currentEmail = rs.getString("mail_Id");
                String currentPhone = rs.getString("phoneNumber");

                // Use existing values if parameters are null or empty
                if (name == null || name.trim().isEmpty()) {
                    name = currentName;
                }
                if (email == null || email.trim().isEmpty()) {
                    email = currentEmail;
                }
                if (phone == null || phone.trim().isEmpty()) {
                    phone = currentPhone;
                }
            }

            // Update the database with new values
            StringBuilder queryBuilder = new StringBuilder("UPDATE internsassistinfo SET ");
            if (input != null) {
                queryBuilder.append("photo = ?, ");
            }
            queryBuilder.append("name = ?, mail_Id = ?, phoneNumber = ? WHERE user_Name = ?");

            PreparedStatement pre = conection.prepareStatement(queryBuilder.toString());

            int paramIndex = 1;
            if (input != null) {
                pre.setBlob(paramIndex++, input);
            }
            pre.setString(paramIndex++, name);
            pre.setString(paramIndex++, email);
            pre.setString(paramIndex++, phone);
            pre.setString(paramIndex++, user_Name);

            pre.executeUpdate();
            response.getWriter().println("Edited Successfully");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
