<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Task Levels</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #333333; /* Dark grey background */
        }

        .container {
            display: flex;
            position: relative;
            flex-direction: row; /* Change to row to align items horizontally */
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #333333; /* Dark grey background */
        }

        h2 {
            color: #6abf69; /* Light green heading color */
            margin-left: 10px;
            font-family: cursive;
            text-shadow: 2px 2px 2px #333333; /* Dark grey text shadow */
            position: absolute; /* Position h2 absolutely */
            top: 20px; /* Position it at the top */
        }

        .row {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 80px; /* Set equal width and height for circle */
            height: 80px; /* Set equal width and height for circle */
            box-shadow: 2px 3px 3px rgba(0, 0, 0, 0.5); /* Dark shadow */
            margin: 0 10px; /* Add horizontal margin */
            background-color: #6abf69; /* Light green color */
            border-radius: 50%; /* Make it circular */
            color: #fff;
            text-decoration: none;
            font-size: 14px; /* Adjust font size */
            text-align: center;
            line-height: 80px; /* Center text vertically */
            transition: margin 0.3s;
        }

        .row:nth-child(even) {
            background-color: #424242; /* Dark grey color for even rows */
        }

        .emoji {
            margin-right: 10; /* Remove margin to center the emoji */
        }

        .logout-form {
            position: absolute;
            bottom: 10px;
            left: 10px;
        }

        .submit-button {
            background-color: transparent; /* No background color */
            border: none;
            color: #6abf69; /* Light green font color */
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: underline;
        }

        .submit-button:hover {
            color: #5aad5d; /* Slightly darker green on hover */
        }

        .logout-icon {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>dash board</h2>

        <a href="dash" target="f2" class="row">
            <span class="emoji">&#128200; project</span>
        </a>

        <a href="row" target="f2" class="row">
            <span class="emoji">&#128200; feedback</span>
        </a>

        <a href="summary.jsp" target="f2" class="row">
            <span class="emoji">&#128200;summary</span>
        </a>

        <a href="meeting.jsp" target="f2" class="row">
            <span class="emoji">&#128200;meet</span>
        </a>

         <a href="leave.jsp" target="f2" class="row">
            <span class="emoji">&#128200;leave</span>
         </a>

        <!-- <a href="rules.jsp" target="f2" class="row">
            <span class="emoji">&#128200;rules</span>
         </a> -->
    </div>
</body>
</html>
