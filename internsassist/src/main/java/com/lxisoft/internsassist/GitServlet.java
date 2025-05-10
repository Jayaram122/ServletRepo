package com.lxisoft.internsassist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.time.LocalDateTime;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.Principal;

@WebServlet("/git")
public class GitServlet extends HttpServlet
{
    String url;
    String name;
    String pass;
    String username2;
    Connection con;
    Git git = new Git();
    Connection connection;

    public void init()
    {
        url = "jdbc:mysql://localhost:3306/internsassist";
        name = "root";
        pass = "Jayaram";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,name,pass);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
       
    }
public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException
{
    PrintWriter out = response.getWriter();

    try
    {
         connection = DriverManager.getConnection(url, name, pass);
        Principal principal = request.getUserPrincipal();
        if (principal != null) {
            username2= principal.getName();
            git.setName(username2);
    
        } else {
            out.println("error");
            // Handle the case when no user is authenticated
        }
        //String name = principal.getName();
        LocalDateTime datetime = LocalDateTime.now();
        
    

    
   // git.setName(request.getParameter("name"));
    git.setHashLink(request.getParameter("hashLink"));
   // String mail = request.getParameter("mail_id");
    String query ="insert into internsgitinfo (user_Name,hashlink,date_Time) values (?,?,?)";
    String pointQuery = "SELECT * FROM internsassistinfo WHERE user_Name='"+username2+"'";
    String pointUpdateQuery = "UPDATE internsassistinfo SET point=? WHERE user_Name=?";
  
   PreparedStatement pre = con.prepareStatement(query);
   pre.setString(1,git.getName());
   pre.setString(2,git.getHashLink());
   pre.setObject(3,datetime);
   pre.executeUpdate();
   response.sendRedirect("blank.jsp");

   
        Statement stmnt = con.createStatement();
        ResultSet result = stmnt.executeQuery(pointQuery);
        while(result.next()){
            Internsassist intern = new Internsassist();
          //  intern.setMail_id(result.getString(1));
         //   intern.setPassword(result.getString(2));
            intern.setName(result.getString(1));
            intern.setPoints(result.getInt(6));

            int newPoint = new PointSystem().gitHubPoins(intern);
            PreparedStatement psUpdatePoint = con.prepareStatement(pointUpdateQuery);
            psUpdatePoint.setInt(1, newPoint);
            psUpdatePoint.setString(2, git.getName());
            psUpdatePoint.executeUpdate();
        }
    }


    catch(SQLException e){
        e.printStackTrace();
    }

}

}