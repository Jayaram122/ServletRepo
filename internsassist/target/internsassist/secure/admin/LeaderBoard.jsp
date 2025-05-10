<%@ page import="com.lxisoft.internsassist.Internsassist" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Leaderboard</title>
    <style>
        body {
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background-color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
        }

        .container {
            width: 80%;
            max-width: 800px;
            padding: 20px;
            background: linear-gradient(135deg, #6b6b6b, #2c2c2c);
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h2 {
            font-size: 2.5em;
            text-shadow: 2px 2px #000;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #555;
            color: #fff;
        }

        th {
            background-color: #4CAF50;
            font-size: 1.2em;
            text-shadow: 1px 1px #000;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transition: background-color 0.3s ease;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        @keyframes glow {
            0% { box-shadow: 0 0 5px #4CAF50; }
            50% { box-shadow: 0 0 20px #4CAF50; }
            100% { box-shadow: 0 0 5px #4CAF50; }
        }

        table {
            animation: glow 1.5s infinite alternate;
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
                <td><a href="secure/admin/addpoints.jsp?name=<%=internsassist.getName()%>"><%= internsassist.getName() %></a></td>
              
                <td><%= internsassist.getPoints() %>  </td>
        
            </tr>

            <% 
                }
            %>
        </table>
    </div>
</body>
</html>