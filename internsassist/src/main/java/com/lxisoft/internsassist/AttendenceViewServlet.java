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
//import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin")
public class AttendenceViewServlet extends HttpServlet 
{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
    {
      
      List<Internsassist>list = new ArrayList<>();
      String url="jdbc:mysql://localhost:3306/internsassist";
      String name ="root";
      String pass="Jayaram";
  try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      try{
      Connection con = DriverManager.getConnection(url,name,pass);
      String checkQuery = "SELECT * FROM attendance";
      Statement sta  = con.createStatement();
      ResultSet re = sta.executeQuery(checkQuery);
  
      while(re.next())
      {
  Internsassist intern = new Internsassist();
  intern.setSl_no(re.getInt(1));
  intern.setMail_id(re.getString(2));
  intern.setAtendence(re.getString(3));
  intern.setDate(re.getString(4));

  list.add(intern);
  
  }
  
  request.setAttribute("list",list);
  RequestDispatcher dis = request.getRequestDispatcher("secure/gc/AttendenceAdmin.jsp");
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