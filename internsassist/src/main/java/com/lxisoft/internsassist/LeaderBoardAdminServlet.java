package com.lxisoft.internsassist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/leaderBoardd")
public class LeaderBoardAdminServlet extends HttpServlet
{
    Connection connection;

    public void init()
    {
        String url = "jdbc:mysql://localhost:3306/internsassist";
        String userName = "root";
        String password = "Jayaram";

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, userName, password);
        }
        catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
    }

    public void doGet(HttpServletRequest request ,HttpServletResponse response) throws ServletException,IOException
    {
        List<Internsassist> internsassist = this.leaderBoard(request);
        request.setAttribute("internsassist", internsassist);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/secure/admin/LeaderBoard.jsp");
        dispatcher.forward(request, response);
    }

    public List<Internsassist> leaderBoard(HttpServletRequest request)
    {
        List<Internsassist> internsassist = new ArrayList<>();

        String viewQuery = "SELECT user_Name,point FROM internsassistinfo ORDER BY point DESC";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(viewQuery);
            ResultSet result = preparedStatement.executeQuery();
            
            while (result.next()) {
                Internsassist internsassists = new Internsassist();
 
                internsassists.setName(result.getString("user_Name"));
                internsassists.setPoints(result.getInt("point"));

               internsassist.add(internsassists);
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }

        return internsassist ;
    }
}