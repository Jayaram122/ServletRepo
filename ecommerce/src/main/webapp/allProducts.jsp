<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Products</title>
    <style>
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #1e88e5;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a.edit-button {
            text-decoration: none;
            background: #4CAF50;
            color: white;
            padding: 6px 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">All Products</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Edit</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM product");

                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("category") %></td>
            <td><%= rs.getInt("price") %></td>
            <td><a class="edit-button" href="editProduct.jsp?id=<%= rs.getInt("id") %>">Edit</a></td>
        </tr>
        <%
                }
                con.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
