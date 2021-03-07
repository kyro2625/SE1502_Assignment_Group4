<%-- 
    Document   : mainUserPage
    Created on : Mar 7, 2021, 10:11:58 PM
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
            <a href="logout">Logout</a>
        </div>    
    </body>
</html>
