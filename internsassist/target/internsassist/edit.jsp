
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Profile</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: rgb(31, 111, 45);
      color: #333;
    }
    header {
      background-color: #4caf50; /* Green header */
      color: white;
      padding: 10px 0;
      text-align: center;
    }
    .container {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      background-color: #ffffff; /* White container background */
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    h1 {
      text-align: center;
      margin-bottom: 20px;
      color: #4caf50; /* Green heading */
    }
    form {
      display: flex;
      flex-direction: column;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-group label {
      font-weight: bold;
    }
    .form-group input {
      width: 100%;
      padding: 10px;
      border-radius: 5px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }
    .form-group input[type="submit"] {
      background-color: #4caf50; /* Green button */
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .form-group input[type="submit"]:hover {
      background-color: #2e8b57; /* Dark green hover color */
    }
    .file-upload {
      position: relative;
      overflow: hidden;
      margin-top: 8px;
    }
    .file-upload input[type='file'] {
      position: absolute;
      left: 0;
      top: 0;
      opacity: 0;
      cursor: pointer;
      height: 100%;
      width: 100%;
      z-index: 1;
    }
    .file-upload-button {
      width: 100%;
      background-color: #4caf50; /* Green button */
      color: white;
      padding: 10px 20px;
      border-radius: 5px;
      border: none;
      cursor: pointer;
      text-align: center;
      z-index: 0;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Edit your profile</h1>
    <form action="Upload" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter your name" >
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" >
      </div>
      <div class="form-group">
        <label for="image">Phone:</label>
        <input type="tel" id="phone" name="phone" placeholder="Enter your phone number">
      </div>
      <div class="form-group">
        <label for="photo">Photo:</label>
            <input type="file" name="image"  placeholder="Upload your Photo ">
      </div>
      <div class="form-group">
        <input type="submit" value="Update Profile">
      </div>
    </form>
  </div>
</body>
</html>
