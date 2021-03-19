<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Category</title>
    </head>
    <body>
        <h1>Add new category information</h1>
        <form action="createNewCategory" method="POST" name="f1">
            <table>
                <tr>
                    <td>Category ID</td>
                    <td>: <input type="text" name="txtID" value="${param.txtID}">
                        <font color="red">${requestScope.INVALID.idError}</font></td>
                </tr>
                <tr>
                    <td>Category Name</td>
                    <td>: <input type="text" name="txtName" value="${param.txtName}">
                        <font color="red">${requestScope.INVALID.nameError}</font></td>
                </tr>
                <tr>
                    <td>Category Description</td>
                    <td>: <input type="text" name="txtDescription" value="${param.txtDescription}">
                        <font color="red">${requestScope.INVALID.descriptionError}</font></td>
                </tr>

                <tr>
                    <td colspan="2"> <input type="submit" value="Create"/></td>
                </tr>

            </table>
        </form>
        <br> <br>

        <a href="mainAdminPage">Back to Product List</a>
    </body>
</html>
