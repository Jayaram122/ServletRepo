<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Order" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Orders Received</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            color: #444;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 14px 18px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #2a5298;
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        tr:hover {
            background-color: #f1f1f1;
            transition: 0.3s;
        }

        td {
            color: #555;
        }

        .status {
            padding: 6px 12px;
            border-radius: 8px;
            font-weight: bold;
        }

        .status.pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .status.delivered {
            background-color: #d4edda;
            color: #155724;
        }

        .status.cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📦 Orders Received</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Customer</th>
                <th>Product</th>
                <th>Status</th>
            </tr>
            <% if (orders != null && !orders.isEmpty()) {
                for (Order order : orders) {
                    String statusClass = "";
                    switch (order.getStatus().toLowerCase()) {
                        case "pending": statusClass = "pending"; break;
                        case "delivered": statusClass = "delivered"; break;
                        case "cancelled": statusClass = "cancelled"; break;
                    }
            %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getCustomer() %></td>
                <td><%= order.getProduct() %></td>
                <td><span class="status <%= statusClass %>"><%= order.getStatus() %></span></td>
            </tr>
            <%  } 
               } else { %>
               <tr><td colspan="4">No orders available.</td></tr>
            <% } %>
        </table>
    </div>
</body>
</html>
