<%@ page import="com.lxisoft.internsassist.Internsassist" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Leaderboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Leaderboard</h2>
        <% List<Internsassist> internsassists = (ArrayList<Internsassist>) request.getAttribute("internsassist"); %>
        <table>
            <tr>
                <th>Rank</th>
                <th>Name</th>
                <th>Points</th>
            </tr>
            <% 
                for (int i = 0; i < internsassists.size(); i++) {
                    Internsassist internsassist = internsassists.get(i);
            %>
            <tr>
                <td><%= i + 1 %></td>
                <td><%= internsassist.getName() %></td>
                <td><%= internsassist.getPoints() %></td>
            </tr>

            <% 
                }
            %>
        </table>
    </div>
</body>
</html>