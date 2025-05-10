package com.lxisoft.internsassist;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Retrieve the session if it exists

        if (session != null) {
            session.invalidate(); // Invalidate the session
        }

        response.getWriter().write("<script>window.parent.location.href='/internsassist/User';</script>");
    }
}
