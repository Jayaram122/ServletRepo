<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Cart</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 18px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #e6f7ff;
        }
    </style>
</head>
<body>

<h2>My Cart</h2>

<table>
    <tr>
        <th>Email</th>
        <th>Product ID</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Total</th>
    </tr>
<%
    String mail = (String) session.getAttribute("userEmail");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram");

        PreparedStatement ps = con.prepareStatement("SELECT email, product_id, quantity, price, total FROM cart WHERE email = ?");
        ps.setString(1, mail);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getInt("product_id") %></td>
        <td><%= rs.getInt("quantity") %></td>
        <td>₹<%= rs.getDouble("price") %></td>
        <td>₹<%= rs.getDouble("total") %></td>
    </tr>
<%
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>

</body>
</html>
