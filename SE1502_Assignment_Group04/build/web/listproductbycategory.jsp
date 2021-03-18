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
        <h1> Category ${requestScope.Category}</h1>


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
                            <th></th>
                                <c:if test="${sessionScope.role=='admin'}">
                                <th></th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listProducts}" var="dto">
                        <form action="loadProductByCategory" method="POST">
                            <tr>
                                <td>${dto.id}</td>
                                <td>${dto.name}</td>
                                <td>${dto.brand}</td>
                                <td>${dto.description}</td>
                                <td>${dto.status}</td>
                                <td>${dto.price}</td>
                                <c:if test="${sessionScope.role=='admin'}">
                                    <c:url value="loadProductByID" var="updateLink">
                                        <c:param name="id" value="${dto.id}"/>
                                    </c:url>
                                    <td><a href="${updateLink}">Update</a> </td>
                                    <c:url value="deleteProduct" var="deleteLink">
                                        <c:param name="id" value="${dto.id}"/>
                                    </c:url>
                                    <td><a onclick="return confirmation()" href="${deleteLink}">Delete</a> </td>
                                </c:if>
                                <c:if test="${sessionScope.role=='user'}">
                                    <c:url value="cart" var="buyLink">
                                        <c:param name="action" value="buy"/>
                                    </c:url>
                                    <td><a href="${buyLink}&id=${dto.id}">Buy</a> </td>
                                </c:if>

                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${!testEmpty}">
            <c:if test="${sessionScope.role=='admin'}">
                <h3>   <h2>No Product here. Create new one below here</h2> </h3>
            </c:if>

        </c:if>
    </c:if>
    <c:if test="${sessionScope.role=='admin'}">
        <h3>   <a href="addNewProduct">Create new product</a> </h3>
    </c:if>

    <br> <br>

    <c:if test="${sessionScope.role=='user'}">
        <c:url value="Cart" var="CartLink" />
        <h3> <a href="${CartLink}">View Shopping Cart</a> </h3>
        <a href="mainUserPage">Back to Product List</a>
    </c:if>
    <c:if test="${sessionScope.role=='admin'}">
        <a href="mainAdminPage">Back to Managing Page</a>
    </c:if>
    <script>
        function confirmation() {
            var r = confirm("Are you sure you want to delete this?");
            return r;
        }
    </script>
</body>
</html>
