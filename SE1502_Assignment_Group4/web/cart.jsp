<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <style type="text/css">
            .img{
                text-align: center;
                border: 1px solid green;
                padding: 5px;
                margin: 5px;
                height: 250px;
                width: 200px;
                float: left;
            }
            footer{
                clear: both;
                height: 120px;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <section>
            <table cellpadding="0" cellspacing="0" border="1" align="center" width="75">
                <tr>
                    <th>Option</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Photo</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Sub Total</th>
                    <c:set var="total" value="0"></c:set>
                    <c:forEach var="item" items="${sessionScope.cart}">
                        <c:set var="total" value="${total + item.product.Price * item.quantity }"></c:set>
                        <tr>
                            <td align="center">
                                <a href="${pageContext.request.contextPath}/CartServlet?action=remove&id=${item.product.id}"
                               onclick="return confirm('Are you sure?')">Remove</a>
                            </td>
                            <td>${item.product.id }</td>
                            <td>${item.product.name }</td>
                            <td><img src="${pageContext.request.contextPath}images/${item.product.photo }" width="120"></td>
                            <td>${item.product.price }</td>
                            <td>${item.quantity }</td>
                            <td>${item.product.price * item.quantity }</td>
                        </tr>   
                    </c:forEach>
                <tr>
                    <td colspan="6" align="right">Total</td>
                    <td>${total}</td>
                </tr>
            </table>
        </section>
        <footer><br><br><a href="ProductServlet">View Product List</a></footer>
    </body>
</html>