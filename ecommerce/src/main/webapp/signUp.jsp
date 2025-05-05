<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <style>
        body {
            background: linear-gradient(to right, #ff758c, #ff7eb3);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .signup-form {
            background: #ffffff;
            padding: 35px 45px;
            border-radius: 18px;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.3);
            width: 400px;
            animation: floatIn 0.8s ease-in-out;
        }

        @keyframes floatIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .signup-form h2 {
            text-align: center;
            color: #ff4081;
            margin-bottom: 25px;
        }

        .signup-form input[type="text"],
        .signup-form input[type="email"],
        .signup-form input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-sizing: border-box;
            transition: 0.3s;
            font-size: 15px;
        }

        .signup-form input:focus {
            border-color: #ff4081;
            box-shadow: 0 0 6px rgba(255, 64, 129, 0.5);
            outline: none;
        }

        .signup-form input[type="submit"] {
            width: 100%;
            padding: 14px;
            background: #ff4081;
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 15px;
        }

        .signup-form input[type="submit"]:hover {
            background: #e73370;
        }

        .message {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            color: green;
        }
    </style>
</head>
<body>

    <form action="signup" method="post" class="signup-form">
        <h2>Create Account</h2>
        <input type="hidden" name="action" value="signup" />
        <input type="text" name="name" placeholder="Full Name" required />
        <input type="email" name="email" placeholder="Email Address" required />
        <input type="text" name="mobilenumber" placeholder="Mobile Number" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="text" name="address" placeholder="Address" required />
        <input type="text" name="city" placeholder="City" required />
        <input type="text" name="state" placeholder="State" required />
        <input type="text" name="country" placeholder="Country" required />
        <input type="submit" value="Sign Up" />
        
        <% String r = request.getParameter("msg");
           if("valid".equals(r)) { %>
               <div class="message">✅ Successfully Registered!</div>
        <% } %>
    </form>

</body>
</html>
