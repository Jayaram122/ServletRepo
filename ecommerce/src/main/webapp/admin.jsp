<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        header {
            background-color: #1e88e5;
            color: white;
            padding: 15px;
            text-align: center;
        }
        nav {
            background-color: #1565c0;
            overflow: hidden;
        }
        nav a {
            float: left;
            display: block;
            color: #fff;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #0d47a1;
        }
        .content {
            padding: 20px;
        }
        footer {
            background-color: #eeeeee;
            color: #333;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
            border-top: 1px solid #ccc;
        }
    </style>
</head>
<body>

<header>
    <h1>Online Shopping</h1>
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

<div class="content">
    <h2>Welcome, Admin!</h2>
    <p>This is your admin panel where you can manage products and orders.</p>
</div>

<footer>
    &copy; 2025 Your Company. All rights reserved.
</footer>

</body>
</html>
