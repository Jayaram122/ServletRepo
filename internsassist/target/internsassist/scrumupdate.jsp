<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.security.Principal" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daily Scrum Update</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            background-color: #333;
            color: #fff;
        }
        .container {
            background-color: #666666;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
            margin: auto;
            overflow: auto;
        }
        h2 {
            font-size: 24px;
            color: #fff;
            margin-bottom: 20px;
        }
        h3 {
            font-size: 20px;
            color:  #4d944d;
            margin-bottom: 10px;
        }
        select, input[type="date"], input[type="text"], textarea, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            background-color: #444; /* Darker input background */
            color: #fff; /* Light input text color */
        }
        button {
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 18px;
        }
        button:hover {
            background-color: #218838;
        }
        .instruction {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            line-height: 1.6;
            color: #333;
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
    <div class="container">
        <h2>Daily Scrum Update</h2>
        <div class="instruction">
            <p><strong>Interns are required to update their daily work status before 5:00 PM, accompanied by relevant screenshots of Git commit logs and/or share Git push link.</strong></p>
            <p><strong>Updates should be provided even if work is ongoing, along with a note indicating ongoing tasks.</strong></p>
            <p><strong>Screenshots should be uploaded upon completion of the day's work to ensure transparency and accountability.</strong></p>
        </div>
        <form action="dailyScrumUpdate" method="post" onsubmit="showAlert('Update Submitted Successfully.')" enctype="multipart/form-data">

            <h3>Name:</h3>
            <% Principal user = request.getUserPrincipal();
            String name = user.getName(); %>
            <input type="text" name="name" id="name" value="<%= name %>" readonly>

            <h3>Date:</h3>
            <input type="date" name="date" id="date" required>
            <h3>Team:</h3>
            <select id="team" name="team">
                <option>TEAM A1PHA</option>
                <option>TEAM BET2</option>
                <option>TEAM G3MMA</option>
                <option>TEAM DELT4</option>
            </select>

            <h3>Today's Tasks:</h3>
            <input type="text" id="tasks" name="tasks" placeholder="Project name, Number of tasks" required>

            <h3>Tasks Status:</h3>
            <label><input type="radio" name="taskStatus" value="Completed" required> Completed</label>
            <label><input type="radio" name="taskStatus" value="Not Completed" required> Not Completed</label>

            <h3>Paste your Git push link here:</h3>
            <input type="text" id="gitLink" name="gitLink" required>

            <h3>Reason why it's not completed (if applicable):</h3>
            <textarea id="notCompletedReason" name="notCompletedReason" rows="4"></textarea>

            <h3>Upload Relevant Screenshot:</h3>
            <input type="file" id="screenshot" name="screenshot" accept="image/*">

            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>