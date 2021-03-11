
<%-- 
    Document   : viewcart
    Created on : Mar 11, 2021, 4:59:41 PM
    Author     : Baby Bear
--%>

<%@page import="Entities.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <th>ID</th>
                    <th>Name</th>
                    <th>Photo</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Sub Total</th>
                    <th>Option</th>
                </tr>

                <% ArrayList<CartItem> ldt = new ArrayList<>();
                    ldt = (ArrayList<CartItem>) session.getAttribute("cart");
                    double total = 0;
                    if (ldt != null) {
                        for (CartItem dt : ldt) {
                            total = total + (Integer.parseInt(dt.getProduct().getPrice()) * dt.getQuantity());%>
                <tr>
                    <td><%=dt.getProduct().getProductID()%></td>
                    <td><%=dt.getProduct().getProductName()%></td>
                    <td><img src="images/<%=dt.getProduct().getImageURL()%>" width="100"></td>
                    <td><%=dt.getProduct().getPrice()%></td>
                    <td><%=dt.getQuantity()%></td>
                    <td><%=(Integer.parseInt(dt.getProduct().getPrice()) * dt.getQuantity())%></td>
                    <td align="center">
                        <a href="CartServlet?action=remove&id=<%=dt.getProduct().getProductID()%>"
                           onclick="return confirm('Are you sure?')">Remove</a>
                    </td>
                </tr>
                <%}
                } else {
                %>
                <tr>
                    <th colspan="7" align="left"><br>Your cart is empty</th>
                </tr>
                <%}%>
                <tr>
                    <td colspan="6" align="right">Total</td>
                    
                </tr>
            </table>
        </section>
                <footer><br><br><a href="ProductServlet">View Product List</a></footer>
    </body>
</html>