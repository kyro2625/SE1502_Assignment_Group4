<%-- 
    Document   : searchresult
    Created on : Mar 19, 2021, 10:34:00 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result</title>
    </head>
    <body>
        <p style="display: inline-block">Welcome, ${sessionScope.Welcome} ||</p>
        <c:url value="logout" var="logoutLink" />
        <a href="${logoutLink}">Logout</a>
        <c:url value="Cart" var="CartLink" />
        <h3 style="display: inline-block; float: right"> <a href="${CartLink}">View Shopping Cart</a> </h3>
        <br> <br> <hr>
        <h1> Search result for ${requestScope.keyword}</h1>

        <c:if test="${requestScope.foundResults!=null}">
            <c:if test="${not empty requestScope.foundResults}" var="testEmpty">
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
                        <c:forEach items="${requestScope.foundResults}" var="dto">
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
            <c:if test="${sessionScope.role=='user'}">
                <h3>   <h2>No Product Found. Try Again</h2> </h3>
            </c:if>
        </c:if>
    </c:if>
    <c:if test="${sessionScope.role=='admin'}">
        <h3>   <a href="addNewProduct">Create new product</a> </h3>
    </c:if>

    <br> <br>

    <c:if test="${sessionScope.role=='user'}">
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
