<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Attendance Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #333333; /* Dark grey background */
    }

    .attendance {
        background-color: #4d4d4d; /* Dark grey container background */
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        width: 80%; /* Set width to 80% of viewport */
        max-width: 400px; /* Maximum width for better readability */
    }

    .attendance h3 {
        text-align: center;
        margin-bottom: 20px;
    }

    .attendance input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        background-color: #6abf69; /* Light green button */
        color: #fff;
        border: none;
        cursor: pointer;
    }

    .attendance input[type="submit"]:hover {
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
    <div class="attendance">
       <form action="attendanceServlet" method="post" onsubmit="showAlert('Thank you for confirming your attendance!')">
           <h3>Are you present today?</h3>

           <input type="hidden" name="attendance" value="present">
           <input type="submit" name="present" value="Yes">
       </form>

       <form action="attendanceServlet" method="post" onsubmit="showAlert('Thank you for confirming your absence!')">
           <input type="hidden" name="attendance" value="absent">
           <input type="submit" name="absent" value="No">
       </form>

       <div style="text-align: center; margin-top: 20px;">
           <a href="attendanceHistoryServlet" style="color:white;">Show My History</a>

       </div>
    </div>
</body>
</html>
