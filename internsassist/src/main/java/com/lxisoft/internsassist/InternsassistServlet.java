package com.lxisoft.internsassist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Internsassistt")
public class InternsassistServlet extends HttpServlet  
{
    String url;
    String name;
    String pass;
    String url2;
    String name2;
    String pass2;

public void init()
{
    url="jdbc:mysql://localhost:3306/internsassist";
    name="root";
    pass="Jayaram";

    url2="jdbc:mysql://localhost:3306/userdb";
    name2="root";
    pass2="Jayaram";
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
    }
    catch(ClassNotFoundException e)
    {
        e.printStackTrace();
    }
}

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
    {

  
        Internsassist internsassist = new Internsassist();
        internsassist.setMail_id(request.getParameter("mail_id"));
        internsassist.setPassword(request.getParameter("password"));
        internsassist.setName(request.getParameter("name"));


        if (internsassist.getPassword().length() < 8) {
            request.setAttribute("error", "Password must be at least 8 characters long");
    
            RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
            dispatcher.forward(request, response);
            //response.getWriter().println("Password must be at least 8 characters long");
            return;
        }

            try{
            Connection connection = DriverManager.getConnection(url,name,pass);
            String query = "insert into internsassistinfo(user_Name,mail_Id) values (?,?)";
            PreparedStatement prepared = connection.prepareStatement(query);
            prepared.setString(2,internsassist.getMail_id());
            prepared.setString(1,internsassist.getName());
            prepared.executeUpdate();

            Connection connection2 = DriverManager.getConnection(url2,name2,pass2);
            String query2 ="INSERT INTO users(user_name,user_pass) values (?,?)";
            PreparedStatement prepared2 = connection2.prepareStatement(query2);
            prepared2.setString(2,internsassist.getPassword());
            prepared2.setString(1,internsassist.getName());
            prepared2.executeUpdate();
            
            response.getWriter().println("Account Created Succesfully");
            response.sendRedirect("home.jsp");
            //RequestDispatcher dispatcher = request.getRequestDispatcher("/auth.jsp");
            //dispatcher.forward(request, response);
            response.getWriter().println("Account Added");
            }
            catch(SQLException e)
            {
               e.printStackTrace();
            }     
    }
}