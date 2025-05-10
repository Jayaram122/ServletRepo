<%@page import="com.lxisoft.internassist.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Intern Details</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: rgb(31, 111, 45);
      color: #333;
    }
    header {
      background-color: #1b5e20;
      color: white;
      padding: 10px 0;
      text-align: center;
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
      color: #1b5e20;
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
      background-color: #1b5e20;
      color: white;
    }
    tr:nth-child(even) {
      background-color: #e8f5e9;
    }
    tr:nth-child(odd) {
      background-color: #f4f4f4;
    }
    tr:hover {
      background-color: #c8e6c9;
    }
    .dropdown {
      position: relative;
      display: inline-block;
      margin-bottom: 20px;
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
    footer {
      background-color: #1b5e20;
      color: white;
      text-align: center;
      padding: 10px 0;
      position: fixed;
      width: 100%;
      bottom: 0;
    }
    @media (max-width: 768px) {
      table, th, td {
        display: block;
        width: 100%;
      }
      th, td {
        text-align: right;
        padding-left: 50%;
        position: relative;
      }
      th::before, td::before {
        content: attr(data-label);
        position: absolute;
        left: 0;
        padding-left: 15px;
        font-weight: bold;
        text-align: left;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Intern Details</h1>
    <%
      List<Internsassist> interns = (List<Internsassist>) request.getAttribute("intern");
      if (interns != null && !interns.isEmpty()) {
    %>
    <table>
      <thead>
        <tr>
            <th>photo</th>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Point</th>
        </tr>
      </thead>
      <tbody>
        <%
          for (Internsassist intern : interns) {
        %>
        <tr>
            <td data-label="photo">
                <% 
                byte[] photoBytes = intern.getPhoto();
                if (photoBytes != null && photoBytes.length > 0) {
                    String base64EncodedPhoto = Base64.getEncoder().encodeToString(photoBytes);
                %>
                    <img src="data:image/jpeg;base64, <%= base64EncodedPhoto %>" />
                <% } else { %>
                    No photo available
                <% } %>
            </td>
          <td data-label="Name"><%= intern.getUserName() %></td>
          <td data-label="Email"><%= intern.getMail_id() %></td>
          <td data-label="Phone"><%= intern.getPhone() != null ? intern.getPhone() : "N/A" %></td>
          <td data-label="Points"><%= intern.getPoints() > 0 ? intern.getPoints() : "N/A" %></td>
        
        </tr>
        <%
          }
        %>
      </tbody>
    </table>
    <%
      } else {
    %>
    <p>No intern details available.</p>
    <%
      }
    %>
  </div>
</body>
</html>