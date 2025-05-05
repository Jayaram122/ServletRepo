<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String name = "", category = "";
int price = 0;
int idInt = 0;
boolean productFound = false;

if (id != null && !id.trim().isEmpty()) {
    try {
        idInt = Integer.parseInt(id);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Jayaram");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM product WHERE id = ?");
        ps.setInt(1, idInt);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            category = rs.getString("category");
            price = rs.getInt("price");
            productFound = true;
        }
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #34495e;
            font-weight: bold;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
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

<div class="container">
    <h2>Edit Product</h2>

    <% if (productFound) { %>
        <form action="UpdateProductServlet" method="post">
            <input type="hidden" name="id" value="<%= id %>">

            <label for="name">Product Name</label>
            <input type="text" id="name" name="name" value="<%= name %>" required>

            <label for="category">Category</label>
            <input type="text" id="category" name="category" value="<%= category %>" required>

            <label for="price">Price</label>
            <input type="number" id="price" name="price" value="<%= price %>" required>

            <input type="submit" value="Update Product">
        </form>
    <% } else { %>
        
 

    <% 
        String msg = request.getParameter("msg");
        if ("valid".equals(msg)) { 
    %>
        <div class="alert success">Product updated successfully!</div>
    <% 
        } else if ("invalid".equals(msg)) { 
    %>
        <div class="alert error">Failed to update product. Please try again.</div>
    <% } } %>
</div>

</body>
</html>
