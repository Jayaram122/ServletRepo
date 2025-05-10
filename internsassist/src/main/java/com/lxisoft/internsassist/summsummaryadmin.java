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

@WebServlet("/summaryadmin")
public class summsummaryadmin extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    Connection connection;

    public void init()
    {
        String url = "jdbc:mysql://localhost:3306/internsassist";
        String userName = "root";
        String password = "Jayaram";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, userName, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        List<Scrum> scrumList = new ArrayList<>();

        String viewQuery = "SELECT * FROM scrummorning";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(viewQuery);
            ResultSet result = preparedStatement.executeQuery();

            while (result.next()) {
                Scrum scrum = new Scrum();
                scrum.setSlNo(result.getInt("sl_no"));
                scrum.setUserName(result.getString("user_Name"));
                scrum.setDateTime(result.getObject("date_Time"));
                scrum.setTeam(result.getString("team"));
                scrum.setAttendace(result.getString("attendance"));
                scrum. setScrumInCharge(result.getString("scrumInCharge"));
                scrum.setYesterdayTask(result.getString("yesterdayTask"));
                scrum.setTask_status(result.getString("task_status"));
                scrum.setProjectName(result.getString("projectName"));
                scrum.setTask1(result.getString("task1"));
                scrum.setTask2(result.getString("task2"));
                scrum.setTask3(result.getString("task3"));
                scrum.setAdditional(result.getString("addtional"));
                scrum.setStuck(result.getString("stuck"));

                scrumList.add(scrum);
            }

            request.setAttribute("scrumList", scrumList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("summaryadmin.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
