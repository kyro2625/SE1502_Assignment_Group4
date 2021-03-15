
<%-- 
    Document   : index
    Created on : Mar 11, 2021, 4:50:13 PM
    Author     : Baby Bear
--%>

<%@page import="java.util.ArrayList"%>

<%@page import="Entities.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <style type="text/css">
            .img{
                text-align: center;
                border: 1px solid green;
                padding: 5px;
                margin: 5px;
                height: 150px;
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
        <img src="images/fpt_logo.jpg" alt="FPT logo" width="100" height="100"/>

        <header>
             <select name="brand"> 
                <%ArrayList<Product> ldt = new ArrayList<Product>();
                    ldt = (ArrayList<Product>) request.getAttribute("products");
                    for (Product dt : ldt) {
                %>

                <option value="<%=dt.getProductBrand()%>"><%=dt.getProductBrand()%></option>

                <%}%>
            </select>
        </header>
            <br>
        <section>
            <%
                ldt = (ArrayList<Product>) request.getAttribute("products");
                for (Product dt : ldt) {
            %>
            <div class="img">
                <%=dt.getProductID()%> - <%=dt.getProductName()%><br>
                <img src="${pageContext.request.contextPath}/images/<%=dt.getImageURL()%>" width="120"><br>
                Price: <%=dt.getPrice()%><br>
                <a href="CartServlet?action=buy&id=<%=dt.getProductID()%>">Buy</a>
            </div>
            <%}%>
        </section>
       
        
        <footer><br><br><a href="CartServlet">View Shopping Cart</a></footer>
       
    </body>
</html>