<%@ page import="com.bookLibrary.dao.BookDAO, com.bookLibrary.model.Book" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Book book = new BookDAO().getBook(id);
%>
<html>
<head><title>Edit Book</title></head>
<body>
    <h2>Edit Book</h2>
    <form action="edit" method="post">
        <input type="hidden" name="id" value="<%= book.getId() %>">
        Title: <input type="text" name="title" value="<%= book.getTitle() %>" required><br>
        Author: <input type="text" name="author" value="<%= book.getAuthor() %>" required><br>
        Year: <input type="number" name="year" value="<%= book.getPublicationYear() %>" required><br>
        Quantity: <input type="number" name="quantity" value="<%= book.getQuantity() %>" required><br>
        Price: <input type="text" name="price" value="<%= book.getPrice() %>" required><br>
        <input type="submit" value="Update Book">
    </form>
</body>
</html>
