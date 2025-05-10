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

@WebServlet("/login")
public class LoginServlet extends HttpServlet 
{
    Connection connection ;

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException ,IOException
    {

        Internsassist ia = new Internsassist();
        ia.setMail_id(request.getParameter("mail_id"));
        ia.setPassword(request.getParameter("password"));

        List<Internsassist> internsassists = this.Login(request);

        for(Internsassist internsassist : internsassists)
        {
            if((ia.getMail_id().equals(internsassist.getMail_id())) && (ia.getPassword().equals(internsassist.getPassword())))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
                dispatcher.forward(request, response);
            }
            else{
                response.getWriter().println("Error");
            }
        }

    }

    public List<Internsassist> Login(HttpServletRequest request) 
    {
        List<Internsassist> interns = new ArrayList<>();
        try{


            String url = "jdbc:mysql://localhost:3306/internsassist";
            String userName = "root";
            String password = "Jayaram";
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                
            }
            catch( ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            connection = DriverManager.getConnection(url, userName, password);
            String checkQuery = "SELECT * FROM internsassistinfo" ;
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(checkQuery);
        

            while(rs.next())
            {
                Internsassist ia = new Internsassist();

                ia.setMail_id(rs.getString(1));
                ia.setPassword(rs.getString(2));

                interns.add(ia);
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return interns;
    }
}