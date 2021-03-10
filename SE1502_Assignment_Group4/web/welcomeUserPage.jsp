<%--
    Document   : welcomeUserPage
    Created on : Mar 7, 2021, 11:37:01 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="5;URL=./UserServlet?action=mainPage">
        <title>JSP Page</title>
    </head>
    <body>
        <%
//allow access only if session exists
            String user = (String) session.getAttribute("names");
            String userName = null;
            String sessionID = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("names")) {
                        userName = cookie.getValue();
                    }
                    if (cookie.getName().equals("JSESSIONID")) {
                        sessionID = cookie.getValue();
                    }
                }
            }
        %>
        <h3>Hi <%=userName%>, Login successful. Your Session ID=<%=sessionID%></h3>
        <br>
        User=<%=user%>
        <div style="text-align: center">
            <h1>Welcome to User Panel</h1>
            <b>Hello ${names}</b>

            <br><br>
            <h3>
                Redirecting to main page after <span id="countdown">5</span> seconds
            </h3>
            <!-- JavaScript part -->
            <script type="text/javascript">

                // Total seconds to wait
                var seconds = 5;
                var redirect = "/SE1502_Assignment_Group4/UserServlet?action=mainPage"
                function countdown() {
                    seconds = seconds - 1;
                    if (seconds < 0) {
                        // Chnage your redirection link here
                        window.location.href = redirect;
                    } else {
                        // Update remaining seconds
                        document.getElementById("countdown").innerHTML = seconds;
                        // Count down using javascript
                        window.setTimeout("countdown()", 1000);
                    }
                }

                // Run countdown function
                countdown();

            </script>
            <a href="UserServlet?action=mainPage">View main page</a>
        </div>
    </body>
</html>
