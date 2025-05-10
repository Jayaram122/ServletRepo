<%@ page session="true" %>
<%@ page import="java.security.Principal" %>

<!DOCTYPE html>
<html>
<head>
  <title>Hi</title>

  <style>
   
    .content-area {
    float: right;
    width: 20px;  /* Adjust width as needed */
    }

#content{

  position: relative;
  right:150px;
  bottom: 190px;
}

  </style>

</head>

<body style="background-color: #333333; color: #f5f5f5;">

  <% Principal principal = request.getUserPrincipal();
     String username = (principal != null) ? principal.getName() : "Guest"; %>

  <h1 style="text-align: center; margin-top: 200px;">Hi <%= username %> &#128075</h1>
</body>
</html>

