<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Order" %>
<%
    List<Order> cancelOrders = (List<Order>) request.getAttribute("cancelOrders");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cancelled Orders</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #ff9a9e, #fad0c4);
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
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            color: #c0392b;
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
            background-color: #e74c3c;
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        td {
            color: #444;
        }

        .status-cancelled {
            color: #c0392b;
            background-color: #fddede;
            padding: 6px 12px;
            border-radius: 8px;
            font-weight: bold;
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2> Cancelled Orders</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Customer</th>
                <th>Product</th>
                <th>Status</th>
            </tr>
            <% if (cancelOrders != null && !cancelOrders.isEmpty()) {
                for (Order order : cancelOrders) {
            %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getCustomer() %></td>
                <td><%= order.getProduct() %></td>
                <td><span class="status-cancelled"><%= order.getStatus() %></span></td>
            </tr>
            <%  }
               } else { %>
            <tr>
                <td colspan="4">No cancelled orders available.</td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
