<%@ page import="com.lxisoft.internsassist.Internsassist" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Leaderboard</title>
    <style>
        body {
            font-family: "Times New Roman", Times, serif; /* Change the font-family here */
            margin: 0;
            padding: 0;
            background-color: #049a3b;
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
        h2 {
            text-align: center;
            font-size: 30px;
            color: #0c940c; 
            margin-bottom: 25px;
            border-bottom: 4px double #011201; 
            padding-bottom: 10px;
            font-family: "Georgia", serif; 
            font-style: normal; 
            font-weight: bold; 
            text-transform: uppercase;
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
            String[] rankEmojis = {"&#129351;", "&#129352;", "&#129353;"};
                for (int i = 0; i < internsassists.size(); i++) {
                    Internsassist internsassist = internsassists.get(i);
            %>
            <tr>
                <td><%= i < rankEmojis.length ? rankEmojis[i] : (i + 1) %></td>
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