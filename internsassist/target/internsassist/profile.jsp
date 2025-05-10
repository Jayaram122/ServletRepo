<%@page import="com.lxisoft.internsassist.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Base64"%>
<%@page import="java.security.Principal"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Profile</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: rgb(31, 111, 45);
      color: #333;
    }
    .container {
      max-width: 90%;
      margin: 20px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    h1 {
      text-align: center;
      margin-bottom: 20px;
      color: #4caf50; /* Green heading */
    }
    .profile-card {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      transition: transform 0.3s, box-shadow 0.3s;
      background-color: #fff; /* White profile card background */
    }
    .profile-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 12px rgba(0,0,0,0.2);
    }
    .profile-photo {
      flex: 0 0 150px;
      margin-right: 20px;
      border-radius: 50%;
      overflow: hidden;
    }
    .profile-photo img {
      width: 150px;
      height: 150px;
      object-fit: cover;
    }
    .profile-details {
      flex: 1;
    }
    .profile-details h2 {
      margin: 0;
      color: #4caf50; /* Green name */
      font-size: 24px;
    }
    .profile-details p {
      margin: 5px 0;
      color: #555;
      font-size: 18px; /* Adjust font size */
      line-height: 1.6; /* Adjust line height */
    }
    img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    .edit {
      text-align: center;
      padding: 10px;
    }
    .edit button {
      background-color: #4caf50; /* Green button */
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .edit button:hover {
      background-color: #d64b4d; /* Dark green hover color */
    }
    @media (max-width: 768px) {
      .profile-card {
        flex-direction: column;
        align-items: center;
      }
      .profile-photo {
        margin-bottom: 20px;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Edit your profile</h1>
    <%
      Principal principal = request.getUserPrincipal();
      String pname = principal.getName();
      Internsassist intern = (Internsassist) request.getAttribute("intern");
      String imageData;
     
          imageData = getImageData(intern.getInputstream());
    %>
    <div class="profile-card">
      <div class="profile-details">
        <h2><%= pname %></h2>
        <p><strong>Name   :</strong> <%= intern.getRealName() != null ? intern.getRealName() : " " %></p>
        <p><strong>Email  :</strong> <%= intern.getMail_id() != null ? intern.getMail_id() : "N/A" %></p>
        <p><strong>Phone  :</strong> <%= intern.getPhone() != null ? intern.getPhone() : "N/A" %></p>
        <p><strong>Points :</strong> <%= intern.getPoints() > 0 ? intern.getPoints() : "N/A" %></p>
        <p><strong>Role   :</strong> <%= intern.getRole_name() != null ? intern.getRole_name() : "N/A" %></p>
      </div>
      <div>
        <label>User Photo:</label>
        <span><img src="data:image/jpeg;base64,<%= imageData %>" alt="User Photo"></span>
      </div>
    </div>
  
    <div class="edit">
        <a href="edit.jsp"><button>Edit</button></a>
    </div>
  </div>

  <%
    // Define the getImageData method here
    %>
    <%! 
    String getImageData(InputStream inputStream) {
        try {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = outputStream.toByteArray();
            return Base64.getEncoder().encodeToString(imageBytes);
        } catch (Exception e) {
            e.printStackTrace();
            return ""; // Return empty string or handle error as needed
        }
    }
    %>
</body>
</html>
