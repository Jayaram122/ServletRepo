<%@page import="com.lxisoft.internsassist.*"%>
<%@page import="java.util.*"%>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Intern Details</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Coiny&display=swap');
    
    body {
      font-family: 'Coiny', cursive;
      margin: 0;
      padding: 0;
      background-color: rgb(31, 111, 45);
      color: #333;
    }
    .container {
      max-width: 90%;
      margin: 20px auto;
      padding: 20px;
      background-color: rgba(0, 0, 0, 0.8);
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    h1 {
      text-align: center;
      margin-bottom: 20px;
      color: #fff;
    }
    .intern-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }
    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #1b5e20; /* Dark Green */
      color: white;
    }
    tr:nth-child(even) {
      background-color: #c8e6c9; /* Light Green */
    }
    tr:nth-child(odd) {
      background-color: #e8f5e9; /* Very Light Green */
    }
    .dropdown {
      position: relative;
      display: inline-block;
    }
    .dropdown-content {
      display: none;
      position: absolute;
      background-color: #4CAF50;
      min-width: 150px;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
      z-index: 1;
      border-radius: 4px;
    }
    .dropdown-content a {
      color: white;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
      font-size: 14px;
    }
    .dropdown-content a:hover {
      background-color: #3e8e41;
    }
    .dropdown:hover .dropdown-content {
      display: block;
    }
    .dropdown:hover .dropbtn {
      background-color: #3e8e41;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Interns Details</h1>
    <%
      List<Internsassist> interns = (List<Internsassist>) request.getAttribute("interns");
    %>
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Current Role</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <% for (Internsassist intern : interns) { %>
        <tr>
          <td><%= intern.getName() %></td>
          <td><%= intern.getMail_id() != null ? intern.getMail_id() : "N/A" %></td>
          <td><%= intern.getPhone() != null ? intern.getPhone() : "N/A" %></td>
          <td><%= intern.getRole_name() != null ? intern.getRole_name() : "N/A" %></td>
          <td>
            <div class="dropdown">
              <button class="dropbtn">Options</button>
              <div class="dropdown-content">
                <a href="InternDetails?name=<%= intern.getName() %>">View <%= intern.getName() %></a>
                <a href="assignRoles.jsp?name=<%= intern.getName() %>&action=assign">Assign Role</a>
                <a href="assignRoles.jsp?name=<%= intern.getName() %>&action=change">Change Role</a>
                <a href="roles?name=<%= intern.getName() %>&action=remove">Remove Role</a>
            </div>                       
            </div>
          </td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>
</body>
</html>
