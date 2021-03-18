<%--
    Document   : error
    Created on : Mar 13, 2021, 11:04:43 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h2> ${requestScope.ERROR}</h2>
        <button onclick="goBack()">Go back to previous page</button>

        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>
</html>
