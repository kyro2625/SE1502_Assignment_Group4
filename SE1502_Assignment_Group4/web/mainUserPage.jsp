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
        <div>
            <img src="images/fpt_logo.jpg" alt="FPT logo" width="100" height="100"/>
            <img src="https://www.w3schools.com/images/lamp.jpg" alt="Lamp" width="32" height="32">

        </div>
        <div style="text-align: center">
            <h1>Welcome to User Panel</h1>
            <b>${names}</b>

            <br><br>

            <a href="AddCategoryServlet?action=createCategory">Add New Category</a>
            <br>
            <a href="ProductServlet">View Product</a>
            <br>
            <a href="AddProductServlet?action=createProduct">Add New Product</a>
            <img src="${pageContext.request.contextPath}/images/81630388_p0.jpg" alt="alt" height="50%" width="50%"/>
            <img src="images/IMG_20210227_133325.jpg" alt="alt" height="50%" width="50%"/>

        </div>
        <form action="UserLogoutServlet" method="POST">
            <input type="submit" value="Logout" >

        </form>
    </body>
</html>
