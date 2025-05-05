<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page import="java.sql.*" %>

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

        nav a {
            color: #ecf0f1;
            text-decoration: none;
            margin-left: 25px;
            font-weight: 600;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #1abc9c;
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
                display: inline-block;
                margin: 10px;
            }
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
.alert {
    padding: 15px 20px;
    margin: 20px auto;
    width: 60%;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    text-align: center;
    transition: all 0.3s ease;
}

.alert.success {
    background-color: #e0f9e5;
    color: #27ae60;
    border: 1px solid #27ae60;
    box-shadow: 0 0 8px rgba(39, 174, 96, 0.2);
}

.alert.error {
    background-color: #ffe6e6;
    color: #c0392b;
    border: 1px solid #c0392b;
    box-shadow: 0 0 8px rgba(192, 57, 43, 0.2);
}

        
    </style>
</head>
<body>
<%        List<Product> products = new ArrayList<>();

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram");

    PreparedStatement ps = conn.prepareStatement("SELECT id, name, category, price FROM product");
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

request.setAttribute("productList", products);

    String email = (String) session.getAttribute("userEmail");
    List<Product> productss = (List<Product>) request.getAttribute("productList");
%>
<header>
    <h1>Welcome, <%= email %></h1>
    <nav>
        <a href="#">Home</a>
        <a href="myCart.jsp">My Cart</a>
        <a href="#">My Orders</a>
        <a href="changeDetails.jsp">Change Details</a>
        <a href="messageUs.jsp">Message Us</a>
        <a href="about.jsp">About</a>
        <a href="logout.jsp">Logout</a>
        <br><br>
<form action="searchHome.jsp" method="post" class="search-form">
    <input type="text" name="search" placeholder="Search for products..." required>
    <button type="submit">&#128269;</button> 
</form>
    </nav>
</header>

<main>
    <h2>Product List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Add To Cart</th>
        </tr>
        <%
            if (productss != null && !productss.isEmpty()) {
                for (Product p : productss) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getCategory() %></td>
            <td><%= p.getPrice() %></td>
            <td><a href="addToCart.jsp?id=<%= p.getId()%>">Add to cart</a></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="4">No products found.</td></tr>
        <% } %>
    </table>

    <%
    String m = request.getParameter("msg");  
    if("addedExist".equals(m)) {
 %>
       <div class="alert success">
        ✅ Product already exist in your cart! Quantity Increased!
    </div>
<%
    }
    else if ("added".equals(m)) {
%>
    <div class="alert success">
        ✅ Product added to cart successfully!
    </div>
<%
    } else if ("notAdded".equals(m)) {
%>
    <div class="alert error">
        ❌ Failed to add product to cart. Please try again!
    </div>
<%
    }
%>

</main>

<footer>
    &copy; 2025 YourCompanyName. All rights reserved.
</footer>

</body>
</html>
