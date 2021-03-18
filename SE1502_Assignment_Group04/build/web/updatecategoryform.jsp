<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update product information</title>
    </head>
    <body>
        <h1>Update category information</h1>
        <form action="updateCategory" method="POST">
            <table>
                <tr>
                    <td>Category ID</td>
                    <td>: ${category.id}
                        <input type="text" name="txtID" value="${param.id}" hidden>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td>: <input type="text" name="txtName" value="${category.name}">
                        <font color="red">${requestScope.INVALID.nameError}</font></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>: <input type="text" name="txtDescription" value="${category.description}">
                        <font color="red">${requestScope.INVALID.descriptionError}</font></td>
                </tr>
                <tr>
                    <td> <input type="submit" value="Update"/></td>
                    <td> <input type="reset" value="Reset"/></td>

                </tr>

            </table>
        </form>
        <a href="mainAdminPage">Back to Admin Page</a>
    </body>
</html>
