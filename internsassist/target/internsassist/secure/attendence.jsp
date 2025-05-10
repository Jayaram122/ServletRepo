<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gaming Calendar Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #000;
    }

    .calendar {
        background-color: #222;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    .calendar h3 {
        text-align: center;
        margin-bottom: 20px;
        color: #fff;
    }

    .calendar input[type="text"],
    .calendar input[type="submit"],
    .calendar input[type="date"] {
        display: block;
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        background-color: #444;
        color: #fff;
    }

    .calendar input[type="submit"] {
        background-color: #4CAF50;
        color: #fff;
        border: none;
        cursor: pointer;
        font-weight: bold;
    }

    .calendar input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    <div class="calendar">
        <form action="/internsassist/attendence" method="post">
            <h3>🎮 Enter the Player's Email</h3>       
            <input type="text" name="mail_id" placeholder="Email" required>
            <h3>🕹️ Enter the Attendance</h3>   
            <input type="text" name="pre" placeholder="Attendance" required>
            <h3>📅 Enter the Date</h3>   
            <input type="date" name="date" required>
            <br>
            <input type="submit" name="submit" value="Submit">
        </form>
    </div>
</body>
</html>
