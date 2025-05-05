<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            background: linear-gradient(to right, #43cea2, #185a9d);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-form {
            background-color: #ffffff;
            padding: 35px 40px;
            border-radius: 18px;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.25);
            width: 360px;
            animation: fadeIn 0.7s ease-in-out;
            position: relative;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-form h2 {
            text-align: center;
            color: #185a9d;
            margin-bottom: 25px;
        }

        .login-form input[type="email"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            transition: 0.3s;
            font-size: 15px;
        }

        .login-form input:focus {
            border-color: #43cea2;
            box-shadow: 0 0 6px rgba(67, 206, 162, 0.5);
            outline: none;
        }

        .login-form input[type="submit"] {
            width: 100%;
            padding: 13px;
            background-color: #185a9d;
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 15px;
        }

        .login-form input[type="submit"]:hover {
            background-color: #43cea2;
        }

        .login-form .links {
            text-align: center;
            margin-top: 20px;
        }

        .login-form .links a {
            color: #185a9d;
            text-decoration: none;
            margin: 0 10px;
            font-weight: bold;
            transition: color 0.3s;
        }

        .login-form .links a:hover {
            color: #43cea2;
        }

        .message {
            margin-top: 20px;
            padding: 12px;
            background-color: #ffe6e6;
            color: #d8000c;
            border: 1px solid #d8000c;
            border-radius: 8px;
            font-weight: bold;
            text-align: center;
            animation: fadeIn 0.5s ease-in-out;
        }
    </style>
</head>
<body>

    <div>
        <form action="login" method="post" class="login-form">
            <h2>User Login</h2>
            <input type="hidden" name="action" value="login" />
            <input type="email" name="email" placeholder="Email Address" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Login" />

            <div class="links">
                <a href="signUp.jsp">Sign Up</a> | 
                <a href="forgotpassword.jsp">Forgot Password?</a>
            </div>

            <% String r = request.getParameter("msg");
               if("invalid".equals(r)) { %>
               <div class="message">Invalid email or password.</div>
            <% } %>
        </form>
    </div>

</body>
</html>
