
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gamification Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #333333; /* Dark grey background */
            color: #f2f2f2; /* Light grey text */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            max-width: 600px;
            padding: 50px;
            background-color: #4d4d4d; /* Dark grey form background */
            border-radius: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }
        h3 {
            color: #6abf69; /* Light green heading color */
            margin-bottom: 10px;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #666666; /* Darker border color */
            border-radius: 5px;
            box-sizing: border-box;
            background-color: #555555; /* Darker input background */
            color: #ffffff; /* Light input text color */
        }
        input[type="submit"] {
            background-color: #6abf69; /* Light green submit button */
            color: #ffffff; /* White button text color */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #4d944d; /* Darker green on hover */
        }
    </style>
      <script>
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <div class="form-container">
        <form action="git" method="post"  onsubmit="showAlert('Thank you for comforming your GitPush')">
            <h3>Enter your Git-Push Hash_Link</h3>
            <input type="text" name="hashLink">
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>