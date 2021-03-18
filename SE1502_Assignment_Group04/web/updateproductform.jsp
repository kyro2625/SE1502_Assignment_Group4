<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update product information</title>
    </head>
    <body>
        <h1>Update product information</h1>
        <form action="updateProduct" method="POST">
            <table>
                <tr>
                    <td>Product ID</td>
                    <td>: ${product.id}
                        <input type="text" name="txtID" value="${param.id}" hidden>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td>: <input type="text" name="txtName" value="${product.name}">
                        <font color="red">${requestScope.INVALID.nameError}</font></td>
                </tr>
                <tr>
                    <td>Product Brand</td>
                    <td>: <input type="text" name="txtBrand" value="${product.brand}">
                        <font color="red">${requestScope.INVALID.brandError}</font></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>: <input type="text" name="txtDescription" value="${product.description}">
                        <font color="red">${requestScope.INVALID.descriptionError}</font></td>
                </tr>
                <tr>
                    <td>Product Status</td>
                    <td>: <input type="text" name="txtStatus" value="${product.status}">
                        <font color="red">${requestScope.INVALID.statusError}</font></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>: <input type="number" name="txtPrice" value="${product.price}">
                        <font color="red">${requestScope.INVALID.priceError}</font></td>
                </tr>
                <tr>
                    <td>Category</td>
                    <td>: <select name="cboCategory">
                            <c:forEach items="${requestScope.listCategories}" var="dto">
                                <c:if test="${product.category.id == dto.id}">                             
                                    <option value="${dto.id} - ${dto.name}" selected="true"> ${dto.id} - ${dto.name}</option>
                                </c:if>
                                <option value="${dto.id} - ${dto.name}"> ${dto.id} - ${dto.name}</option>
                            </c:forEach>
                        </select>
                    </td>
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
