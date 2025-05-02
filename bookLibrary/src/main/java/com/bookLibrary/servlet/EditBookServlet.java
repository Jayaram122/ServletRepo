package com.bookLibrary.servlet;

import com.bookLibrary.model.Book;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.bookLibrary.dao.BookDAO;

@WebServlet("/edit")
public class EditBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Book book = new Book();
            book.setId(Integer.parseInt(request.getParameter("id")));
            book.setTitle(request.getParameter("title"));
            book.setAuthor(request.getParameter("author"));
            book.setPublicationYear(Integer.parseInt(request.getParameter("year")));
            book.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            book.setPrice(Double.parseDouble(request.getParameter("price")));

            BookDAO dao = new BookDAO();
            dao.updateBook(book);
            response.sendRedirect("list");
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
