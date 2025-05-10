<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to the Game</title>
<style>
  body {
    font-family: 'Comic Sans MS', cursive, sans-serif;
    background-color: #88c057;
    margin: 0;
    padding: 0;
    color: #333;
  }
  .container {
    position: fixed;
    bottom: 20px;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column; /* Adjust to stack elements vertically */
  }
  .options {
    text-align: center;
    margin-top: 20px; /* Add some margin between logo and buttons */
  }
  .btn-container {
    width: 200px; /* Adjust the width as needed */
    margin: 10px;
    position : relative;
    bottom: 100px;
  }
  .logo2{
    position:relative;
    bottom:130px;
    animation: zoomInOut 2s infinite alternate;
  }
  @keyframes zoomInOut {
    0%{
      transform:scale(1);
    }
    100%{
      transform:scale(1.1);
    }
  }

  .btn {
    display: block;
    width: 100%;
    padding: 15px 30px;
    font-size: 18px;
    text-align: center;
    text-decoration: none;
    color: #88c057;
    background-color: white;
    border: none;
    border-radius: 10px; /* Rounded corners */
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
  }
  .btn:hover {
    background-color: #0091c1;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
  }
</style>
</head>
<body>
<div class="container">
  <img class="logo2" src="index2.png" alt="Your " width="150" height="150"> <!-- Adjust width and height as needed -->
  <div class="options">
    <div class="btn-container">
      <a href="Questions.jsp" class="btn">Get Started</a>
    </div>
    <div class="btn-container">
      <a href="User" class="btn">I already have an account</a>
    </div>
  </div>
</div>
</body>
</html>
