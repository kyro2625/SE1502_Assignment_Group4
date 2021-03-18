<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Admin Page</title>
    </head>
    <body>
        <p style="display: inline-block">Welcome, ${sessionScope.Welcome} ||</p>
        <c:url value="logout" var="logoutLink" />
        <a href="${logoutLink}">Logout</a>
        <h1>Product Management</h1>
        <h3>${requestScope.PaySuccess}</h3>

        <c:if test="${requestScope.listCategories!=null}">
            <c:if test="${not empty requestScope.listCategories}" var="testEmpty">
                <table border="1">
                    <thead>
                        <tr>
                            <th>CATEGORY ID</th>
                            <th>CATEGORY NAME</th>
                            <th>CATEGORY DESCRIPTION</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listCategories}" var="dto1">
                        <form action="loadProductByCategory" method="POST">
                            <tr>
                                <td>${dto1.id}</td>
                                <c:url value="loadProductByCategory" var="loadProductByCategoryLink">
                                    <c:param name="id" value="${dto1.id}"/>
                                </c:url>
                                <td><a href="${loadProductByCategoryLink}">${dto1.name}</a> </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${!testEmpty}">
            <h2>No Category here. Add one below here</h2>
        </c:if>
    </c:if>
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
                        <th>CATEGORY NAME</th>

                        <th></th>
                        <th></th>
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
                            <td>${dto.category.name}</td>

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
<br> <br>
<c:url value="addNewProduct" var="addNewProduct" />
<h3> <a href="${addNewProduct}">Create new product</a> </h3>
<script>
    function confirmation() {
        var r = confirm("Are you sure you want to delete this?");
        return r;
    }
</script>

</body>
</html>
