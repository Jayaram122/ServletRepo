package com.lxisoft.internsassist;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/dash")
public class dashServlet extends HttpServlet {

    String url;
    String name;
    String pass;
    Connection con;
    String username2;

    List<Internsassist> list =new ArrayList<>();
    

    public void init() {
        url = "jdbc:mysql://localhost:3306/internsassist";
        name = "root";
        pass = "Jayaram";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, name, pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Principal principal = request.getUserPrincipal();
            username2 = principal.getName();

        try {
            String query = "SELECT project_name,sl_no FROM project_assignments WHERE user_Name = ?";
            PreparedStatement  pre = con.prepareStatement(query);
            pre.setString(1, username2);
            ResultSet  re = pre.executeQuery();

            while (re.next()) {
                Internsassist intern = new Internsassist();
                intern.setSl_no(re.getInt("sl_no"));
                intern.setProjectName(re.getString("project_name"));
                list.add(intern);
            }
            request.setAttribute("in", list);

            RequestDispatcher ree = request.getRequestDispatcher("projectview.jsp");
            ree.forward(request,response);
        } 
        catch (SQLException e) {
            e.printStackTrace();
        } 
    }
}
