<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <% String email = (String) session.getAttribute("userEmail");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Message Us</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            max-width: 600px;
            width: 100%;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2c3e50;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #34495e;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }

        textarea {
            height: 120px;
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 14px;
            width: 100%;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        @media (max-width: 600px) {
            .form-container {
                padding: 25px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Send Us a Message</h2>
        <form action="sendMessage" method="post">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>

            <input type="hidden" id="email" name="email" value="<%= email %>" required>

            <label for="message">Message</label>
            <textarea id="message" name="message" required></textarea>

            <input type="submit" value="Send">
                  <% String r = request.getParameter("msg");
           if("valid".equals(r)) { %>
               <div class="message">✅ Response Successfully Registered!</div>
        <% } 
        else if("invalid".equals(r))
        {%>
               <div class="message"> ❌ Response Error..</div>
        <%}%>
        </form>
    </div>
</body>
</html>
