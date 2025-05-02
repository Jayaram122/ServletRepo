package com.bookLibrary.servlet;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.bookLibrary.model.Book;
import com.bookLibrary.dao.BookDAO;

@WebServlet("/add")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Book book = new Book();
            book.setTitle(request.getParameter("title"));
            book.setAuthor(request.getParameter("author"));
            book.setPublicationYear(Integer.parseInt(request.getParameter("year")));
            book.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            book.setPrice(Double.parseDouble(request.getParameter("price")));

            BookDAO dao = new BookDAO();
            dao.addBook(book);
            response.sendRedirect("list");
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

