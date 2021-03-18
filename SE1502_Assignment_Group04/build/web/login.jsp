<%-- 
    Document   : login
    Created on : Mar 11, 2021, 11:52:31 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login for managing laptop</h1>
        
        <font color="red"> ${requestScope.ERRORNOTLOGIN}</font>
        <font color="red"> ${requestScope.ERROR}</font>
        <form action="login" method="POST">
            <table>
                <tr>
                    <td>Username</td>
                    <td>: <input type="text" name="txtUsername" value="${param.txtUsername}"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>: <input type="password" name="txtPassword" value="${param.txtPassword}"/></td>
                </tr>
                <tr>
                    <td colspan="2"> <input type="submit" value="Login"></td>
                </tr>
            </table>
        </form>
                
                <hr> <hr>
    </body>
</html>
