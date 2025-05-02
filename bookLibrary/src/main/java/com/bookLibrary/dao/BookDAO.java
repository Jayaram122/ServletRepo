package com.bookLibrary.dao;

import java.sql.*;
import java.util.*;
import com.bookLibrary.model.Book;

public class BookDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/library_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Jayaram";

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public void addBook(Book book) throws SQLException {
        String sql = "INSERT INTO books (title, author, publication_year, quantity, price) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); 
        	PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getAuthor());
            stmt.setInt(3, book.getPublicationYear());
            stmt.setInt(4, book.getQuantity());
            stmt.setDouble(5, book.getPrice());
            stmt.executeUpdate();
        }
    }

    public List<Book> getAllBooks() throws SQLException {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Book b = new Book();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setAuthor(rs.getString("author"));
                b.setPublicationYear(rs.getInt("publication_year"));
                b.setQuantity(rs.getInt("quantity"));
                b.setPrice(rs.getDouble("price"));
                books.add(b);
            }
        }
        return books;
    }

    public Book getBook(int id) throws SQLException {
        String sql = "SELECT * FROM books WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Book b = new Book();
                    b.setId(id);
                    b.setTitle(rs.getString("title"));
                    b.setAuthor(rs.getString("author"));
                    b.setPublicationYear(rs.getInt("publication_year"));
                    b.setQuantity(rs.getInt("quantity"));
                    b.setPrice(rs.getDouble("price"));
                    return b;
                }
            }
        }
        return null;
    }

    public void updateBook(Book book) throws SQLException {
        String sql = "UPDATE books SET title=?, author=?, publication_year=?, quantity=?, price=? WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getAuthor());
            stmt.setInt(3, book.getPublicationYear());
            stmt.setInt(4, book.getQuantity());
            stmt.setDouble(5, book.getPrice());
            stmt.setInt(6, book.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteBook(int id) throws SQLException {
        String sql = "DELETE FROM books WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}
