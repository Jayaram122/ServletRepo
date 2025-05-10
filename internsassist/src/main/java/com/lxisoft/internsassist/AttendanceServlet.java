package com.lxisoft.internsassist;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServlet;

import java.io.PrintWriter;
import java.time.LocalDateTime;
import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.ServletException;
import java.sql.DriverManager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.security.Principal;

@WebServlet("/attendanceServlet")
public class AttendanceServlet extends HttpServlet{

    String url;
    String username;
    String password;
    String username2;
    String status ;
    @Override
    public void init() throws ServletException {
        url="jdbc:mysql://localhost:3306/internsassist";
        username="root";
        password="Jayaram";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
    PrintWriter out = response.getWriter();

    Principal principal = request.getUserPrincipal();
    if (principal != null) {
        username2= principal.getName();

    } else {
        out.println("error");
        // Handle the case when no user is authenticated
    }
    String que = "select * FROM internsassistinfo WHERE user_Name='"+username2+"'";
    String updatePoint = "UPDATE internsassistinfo SET point=? WHERE user_Name=?";

try {
    Connection connection = DriverManager.getConnection(url, username, password);

    //String name = principal.getName();
    LocalDateTime datetime = LocalDateTime.now();

    String attendanceStatus = request.getParameter("attendance");
     status = "absent".equals(attendanceStatus) ? "absent" : "present"; 
    String query = "insert into attendance(user_Name,date_Time,status) values(?,?,?)";
    
    PreparedStatement statement = connection.prepareStatement(query);
    statement.setString(1, username2);
    statement.setObject(2, datetime);
    statement.setString(3, status);
    statement.executeUpdate();

    response.getWriter().println("ATTENDANCE MARKED");
} catch (SQLException e) {
    e.printStackTrace();
        }

        try{
            Connection con = DriverManager.getConnection(url, username, password);
            Statement stmnt = con.createStatement();
            ResultSet result = stmnt.executeQuery(que);
            while(result.next()){
                Internsassist attIntern = new Internsassist();
                attIntern.setName(result.getString(1));
                
                try {
                    attIntern.setPoints(result.getInt(6));
                } catch (SQLException e) {
                    // Handle the case where the second column is not an integer
                    attIntern.setPoints(0); // Or some default value
                }
    
                int newPoint = new PointSystem().attendencePoint(attIntern);
                PreparedStatement psUpdatePoint = con.prepareStatement(updatePoint);
                psUpdatePoint.setInt(1, newPoint);
                psUpdatePoint.setString(2, username2);
                psUpdatePoint.executeUpdate();
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }

    }
}