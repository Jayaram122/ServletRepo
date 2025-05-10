<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome to My Website</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #000;
      color: transparent; /* Set text color to transparent */
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .text-animation {
      font-size: 2rem;
      position: relative;
      overflow: hidden;
      background-image: linear-gradient(to right, violet, green, white); /* Gradient background */
      -webkit-background-clip: text; /* Clip text to the background gradient */
      background-clip: text;
    }
    .text-animation::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: #000;
      animation: reveal-text 2s linear infinite; /* Adjust duration and animation type as needed */
    }
    @keyframes reveal-text {
      0% {
        width: 100%;
      }
      25% {
        width: 0;
      }
      100% {
        width: 0;
      }
    }
  </style>
</head>
<body>
  <div class="text-animation">All your events in one timeline</div>
  <script>
      // JavaScript to redirect to the next page after a delay
      setTimeout(function() {
        window.location.href = "auth.jsp"; // Replace "next_page.html" with the URL of your next page
      }, 2000); // Change the delay (in milliseconds) as needed
    </script>
</body>
</html>
