<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gaming Look Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #0f0f0f; /* Dark background color */
            color: #fff; /* Text color */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        form {
            background-color: rgba(255, 255, 255, 0.1); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Soft shadow effect */
        }
        h3 {
            color: #00ff1a; /* Magenta text color */
            font-size: 24px;
            margin-bottom: 10px;
        }
        input[type="text"], input[type="submit"] {
            background-color: #1c1c1c; /* Dark input field background */
            color: #fff;
            border: 2px solid #0dff00; /* Magenta border */
            border-radius: 5px;
            padding: 8px 12px;
            margin-bottom: 15px;
        }
        input[type="submit"] {
            cursor: pointer;
            transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
        }
        input[type="submit"]:hover {
            background-color: #2bff00; /* Magenta hover color */
            color: #fff; /* Text color on hover */
        }
    </style>
</head>
<body>
    <form action="/internsassist/addPointServlet" method="post">
        
        <input type="hidden" name="name" value="<%= request.getParameter("name") %>">

        <h3>Enter Points  for <%= request.getParameter("name") %></h3>
        <input type="text" name="point">
        <br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
