package com.bookLibrary.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.bookLibrary.model.Book;
import com.bookLibrary.dao.BookDAO;

@WebServlet("/list")
public class ListBooksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            BookDAO dao = new BookDAO();
            List<Book> books = dao.getAllBooks();
            request.setAttribute("books", books);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

