<%@ page import ="java.util.*" %>
<%@ page import="com.lxisoft.internsassist.Internsassist" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Assigned Projects</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        .container {
            width: 80%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #4CAF50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 15px;
            text-align: left;
            transition: background-color 0.3s;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .progress-bar {
            height: 25px;
            border-radius: 5px;
            background-color: #ddd;
            overflow: hidden;
            margin-top: 10px;
        }
        .progress {
            height: 100%;
            background-color: #4CAF50;
            width: 0;
            transition: width 1s;
        }
        .progress.completed {
            width: 100%;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const progressBar = document.querySelector('.progress');
            setTimeout(() => {
                progressBar.classList.add('completed');
            }, 500);
        });
    </script>
</head>
<body>
    <div class="container">
        <h2>Projects assigned to ${username}</h2>
        <% List<Internsassist> listt = (ArrayList<Internsassist>) request.getAttribute("in"); %>
        <table>
            <tr>
                <th>Sl_No</th>
                <th>Project Name</th>
            </tr>
            <% for (Internsassist li : listt) { %>
            <tr>
                <td><%= li.getSl_no() %></td>
                <td><%= li.getProjectName() %></td>
            </tr> 
                </tr>
                <%}%>
          
    </table>
</body>
</html>
