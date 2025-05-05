<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Product</title>
    <style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #74ebd5, #acb6e5);
    }
    header {
        background: linear-gradient(to right, #1e3c72, #2a5298);
        color: white;
        padding: 20px;
        text-align: center;
        font-size: 28px;
        font-weight: bold;
    }
    nav {
        background-color: #2a3f54;
        overflow: hidden;
    }
    nav a {
        float: left;
        display: block;
        color: #f9f9f9;
        text-align: center;
        padding: 14px 20px;
        text-decoration: none;
        font-weight: bold;
    }
    nav a:hover {
        background-color: #1abc9c;
        color: #fff;
    }
    .content {
        padding: 50px;
        background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
        min-height: 600px;
    }
    .form-container {
        max-width: 700px;
        margin: auto;
        background: rgba(255, 255, 255, 0.85);
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
    }
    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 25px;
    }
    label {
        font-weight: bold;
        display: block;
        margin-top: 10px;
        margin-bottom: 5px;
        color: #333;
    }
    input[type=text], input[type=number], textarea {
        width: 100%;
        padding: 12px;
        border-radius: 8px;
        border: 1px solid #ccc;
        margin-bottom: 20px;
        box-sizing: border-box;
        transition: all 0.3s ease-in-out;
    }
    input[type=text]:focus, input[type=number]:focus, textarea:focus {
        border-color: #1e88e5;
        box-shadow: 0 0 8px rgba(30, 136, 229, 0.2);
    }
    input[type=submit] {
        width: 100%;
        background-color: #1e88e5;
        color: white;
        padding: 14px;
        border: none;
        border-radius: 10px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    input[type=submit]:hover {
        background-color: #0d47a1;
    }
    footer {
        background-color: #222;
        color: #fff;
        text-align: center;
        padding: 15px;
        position: fixed;
        width: 100%;
        bottom: 0;
        border-top: 1px solid #444;
    }
    
    .alert {
    width: 60%;
    margin: 20px auto;
    padding: 15px 20px;
    border-radius: 10px;
    font-size: 18px;
    font-weight: bold;
    text-align: center;
    animation: fadeInSlide 0.5s ease-in-out;
}

.alert.success {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}

.alert.error {
    background-color: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

@keyframes fadeInSlide {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
    
</style>

</head>
<body>

<header>
    <h1>Admin Dashboard</h1>
</header>

<nav>
    <a href="addNewProduct.jsp">Add New Product</a>
    <a href="allProducts.jsp">All Products & Edit Product</a>
    <a href="messages">Messages Received</a>
    <a href="orders">Orders Received</a>
    <a href="cancelOrders">Cancelled Orders</a>
    <a href="deliveredOrders">Delivered Orders</a>
    <a href="logout.jsp">Logout</a>
</nav>
<% 
int id=0;
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
}
catch(Exception e)
{
	e.printStackTrace();
}
try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram")) {
String sql = "SELECT max(id) FROM product";
Statement ps = conn.createStatement();
ResultSet re = ps.executeQuery(sql);
while(re.next())
{
	id = re.getInt(1);
	id=id+1;
}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<div class="content">
    <div class="form-container">
        <h2>Add New Product</h2>
        <form action="AddProductServlet" method="post">
        <h1>Product Id <% out.println(id); %></h1>
            <label for="name">Product Name</label>
            <input type="text" id="name" name="productName" placeholder="Enter Product Name" required>

            <label for="category">Category</label>
            <input type="text" id="category" name="productCategory" placeholder="Enter Category" required>

            <label for="price">Price</label>
            <input type="number" id="price" name="productPrice" placeholder="Enter Price" step="0.01" required>

            <input type="submit" value="Add Product">
        </form>
        <% String msg = request.getParameter("msg"); %>
<% if ("valid".equals(msg)) { %>
    <div class="alert success">
        ✅ Successfully Added Product!
    </div>
<% } else if ("invalid".equals(msg)) { %>
    <div class="alert error">
        ❌ Error Adding Product. Please Try Again.
    </div>
<% } %>
    </div>
</div>


<footer>
    &copy; 2025 Your Company. All rights reserved.
</footer>

</body>
</html>
