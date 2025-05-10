package com.lxisoft.internsassist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/roles")
public class RolesServlet extends HttpServlet {

    Connection connection ;

    String url ;
    String name ;
    String pass ;

    String url1 ;
    String name1 ;
    String pass1 ;

    public void init() {

        url = "jdbc:mysql://localhost:3306/userdb";
        name = "root";
        pass = "Jayaram";

        url1 = "jdbc:mysql://localhost:3306/internsassist";
        name1 = "root";
        pass1 = "Jayaram";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //connection = DriverManager.getConnection(url, name, pass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        String action = request.getParameter("action");

        switch (action) {
            case "assign":
                    this.assignInternsinfo(request, response);
                    this.assignRole(request, response);
                break;
            
            case "change":
                    this.changeInternsinfo(request, response);
                    this.changeRole(request, response);
                break;

            case "remove":
                    this.removeInternInfo(request, response);
                    this.removeRole(request, response);
                break;

            default:
                response.sendRedirect("error.jsp");
                break;
        }
        
    }

    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
    
        if ("remove".equals(action)) {
            this.removeInternInfo(request, response);
            this.removeRole(request, response);
        }
    }
    
    public void assignRole(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String person = request.getParameter("personName");
        String role = request.getParameter("role");

        String sql = "INSERT INTO user_roles (user_name, role_Name) VALUES (?, ?)";

        try{
            connection = DriverManager.getConnection(url, name, pass);

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, person);
            statement.setString(2, role);
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("Assigned.jsp");
            } else {
                response.getWriter().print("Failed to assign role");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().print("Failed to assign role");
        }
    }

    public void assignInternsinfo(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        String person = request.getParameter("personName");
        String role = request.getParameter("role");

        try{
            String sql = "UPDATE internsassistinfo SET role_Name = ? WHERE user_Name = ?";

            connection = DriverManager.getConnection(url1, name1, pass1);

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, role);
            statement.setString(2, person);
            statement.executeUpdate();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }

    public void changeRole(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String person = request.getParameter("personName");
        String role = request.getParameter("role");

        String sql = "UPDATE user_roles SET role_Name = ? WHERE user_name = ?";

        try {
            connection = DriverManager.getConnection(url, name, pass);
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, role);
            statement.setString(2, person);
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("roleChange.jsp");
            } else {
                response.getWriter().print("Failed to change role");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().print("Failed to change role");
        }
    }

    public void changeInternsinfo(HttpServletRequest request , HttpServletResponse response) throws IOException
    {
        String person = request.getParameter("personName");
        String role = request.getParameter("role");

        String sql = "UPDATE internsassistinfo SET role_Name = ? WHERE user_Name = ?";

        try {
            connection = DriverManager.getConnection(url1, name1, pass1);
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, role);
            statement.setString(2, person);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeRole(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String person = request.getParameter("name");
    
        String sql = "DELETE FROM user_roles WHERE user_name = ?";
    
        try {
            connection = DriverManager.getConnection(url, name, pass);
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, person);
            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("roleDeleted.jsp");
            } else {
                response.getWriter().print("Failed to delete role");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeInternInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String person = request.getParameter("name");
        String role = "N/A";
    
        String sql = "UPDATE internsassistinfo SET role_Name = ? WHERE user_Name = ?";
    
        try {
            connection = DriverManager.getConnection(url1, name1, pass1);
            PreparedStatement statement = connection.prepareStatement(sql) ;
            
            statement.setString(1, role); 
            statement.setString(2, person);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}