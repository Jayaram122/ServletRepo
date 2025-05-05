<%@ page import="java.util.List" %>
<%
    List<String> messages = (List<String>) request.getAttribute("messages");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Messages</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 700px;
            margin: auto;
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #444;
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            background: #f5f5f5;
            margin-bottom: 12px;
            padding: 15px 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
            transition: transform 0.2s, background-color 0.3s;
        }

        li:hover {
            background: #e3f2fd;
            transform: scale(1.02);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2> Messages Received</h2>
        <ul>
            <% if (messages != null && !messages.isEmpty()) {
                for (String msg : messages) { %>
                    <li><%= msg %></li>
            <%  }
               } else { %>
                <li>No messages available.</li>
            <% } %>
        </ul>
    </div>
</body>
</html>
