<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail Page</title>
    </head>
    <body>
        <h1> Order ID:  ${requestScope.orderId}</h1>


        <c:if test="${requestScope.listOrderDetails!=null}">
            <c:if test="${not empty requestScope.listOrderDetails}" var="testEmpty">
                <table border="1" style="text-align: center">
                    <thead>
                        <tr>
                            <th>PRODUCT ID</th>
                            <th>PRODUCT NAME</th>
                            <th>PRICE</th>
                            <th>QUANTITY</th>
                            <th>SUB TOTAL</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listOrderDetails}" var="list">
                        <form action="loadProductByCategory" method="POST">
                            <tr>
                                <td>${list.productID}</td>
                                <td>${list.productName}</td>
                                <td style="text-align: right">${list.price}</td>
                                <td>${list.quantity}</td>
                                <td style="text-align: right">${list.price*list.quantity}</td>
                                <c:set var="total" value="${total + list.price*list.quantity}" />

                            </tr>
                        </form>
                    </c:forEach>
                    <tr>
                        <td colspan="4" align="right" style="font-weight: bold; font-size: 120%; text-align: right">Total</td>
                        <td style="text-align: right; font-weight: bold; font-size: 120%"> ${total} </td>
                    </tr>
                </tbody>
            </table>
        </c:if>
        <c:if test="${!testEmpty}">
            <h2>No Product to View, Click below to return to Product List</h2>

        </c:if>
    </c:if>
    <c:if test="${sessionScope.role=='admin'}">
        <h3>   <a href="addNewProduct">Create new product</a> </h3>
    </c:if>

    <br> <br>
    <hr>
    <c:if test="${sessionScope.role=='user'}">
        <c:url value="Cart" var="CartLink" />
        <h3> <a href="${CartLink}">View Shopping Cart</a> </h3>
        <hr>
        <h2> <a href="mainUserPage">Back to Product List</a> </h2>
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
