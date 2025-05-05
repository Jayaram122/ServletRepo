<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #acb6e5);
            margin: 0;
            padding: 40px 0;
        }

        .form-box {
            width: 450px;
            margin: auto;
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #444;
        }

        input[type=text], input[type=password], input[type=email], input[type=number] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: border 0.3s;
        }

        input[type=text]:focus,
        input[type=number]:focus {
            border: 1px solid #007bff;
            outline: none;
        }

        input[type=submit] {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }

        input[type=submit]:hover {
            background: linear-gradient(to right, #0072ff, #00c6ff);
        }

        .message {
            text-align: center;
            margin-top: 25px;
            font-size: 18px;
            font-weight: bold;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="form-box">
    <h2>Change Your Details</h2>
    <form action="updateDetails" method="post">
        <label>New Name:</label>
        <input type="text" name="name" required>

        <label>New Mobile Number:</label>
        <input type="number" name="number" required>

        <label>New Address:</label>
        <input type="text" name="address" required>

        <label>New City:</label>
        <input type="text" name="city" required>

        <label>New State:</label>
        <input type="text" name="state" required>

        <label>New Country:</label>
        <input type="text" name="country" required>

        <input type="submit" value="Update Details">
    </form>

    <%
    String msg = request.getParameter("msg");
    if ("update".equals(msg)) {
    %>
        <div class="message success">✅ User Details Updated</div>
    <% 
    } else if ("updateError".equals(msg)) {
    %>
        <div class="message error">❌ Error Updating User Details</div>
    <% 
    }
    %>
</div>

</body>
</html>
