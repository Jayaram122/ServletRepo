<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ecommerce.model.Product" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Home</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f9;
            color: #2c3e50;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #34495e;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        header h1 {
            font-size: 22px;
            font-weight: 500;
        }

        nav {
            display: flex;
            align-items: center;
        }

        nav a {
            color: #ecf0f1;
            text-decoration: none;
            margin-left: 20px;
            font-weight: 600;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #1abc9c;
        }

        .search-form {
            display: flex;
            align-items: center;
            background-color: white;
            border-radius: 25px;
            overflow: hidden;
            border: 1px solid #ccc;
            margin-left: 30px;
        }

        .search-form input[type="text"] {
            border: none;
            padding: 10px 15px;
            font-size: 15px;
            flex: 1;
            outline: none;
            border-radius: 25px 0 0 25px;
        }

        .search-form button {
            background-color: #1abc9c;
            border: none;
            padding: 10px 20px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 0 25px 25px 0;
            transition: background-color 0.3s ease;
        }

        .search-form button:hover {
            background-color: #16a085;
        }

        main {
            flex: 1;
            padding: 40px;
            background: #fff;
            margin: 30px auto;
            width: 90%;
            max-width: 1200px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.05);
        }

        main h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #2980b9;
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            font-family: Arial, sans-serif;
        }

        th, td {
            border: 1px solid #444;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        footer {
            background-color: #34495e;
            color: white;
            text-align: center;
            padding: 20px 40px;
            font-size: 14px;
        }

        @media screen and (max-width: 768px) {
            header, footer {
                flex-direction: column;
                text-align: center;
            }
            nav a {
                margin: 10px 5px;
            }
            .search-form {
                margin-top: 15px;
            }
        }
    </style>
</head>
<body>

<%
    String email = (String) session.getAttribute("userEmail");
    String search = request.getParameter("search");

    List<Product> products = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram");

        PreparedStatement ps;
        if (search != null && !search.trim().isEmpty()) {
            ps = conn.prepareStatement("SELECT id, name, category, price FROM product WHERE name LIKE ? OR category LIKE ?");
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
        } else {
            ps = conn.prepareStatement("SELECT id, name, category, price FROM product");
        }

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Product p = new Product();
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setCategory(rs.getString("category"));
            p.setPrice(rs.getInt("price"));
            products.add(p);
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<header>
    <h1>Welcome, <%= email != null ? email : "Guest" %></h1>
    <nav>
        <a href="searchHome.jsp">Home</a>
        <a href="myCart.jsp">My Cart</a>
        <a href="#">My Orders</a>
        <a href="changeDetails.jsp">Change Details</a>
        <a href="messageUs.jsp">Message Us</a>
        <a href="about.jsp">About</a>
        <a href="logout.jsp">Logout</a>
        <form action="searchHome.jsp" method="get" class="search-form">
            <input type="text" name="search" placeholder="Search for products..." value="<%= search != null ? search : "" %>" required>
            <button type="submit">&#128269;</button>
        </form>
    </nav>
</header>

<main>
    <h2>
        <%= (search != null && !search.trim().isEmpty()) 
            ? "Search Results for \"" + search + "\"" 
            : "Product List" %>
    </h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Add To Cart</th>
        </tr>
        <%
            if (!products.isEmpty()) {
                for (Product p : products) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getCategory() %></td>
            <td><%= p.getPrice() %></td>
            <td><a href="addToCart.jsp?id=<%= p.getId() %>">Add to cart</a></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="5">No products found.</td></tr>
        <%
            }
        %>
    </table>
</main>

<footer>
    &copy; 2025 YourCompanyName. All rights reserved.
</footer>

</body>
</html>
