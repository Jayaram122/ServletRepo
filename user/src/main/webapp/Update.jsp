<%@ page import="com.demo.online.EmployeeDto" %>
<%
    EmployeeDto user = (EmployeeDto) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
</head>
<body>
    <h2>Update User</h2>
    <form action="UpdateServlet" method="post">
        <input type="hidden" name="id" value="<%= user.getId() %>"/>
        Name: <input type="text" name="name" value="<%= user.getName() %>"/><br/>
        Password: <input type="text" name="password" value="<%= user.getPassword() %>"/><br/>
        Email: <input type="email" name="email" value="<%= user.getEmail() %>"/><br/>
        Country: <input type="text" name="country" value="<%= user.getCountry() %>"/><br/>
        <input type="submit" value="Update"/>
    </form>
</body>
</html>
