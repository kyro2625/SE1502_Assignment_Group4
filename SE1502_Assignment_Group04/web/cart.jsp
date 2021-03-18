<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <style type="text/css">
            footer{
                clear: both;
                height: 120px;
                align-items: center;
            }
            td {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1 style="text-align: center">Order Detail</h1>
        <section>
            <table cellpadding="0" cellspacing="0" border="1" align="center" width="100%">
                <tr>
                    <th>Option</th>
                    <th>PRODUCT ID</th>
                    <th>PRODUCT NAME</th>
                    <th>PRODUCT BRAND</th>
                    <th>PRODUCT PRICE</th>
                    <th>QUANTITY</th>
                    <th>Sub Total</th>
                        <c:set var="total" value="0"></c:set>
                        <c:forEach var="item" items="${sessionScope.cart}">
                            <c:set var="total" value="${total + item.product.price * item.quantity }"></c:set>
                        <tr>
                            <td align="center">
                                <a href="${pageContext.request.contextPath}/Cart?action=remove&id=${item.product.id}"
                               onclick="return confirm('Are you sure?')">Remove</a>
                        </td>
                        <td>${item.product.id }</td>
                        <td>${item.product.name }</td>
                        <td>${item.product.brand }</td>

                        <td>${item.product.price }</td>
                        <td>${item.quantity }</td>
                        <td>${item.product.price * item.quantity }</td>
                    </tr>   
                </c:forEach>
                <tr>
                    <td colspan="6" align="right" style="font-weight: bold; font-size: 120%; text-align: right">Total</td>
                    <td>${total}</td>
                </tr>
            </table>
                <a href="CheckOut">Check Out</a>
        </section>
        <footer><br><br><a href="MainUserPage">View Product List</a></footer>
    </body>
</html>