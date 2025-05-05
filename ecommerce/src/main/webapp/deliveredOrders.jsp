<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Order" %>
<%
    List<Order> deliveredOrders = (List<Order>) request.getAttribute("deliveredOrders");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delivered Orders</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #a8edea, #fed6e3);
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2ecc71;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px 20px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #27ae60;
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td {
            color: #444;
        }

        .status-delivered {
            color: #27ae60;
            background-color: #e9f9ee;
            padding: 6px 12px;
            border-radius: 8px;
            font-weight: bold;
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2> Delivered Orders</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Customer</th>
                <th>Product</th>
                <th>Status</th>
            </tr>
            <% if (deliveredOrders != null && !deliveredOrders.isEmpty()) {
                for (Order order : deliveredOrders) {
            %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getCustomer() %></td>
                <td><%= order.getProduct() %></td>
                <td><span class="status-delivered"><%= order.getStatus() %></span></td>
            </tr>
            <%  }
               } else { %>
            <tr>
                <td colspan="4">No delivered orders available.</td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
