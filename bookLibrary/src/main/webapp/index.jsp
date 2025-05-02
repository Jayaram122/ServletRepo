<%@ page import="java.util.*,com.bookLibrary.model.Book" %>
<html>
<head><title>Library Inventory</title></head>
<body>
    <h2>Library Book Inventory</h2>
    <a href="addBook.jsp">Add New Book</a>
    <table border="1">
        <tr><th>ID</th><th>Title</th><th>Author</th><th>Year</th><th>Qty</th><th>Price</th><th>Actions</th></tr>
        <%
            List<Book> books = (List<Book>) request.getAttribute("books");
            for (Book b : books) {
        %>
        <tr>
            <td><%= b.getId() %></td>
            <td><%= b.getTitle() %></td>
            <td><%= b.getAuthor() %></td>
            <td><%= b.getPublicationYear() %></td>
            <td><%= b.getQuantity() %></td>
            <td><%= b.getPrice() %></td>
            <td>
                <form action="editBook.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="id" value="<%= b.getId() %>">
                    <input type="submit" value="Edit">
                </form>
                <a href="delete?id=<%= b.getId() %>">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
