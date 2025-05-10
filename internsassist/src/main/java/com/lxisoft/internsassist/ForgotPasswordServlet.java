package com.lxisoft.internsassist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet{
    Connection connection;

    public void init(){        
    String url="jdbc:mysql://localhost:3306/userdb";
    String name="root";
    String pass="Jayaram";
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url,name,pass);
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    }

    
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException{
      
        String name = request.getParameter("user_Name");
        String newPassword = request.getParameter("newPassword");
        String reNewPassword = request.getParameter("ReEnterPassword");
        PrintWriter out = response.getWriter();
        if(newPassword.equals(reNewPassword)){
            try {
                String resetPassword = "UPDATE users SET user_pass=? WHERE user_name=?";
                PreparedStatement psresetPassword = connection.prepareStatement(resetPassword);
                psresetPassword.setString(1,newPassword);
                psresetPassword.setString(2, name);
                psresetPassword.executeUpdate();
                response.getWriter().println("Password Updated");
            }
             catch (Exception e) {
                e.printStackTrace();
            }
        }
        else{
        out.println("both password should be same");
            
        }
    }
    
}