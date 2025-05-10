<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navigation</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: #333333; /* Dark grey background */
    }

    .container {
        display: flex;
        position: relative;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 95vh;
        background-color: #333333; /* Dark grey background */
    }

    h2 {
        color: #6abf69; /* Light green heading color */
        margin-left: 10px;
        font-family: cursive;
        text-shadow: 2px 2px 2px #333333; /* Dark grey text shadow */
    }

    .row {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 300px;
        height: 60px;
        box-shadow: 2px 3px 3px rgba(0, 0, 0, 0.5); /* Dark shadow */
        margin-bottom: 10px;
        background-color: #6abf69; /* Light green color */
        border-radius: 5px;
        color: #fff;
        text-decoration: none;
    }

    .row:nth-child(even) {
        background-color: #424242; /* Dark grey color for even rows */
    }

    .emoji {
        margin-right: 10px;
    }

    .logout-form {
        position: absolute;
        bottom: 10px;
        left: 10px;
    }

    .submit-button {
        background-color: transparent; /* No background color */
        border: none;
        color: #6abf69; /* Light green font color */
        padding: 10px 20px;
        cursor: pointer;
        font-size: 18px;
        text-decoration: underline;
    }
    .submit-buttonn
    {
        background-color: transparent; /* No background color */
        border: none;
        color: #969f96; /* Light green font color */
        padding: 10px 20px;
        cursor: pointer;
        font-size: 16px;
    

    }

    .submit-button:hover {
        color: #5aad5d; /* Slightly darker green on hover */
    }

    .logout-icon {
        margin-right: 10px;
    }
</style>
<script>
    function confirmLogout(event) {
        if (!confirm("Are you sure you want to logout?")) {
            event.preventDefault();
        }
    }
</script>
</head>
<body>

    <div class="container">
        <c:choose>
            <c:when test="${empty language}">
                <h2 id="h2">InternAssist</h2>
             
                <% 
                boolean isIntern = request.isUserInRole("intern");
                boolean isAdmin = request.isUserInRole("admin");
                boolean isGroupCoordinator = request.isUserInRole("gc");

                if (isAdmin) { %>
                    <a href="admin.jsp" target="f2" class="row">
                        <span class="emoji">&#128200;Project Assigning For Interns</span>
                    </a>

                    <a href="AllInternDetails" target="f2" class="row">
                        <span class="emoji">&#128200;Roles Assigning</span>
                    </a>                   

                    <a href="dashboaradmin.jsp" target="f2" class="row">
                        <span class="emoji">&#128200;Dashboard</span>
                    </a>

                    <a href="/internsassist/admin" target="f2" class="row">
                        <span>&#x1F4C5;Attendance</span>
                    </a>
                    <a href="/internsassist/gitAdmin" target="f2" class="row">
                        <span>&#128640;Git Pushes</span>
                    </a>
                    <a href="/internsassist/leaderBoardd" target="f2" class="row">
                        <span>&#127942;Rewards</span>
                    </a>
                <% } else if (isIntern) { %>

                    <a href="dashboardd.jsp" target="f2" class="row">
                        <span class="emoji">&#128200;Dashboard</span>
                    </a>
                    <a href="attendance.jsp" target="f2" class="row">
                        <span>&#x1F4C5;Attendance</span>
                    </a>
                    <a href="GitInput.jsp" target="f2" class="row">
                        <span>&#128640;Git Pushes</span>
                    </a>
                    <a href="leaderBoard" target="f2" class="row">
                        <span>&#127942;Rewards</span>
                    </a>
                <% } else { %>

                    <a href="dash" target="f2" class="row">
                        <span class="emoji">&#128200;Dashboard</span>
                    </a>
                    <a href="/internsassist/admin" target="f2" class="row">
                        <span>&#x1F4C5;Attendance</span>
                    </a>
                    <a href="/internsassist/gitAdmin" target="f2" class="row">
                        <span>&#128640;Git Pushes</span>
                    </a>
                    <a href="leaderBoard" target="f2" class="row">
                        <span>&#127942;Rewards</span>
                    </a>
                <% } %>

                <form action="logout" method="get" class="logout-form" onsubmit="confirmLogout(event)">
                    <span class="logout-icon">&#x1F512;</span> <!-- Lock emoji as logout icon -->
                    <input type="submit" value="Logout" class="submit-button">
                </form>
            </c:when>
            <c:otherwise>
                <h2 id="h2"><c:out value="${language['title']}"/></h2>
                
                <a href="InternshipRules.jsp" target="f2"  class="submit-buttonn">
                   **** Please refer to the Internship Rules and Regulations ****
                </a>
                <% 
                boolean isIntern = request.isUserInRole("intern");
                boolean isAdmin = request.isUserInRole("admin");
                boolean isGroupCoordinator = request.isUserInRole("gc");

                if (isAdmin) { %>
                    <a href="admin.jsp" target="f2" class="row">
                        <span class="emoji">&#128200;<c:out value="${language['dashboard']}"/></span>
                    </a>
                    <a href="/internsassist/admin" target="f2" class="row">
                        <span>&#x1F4C5;<c:out value="${language['attendance']}"/></span>
                    </a>
                    <a href="/internsassist/gitAdmin" target="f2" class="row">
                        <span>&#128640;<c:out value="${language['gitPushes']}"/></span>
                    </a>
                    <a href="/internsassist/leaderBoardd" target="f2" class="row">
                        <span>&#127942;<c:out value="${language['rewards']}"/></span>
                    </a>
                <% } else if (isIntern) { %>
                    <a href="dash" target="f2" class="row">
                        <span class="emoji">&#128200;<c:out value="${language['dashboard']}"/></span>
                    </a>
                    <a href="attendence.jsp" target="f2" class="row">
                        <span>&#x1F4C5;<c:out value="${language['attendance']}"/></span>
                    </a>
                    <a href="GitInput.jsp" target="f2" class="row">
                        <span>&#128640;<c:out value="${language['gitPushes']}"/></span>
                    </a>
                    <a href="leaderBoard" target="f2" class="row">
                        <span>&#127942;<c:out value="${language['rewards']}"/></span>
                    </a>
                <% } else { %>
                    <a href="dash" target="f2" class="row">
                        <span class="emoji">&#128200;<c:out value="${language['dashboard']}"/></span>
                    </a>
                    <a href="/internsassist/admin" target="f2" class="row">
                        <span>&#x1F4C5;<c:out value="${language['attendance']}"/></span>
                    </a>
                    <a href="/internsassist/gitAdmin" target="f2" class="row">
                        <span>&#128640;<c:out value="${language['gitPushes']}"/></span>
                    </a>
                    <a href="leaderBoard" target="f2" class="row">
                        <span>&#127942;<c:out value="${language['rewards']}"/></span>
                    </a>
                <% } %>
<form action="logout" method="get" class="logout-form" onsubmit="confirmLogout(event)">
    <span class="logout-icon">&#x1F512;</span> <!-- Lock emoji as logout icon -->
    <input type="submit" class="submit-button" value="<c:out value='${language["logout"]}'/>">
</form>

            </c:otherwise>
        </c:choose>
    </div>
    <a href="InternshipRules.jsp" target="f2" class="submit-buttonn">
        **** Please refer to the Internship Rules and Regulations ****
    </a>
</body>
</html>