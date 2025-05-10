package com.lxisoft.internsassist;

import java.io.IOException;
import java.security.Principal;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/User")
public class User extends HttpServlet{
   
    HttpServletRequest request;
    String username;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    Principal principal = request.getUserPrincipal();

        if(principal != null){
         username = principal.getName();
        
        boolean isAdmin = request.isUserInRole("admin");
       // response.getWriter().println("Is user in admin role: " + isAdmin);

       boolean isGroupCoordinator =request.isUserInRole("isGroupCoordinator");
       //response.getWriter().println("Is user in admin role: " + isGroupCoordinator);

        boolean isIntern =request.isUserInRole("intern");
        //response.getWriter().println("Is user in admin role: " + isIntern);

        request.setAttribute("isAdmin", isAdmin);
        request.setAttribute("isGroupCoordinator", isGroupCoordinator);
        request.setAttribute("isIntern", isIntern);
        
       RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
       dispatcher.forward(request, response);
       // PrintWriter out = response.getWriter();
       // out.println(username);
        }
    }
  
}