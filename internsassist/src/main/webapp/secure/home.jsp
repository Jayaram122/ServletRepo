<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-image: url('page.png'); /* Set background image */
      background-size: cover; /* Cover the entire viewport */
      background-position: center; /* Center the background */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .icon {
      width: 110px; /* Adjust icon size as needed */
      height: auto; /* Maintain aspect ratio */
      position:relative;

    }
    .icon2{
position: relative;
left: 220px;
width:110px;
height:110px


    }


  </style>
</head>
<body>
  <% boolean isAdmin = (boolean) request.getAttribute("isAdmin");

  if(isAdmin){%>
      <a href="leaderBoard" target="f2" class="row">
          <span>&#x1F4C5;leaderboard</span> 
 <% }
  %>
<div>

  <img style="width:100px; position:relative;right:250px; box-shadow:3px 3px 3px 3px; border-radius:12px;" class="icon3" src="calendar.png" alt="Github Icon">
</div>
<a href="GitInput.jsp">
  <img style="box-shadow:3px 3px 3px 3px; border-radius:12px;"  class="icon" src="github.png" alt="Github Icon">
  <div>
  </a>
    <a href="leaderBoard">
  <img  style="box-shadow:3px 3px 3px 3px; border-radius:12px;" class="icon2" src="leaderboard.png" alt="Leaderboard Icon">
</a>
  </div>

<section>
</section>
</body>
</html>