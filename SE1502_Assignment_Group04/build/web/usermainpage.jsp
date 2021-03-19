<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main User Page</title>
    </head>
    <body>
        <p style="display: inline-block">Welcome, ${sessionScope.Welcome} ||</p>
        <c:url value="logout" var="logoutLink" />
        <a href="${logoutLink}">Logout</a>
        <c:url value="Cart" var="CartLink" />
        <h3 style="display: inline-block; float: right"> <a href="${CartLink}">View Shopping Cart</a> </h3>
        <br> <br> <hr>
        <div style="text-align: center">

            <form action="searchProduct" method="POST">
                <input type="text" placeholder="Search product name..." name="search">
                <button type="submit">Search</button>
            </form>
        </div>
        <h1 style="text-align: center">SPORTS BALL SHOPPING</h1>
        <h2 style="color: blue">${requestScope.PaySuccess}</h2>
        <hr>
        <div style="font-weight: bold; font-size: 120%">View Product by Category</div>

        <c:if test="${requestScope.listCategories!=null}">
            <c:if test="${not empty requestScope.listCategories}" var="testEmpty">
                <table border="1">
                    <thead>
                        <tr>
                            <th>CATEGORY NAME</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listCategories}" var="dto1">
                        <form action="loadProductByCategory" method="POST">
                            <tr>
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
    <br>
    <button onclick="hideAndView()"><h3>Click to view all products</h3></button>
    <div id="showProduct" style="display: none">
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
    </div>
    <hr>    <hr>

    <button onclick="hideAndViewOrder()"><h3>Click to view all order</h3></button>
    <div id="showOrder" style="display: none">
        <c:if test="${requestScope.listOrders!=null}">
            <c:if test="${not empty requestScope.listOrders}" var="testEmpty">
                <table border="1">
                    <thead>
                        <tr>
                            <th>ORDER DATE</th>
                            <th>ORDER ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listOrders}" var="dto3">
                        <form action="" method="POST">
                            <tr>
                                <td>${dto3.date}</td>
                                <c:url value="loadOrderDetailByOrderID" var="loadOrderDetailByOrderIDLink">
                                    <c:param name="id" value="${dto3.id}"/>
                                </c:url>
                                <td><a href="${loadOrderDetailByOrderIDLink}">${dto3.id}</a> </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${!testEmpty}">
                <h2>No Order to view. Buy something to show here</h2>
            </c:if>
        </c:if>
    </div>
    <br> <br>

    <script>
        function confirmation() {
            var r = confirm("Are you sure you want to delete this?");
            return r;
        }
        function hideAndView() {
            var x = document.getElementById("showProduct");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
        function hideAndViewOrder() {
            var x = document.getElementById("showOrder");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    </script>


</body>
</html>
