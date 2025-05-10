package com.lxisoft.internsassist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.io.PrintWriter;

@WebServlet("/addPointServlet")
public class AddPointServlet extends HttpServlet {
    public static final long serialVersionUID = 1L;
    public Connection connection;
    public String url = "jdbc:mysql://localhost:3306/internsassist";
    public String name = "root";
    public String pass = "Jayaram";
    String username2;
    

    @Override
    public void init() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, name, pass);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
       

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        try
        {
             connection = DriverManager.getConnection(url, name, pass);
            Principal principal = request.getUserPrincipal();
            if (principal != null) {
                username2= principal.getName();
                
        
            } else {
                out.println("error");
                // Handle the case when no user is authenticated
            }

        String username3 = request.getParameter("name");
        int pointsToAdd = Integer.parseInt(request.getParameter("point"));
        
        int currentPoints = getPointsFromDatabase(username3);  //-->2
        int newPoints = currentPoints + pointsToAdd;

        updatePointsInDatabase(username3, newPoints);
        response.sendRedirect("secure/admin/out.jsp");
        //response.getWriter().println("Point Add");
        // Redirect or forward as needed
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    }

    private int getPointsFromDatabase(String username3) {
        String query = "SELECT point FROM internsassistinfo WHERE user_Name = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username3);
            ResultSet result = preparedStatement.executeQuery();
            if (result.next()) {
                return result.getInt("point");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Default points if not found or error
    }

    private void updatePointsInDatabase(String username3, int newPoints) {
        String query = "UPDATE internsassistinfo SET point = ? WHERE user_Name = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, newPoints);
            preparedStatement.setString(2, username3);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
