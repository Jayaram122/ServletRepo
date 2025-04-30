<%@ page import="com.demo.online.EmployeeDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <style>
        table {
            width: 70%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #f2f2f2;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">User List</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>Country</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<EmployeeDto> list = (ArrayList<EmployeeDto>) request.getAttribute("list");
            if (list != null && !list.isEmpty()) {
                for (EmployeeDto con : list) {
        %>
            <tr>
                <td><%= con.getId() %></td>
                <td><%= con.getName() %></td>
                <td><%= con.getPassword() %></td>
                <td><%= con.getEmail() %></td>
                <td><%= con.getCountry() %></td>
				<td><a href="UpdateServlet?id=<%= con.getId() %>">Update</a></td>
				<td><a href="DeleteServlet?id=<%= con.getId() %>">Delete</a></td>

            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5">No contacts found</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</body>
</html>
