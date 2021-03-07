<%-- 
    Document   : welcomeUserPage
    Created on : Mar 7, 2021, 11:37:01 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <div style="text-align: center">
            <h1>Welcome to User Panel</h1>
            <b>${names}</b>

            <br><br>
            <a href="UserServlet?action=mainPage">View main page</a>
        </div>    
    </body>
</html>
