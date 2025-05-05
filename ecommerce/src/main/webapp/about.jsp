<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            color: #2c3e50;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background-color: white;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            max-width: 700px;
            text-align: center;
        }

        .card h2 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #34495e;
        }

        .card p {
            font-size: 18px;
            line-height: 1.6;
            color: #555;
        }

        @media screen and (max-width: 768px) {
            .card {
                padding: 30px 20px;
            }

            .card h2 {
                font-size: 24px;
            }

            .card p {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>About Our Company</h2>
        <p>
            We are a modern e-commerce platform dedicated to providing a seamless shopping experience.
            From managing your orders to tracking products and getting in touch with support, everything is just a click away.
            Our mission is to deliver fast, secure, and reliable services for all your shopping needs.
        </p>
    </div>
</body>
</html>
