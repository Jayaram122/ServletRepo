<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Point Add Message</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        text-align: center;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    h1 {
        color: #333333;
        margin-bottom: 20px;
    }

    audio {
        display: none; /* Hide the audio element visually */
    }

    /* Custom button style */
    .btn {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007bff;
        color: #ffffff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .btn:hover {
        background-color: #0056b3;
    }
    audio {
        position: fixed;
        right: 10px;
        bottom: 10px;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Point Added Succesfully</h1>
        <p>Click the button to add points</p>
        <audio controls autoplay loop >
            <source src="system-notification-199277.mp3" type="audio/mp3">
        </audio>
        <a href="../../leaderBoardd" class="btn" onclick="playNotification()">Add Points</a>
    </div>

    <script>
        function playNotification() {
            var audio = document.getElementById('notification');
            audio.play();
        }
    </script>
</body>
</html>
