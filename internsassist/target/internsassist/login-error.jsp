<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #335546; /* Light grey background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333333; /* Dark grey text */
        }

        .container {
            text-align: center;
            padding: 20px;
            background-color: #ffffff; /* White background for the container */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        h1 {
            font-size: 2em; /* Adjusted font size */
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }

        .button {
            padding: 10px 20px;
            background-color: #4CAF50; /* Green button */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 1em; /* Adjusted font size for better readability */
        }

        .button:hover {
            background-color: #45a049; /* Darker green on hover */
        }

        img {
            margin-bottom: 20px; /* Space below the image */
            width: 200px; /* Adjusted width */
            height: 200px; /* Adjusted height */
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 1.5em; /* Responsive font size for smaller screens */
            }

            img {
                width: 150px; /* Adjusted width for smaller screens */
                height: 150px; /* Adjusted height for smaller screens */
            }
        }
    </style>
</head>

    <div class="container">
        <body><img src="ibrahim.jpg" alt="Error Icon">
        <h2>Login Error</h2>
        <p>Invalid username or password. Please try again.</p>
        <a href="index.html" class="button">Back to Home</a>
    </div>
</body>
</html>