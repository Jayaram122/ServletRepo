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

@WebServlet("/leaveView")
public class leaveViewServlet extends HttpServlet
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
        List<Leave> leavesList = new ArrayList<>();

        String viewQuery = "SELECT * FROM leaves";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(viewQuery);
            ResultSet result = preparedStatement.executeQuery();

            while (result.next()) {
                Leave leave = new Leave();
                leave.setSlNo(result.getInt("sl_no"));
                leave.setUserName(result.getString("user_Name"));
                leave.setDateTime(result.getObject("date_Time"));
                leave.setTeam(result.getString("team"));
                leave.setLeaveType(result.getString("leave_Type"));
                leave.setLeaveStartDate(result.getString("leave_Start"));
                leave.setLeaveEndDate(result.getString("leave_End"));
                leave.setReason(result.getString("reason"));

                leavesList.add(leave);
            }

            request.setAttribute("leavesList", leavesList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("leaveView.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
