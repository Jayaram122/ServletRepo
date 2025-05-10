package com.lxisoft.internsassist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/gitAdmin")
public class GitAdminServlet extends HttpServlet 
{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
    {
  /*  String mail = request.getParameter("mail_id");
    String pass = request.getParameter("password");
    if(mail.equals("jayaram@gmail.com") && pass.equals("12345"))
    {
        
    }*/
List<Git>list = new ArrayList<>();
    String url="jdbc:mysql://localhost:3306/internsassist";
    String name ="root";
    String pass="Jayaram";
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    try{
    Connection con = DriverManager.getConnection(url,name,pass);
    String checkQuery = "SELECT * FROM internsgitinfo";
    Statement sta  = con.createStatement();
    ResultSet re = sta.executeQuery(checkQuery);

    while(re.next())
    {
Git git = new Git();
git.setSlNo(re.getInt(1));
git.setName(re.getString(2));
git.setHashLink(re.getString(3));
git.setDate(re.getString(4));
list.add(git);

}

request.setAttribute("list",list);
RequestDispatcher dis = request.getRequestDispatcher("secure/gc/GitAdmin.jsp");
dis.forward(request,response);
}
catch(SQLException e)
{
  e.printStackTrace();
}
}
catch(ClassNotFoundException e)
{
  e.printStackTrace();
}
  }
}