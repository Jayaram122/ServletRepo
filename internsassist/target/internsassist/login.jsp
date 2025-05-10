<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login into IntersAssist</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #333333; /* Dark grey background */
            color: #ffffff; /* White text */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 400px; /* Equal size to the signup page */
            padding: 20px;
            background-color: #6abf69; /* Light green */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative; /* To position the language switch */
        }

        .input-container {
            position: relative;
            margin-bottom: 20px;
        }

        .input-container i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #ffffff;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 15px 20px 15px 40px; /* Adjusted padding */
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            background-color: #4d4d4d; /* Dark grey input background */
            color: #ffffff; /* White text */
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4d4d4d; /* Dark grey button */
            color: #ffffff; /* White text */
            padding: 15px 20px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 100%; /* Full width */
        }

        input[type="submit"]:hover {
            background-color: #333333; /* Darker grey on hover */
        }

        .forgot-password a {
            color: #ffffff; /* White text */
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        .language-switch {
            position: absolute;
            top: 10px;
            right: 20px;
        }

        .language-dropdown {
            background-color: transparent; /* No background color */
            border: none;
            color: #ffffff; /* White text */
            padding: 10px;
            border-radius: 8px;
            cursor: pointer;
        }

        .language-dropdown:hover {
            background-color: #333333; /* Darker grey on hover */
        }

        .language-options {
            display: none;
            position: absolute;
            top: 40px;
            right: 0;
            background-color: #4d4d4d; /* Dark grey dropdown background */
            border-radius: 8px;
            padding: 10px;
            z-index: 1;
        }

        .language-options a {
            display: block;
            color: #ffffff; /* White text */
            text-decoration: none;
            padding: 5px 0;
        }

        .language-options a:hover {
            background-color: #333333; /* Darker grey on hover */
        }

        .fas {
            margin-right: 5px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script>
        function toggleLanguageOptions() {
            var options = document.getElementById('languageOptions');
            if (options.style.display === 'none' || options.style.display === '') {
                options.style.display = 'block';
            } else {
                options.style.display = 'none';
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <c:choose>
            <c:when test="${empty language}">
                <h2>Sign In</h2>
                <form action="j_security_check" method="post">
                    <div class="input-container">
                        <i class="fas fa-user"></i>
                        <input type="text" id="j_username" name="j_username" placeholder="Username">
                    </div>
                    <div class="input-container">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="j_password" name="j_password" placeholder="Password">
                    </div>
                    <input type="submit" value="Login">
                </form>
                <div class="forgot-password">
                    <a href="forgetPassword.jsp" style=" color:rgb(11, 122, 100)">Forgot Password?</a>
                    <span>Don't have an account? </span><a href="signup.jsp" style=" color:rgb(11, 122, 100)">Sign up</a>
                </div> 
             
            </c:when>

            <c:otherwise>
                <h2><c:out value="${language['login.button']}"/></h2>
                <form action="j_security_check" method="post">
                    <div class="input-container">
                        <i class="fas fa-user"></i>
                        <input type="text" id="j_username" name="j_username" placeholder="${language['username.label']}">
                    </div>
                    <div class="input-container">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="j_password" name="j_password" placeholder="${language['password.label']}">
                    </div>
                    <input type="submit" value="<c:out value='${language["login.button"]}'/>">
                </form>
                <div class="forgot-password">
                    <a href="forgetPassword.jsp" style=" color:rgb(11, 122, 100)"><c:out value="${language['forgotPassword.link']}"/></a>
                    <span >Don't have an account? </span><a href="signup.jsp" style=" color:rgb(11, 122, 100)">Sign up</a>
                </div>
                   
            </c:otherwise>
        </c:choose>
        <div class="language-switch">
            <button class="language-dropdown" onclick="toggleLanguageOptions()">
                <i class="fas fa-globe"></i> <!-- Font Awesome globe icon -->
                Language
            </button>
            <div class="language-options" id="languageOptions">
                <a href="LocaleServlet?lang=loginml">Malayalam</a>
                <a href="LocaleServlet?lang=loginen">English</a>
            </div>
        </div>
    </div>
</body>
</html>
