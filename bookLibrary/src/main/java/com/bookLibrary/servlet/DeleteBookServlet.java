package com.bookLibrary.servlet;

import java.io.IOException;

import com.bookLibrary.dao.BookDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.bookLibrary.dao.BookDAO;

@WebServlet("/delete")
public class DeleteBookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            BookDAO dao = new BookDAO();
            dao.deleteBook(id);
            response.sendRedirect("list");
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

