<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Check Answer</title>
</head>
<body>
    <%-- JSP code to check the answer --%>
    <%
        // Retrieve the answer from the form submission
        String userAnswer = request.getParameter("answer");

        // Check if the answer is correct
        if (userAnswer != null && userAnswer.equalsIgnoreCase("James Gosling")) {
            // If the answer is correct, redirect to SignUp.jsp
            response.sendRedirect("SignUp.jsp");
        }
        else {
            // If the answer is incorrect, display an error message
            out.println("<p>Incorrect answer. Please try again.</p>");
        }
    %>
</body>
</html>
