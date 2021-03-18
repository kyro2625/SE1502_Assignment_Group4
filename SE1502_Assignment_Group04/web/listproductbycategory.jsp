<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List By Category Page</title>
    </head>
    <body>
        <h1> Categorgy ${requestScope.Category}</h1>


        <c:if test="${requestScope.listProducts!=null}">
            <c:if test="${not empty requestScope.listProducts}" var="testEmpty">
                <table border="1">
                    <thead>
                        <tr>
                            <th>PRODUCT ID</th>
                            <th>PRODUCT NAME</th>
                            <th>PRODUCT BRAND</th>
                            <th>PRODUCT DESCRIPTION</th>
                            <th>PRODUCT STATUS</th>
                            <th>PRICE</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listProducts}" var="dto">
                        <form action="loadBySupplierName" method="POST">
                            <tr>
                                <td>${dto.id}</td>
                                <td>${dto.name}</td>
                                <td>${dto.brand}</td>
                                <td>${dto.description}</td>
                                <td>${dto.status}</td>
                                <td>${dto.price}</td>

                               <c:url value="cart" var="buyLink">
                                <c:param name="action" value="buy"/>
                            </c:url>

                            <td><a href="${buyLink}&id=${dto.id}">Buy</a> </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${!testEmpty}">
            <h2>No Product here. Create new one below here</h2>
        </c:if>
    </c:if>
    <h3> <a href="addNewProduct">Create new product</a> </h3>
    <br> <br>

    <a href="mainAdminPage">Back to Supplier List</a>
    <script>
        function confirmation() {
            var r = confirm("Are you sure you want to delete this?");
            return r;
        }
    </script>
</body>
</html>
