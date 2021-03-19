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
        <h1>SYSTEM ADMIN Management</h1>
        <hr><br>
        <h2>User account management</h2>
        <c:url value="addNewUser" var="addNewUser" />
        <h3> <a href="${addNewUser}">Create new user</a> </h3>
        <c:if test="${requestScope.listUsers!=null}">
            <c:if test="${not empty requestScope.listUsers}" var="testEmpty">
                <table border="1">
                    <thead>
                        <tr>
                            <th>USER ID</th>
                            <th>USER PASSWORD</th>
                            <th>USER NAME</th>
                            <th>USER EMAIL</th>
                            <th>USER ADDRESS</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listUsers}" var="dto2">
                        <form action="loadProductByCategory" method="POST">
                            <tr>
                                <td>${dto2.userID}</td>
                                <td>${dto2.password}</td>
                                <td>${dto2.fullname}</td>
                                <td>${dto2.email}</td>
                                <td>${dto2.address}</td>
                                <c:url value="loadUserByID" var="updateLink">
                                    <c:param name="id" value="${dto2.userID}"/>
                                </c:url>
                                <td><a href="${updateLink}">Update</a> </td>

                                <c:url value="deleteUser" var="deleteLink">
                                    <c:param name="id" value="${dto2.userID}"/>
                                </c:url>
                                <td><a onclick="return confirmation()" href="${deleteLink}">Delete</a> </td>

                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${!testEmpty}">
            <h2>No User Account here. Add one below here</h2>
        </c:if>
    </c:if>
    <hr><br>
    <h2>Category management</h2>
    <c:url value="addNewCategory" var="addNewCategory" />
    <h3> <a href="${addNewCategory}">Create new Category</a> </h3>
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
                            <td><a href="${loadProductByCategoryLink}&action=controll">${dto1.name}</a> </td>
                            <td>${dto1.description}</td>

                            <c:url value="loadCategoryByID" var="updateLink">
                                <c:param name="id" value="${dto1.id}"/>
                            </c:url>
                            <td><a href="${updateLink}">Update</a> </td>

                            <c:url value="deleteCategory" var="deleteLink">
                                <c:param name="id" value="${dto1.id}"/>
                            </c:url>
                            <td><a onclick="return confirmation()" href="${deleteLink}">Delete</a> </td>

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
<hr><br>
<h2>Product management</h2>
<c:url value="addNewProduct" var="addNewProduct" />
<h3> <a href="${addNewProduct}">Create new product</a> </h3>
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

                        <c:url value="loadProductByID" var="updateLink">
                            <c:param name="id" value="${dto.id}"/>
                        </c:url>

                        <td><a href="${updateLink}">Update</a> </td>

                        <c:url value="deleteProduct" var="deleteLink">
                            <c:param name="id" value="${dto.id}"/>
                        </c:url>
                        <td><a onclick="return confirmation()" href="${deleteLink}">Delete</a> </td>
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




<script>
    function confirmation() {
        var r = confirm("Are you sure you want to delete this?");
        return r;
    }
</script>

</body>
</html>
