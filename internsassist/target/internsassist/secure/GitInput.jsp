<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gamification Form</title>
    <style>
        body {
            font-family: 'Press Start 2P', cursive; /* Add a fun font for a gaming vibe */
            background-color: #1a1a1a; /* Dark background color */
            color: #fff; /* Light text color */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
       
        .form-container {
            background-image: url("gitinput.jpeg");
            background-size: cover;
            max-width: 600px;
            padding: 280px;
            background-color: #333; /* Darker form background */
            border-radius: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }
        h3 {
            color: #ffcc00; /* Yellow heading color */
            margin-bottom: 10px;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #555; /* Darker border color */
            border-radius: 5px;
            box-sizing: border-box;
            background-color: #444; /* Darker input background */
            color: #fff; /* Light input text color */
        }
        input[type="submit"] {
            background-color: #ffcc00; /* Yellow submit button */
            color: #333; /* Dark button text color */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #ffdd33; /* Lighter yellow on hover */
        }
    </style>
</head>
<body>
    <div class="form-container">
        <form action="git" method="post">
            <h3>Enter your GitUser Name</h3>
            <input type="text" name="name">
            <h3>Enter your registerd mail id</h3>
            <input type="text" name="mail_id">
            <h3>Enter your Git-Push Hash_Link</h3>
            <input type="text" name="hashLink">
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
