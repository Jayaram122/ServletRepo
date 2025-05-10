<!DOCTYPE html>
<html>
<head>
    <title>Email Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #88c057; /* Cartoon green */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #88c057;
        }

        .container {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 5px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: calc(100% - 20px);
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to Our App</h2>
        <p>Please answer the question below to proceed:</p>
        <p>Who developed Java?</p>

        <form action="CheckAnswer.jsp" method="post">
            <input type="text" id="answer" name="answer" required>
            <br><br>
            <input type="submit" value="Submit Answer">
        </form>
    </div>
</body>
</html>
