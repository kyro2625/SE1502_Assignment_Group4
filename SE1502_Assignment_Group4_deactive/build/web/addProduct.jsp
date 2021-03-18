<%@page import="entities.Product"%>
<%@page import="entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Book Page</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            label {
                font-weight: bold;
                color: crimson;
            }
        </style>
    </head>
    <body>
        <%
            ArrayList<Category> c = new ArrayList<>();//Khời tạo
            c = (ArrayList<Category>) request.getAttribute("data2");

            Product p = (Product) request.getAttribute("pObject");
            String headerMsg = (String) request.getAttribute("msg");
            String action = (String) request.getAttribute("action");
        %>

        <h2><%= headerMsg%> </h2>

        <table width="600px" border="0px solid">
            <form action="AddProductServlet?action=<%=action%>" method="POST" name="f1" enctype="multipart/form-data">
                <input type="hidden" name ="action" value="">
                <tr>
                    <td><label>Product ID:</label></td>
                    <td><input type="text" name="id" value="" class="w3-input" required/></td>
                </tr>
                <tr>
                    <td><label> Product Name:</label></td>
                    <td><input type="text" name="name" value="" class="w3-input" required/></td>
                </tr>
                <tr>
                    <td><label>Product Brand</label></td>
                    <td><input type="text" name="brand" value="" class="w3-input"></td>
                </tr>

                <tr>
                    <td> <label>Description:</label></td>
                    <td><textarea name="description" class="w3-input"></textarea></td>
                </tr>

                <tr>
                    <td> <label>Status:</label></td>
                    <td>
                        <select name="status"  class="form-control">
                            <option value="">Choose Status</option>
                            <option value="Available">Available</option>
                            <option value="Not Available">Not Available</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>Product Price</label></td>
                    <td><input type="text" name="price" value="" class="w3-input"></td>
                </tr>

                <tr>
                    <td><label>Product Image</label></td>
                    <td><input type="file" name="photo" value="" class="w3-input" accept="image/*"></td>
                </tr>


                <tr>
                    <td> <label>Category ID:</label></td>
                    <td> <select name="categoryID" class="w3-input" selected="0">
                            <option value="" disabled selected>Choose Category ID</option>
                            <%for (Category dt : c) {%>
                            <option value="<%=dt.getCategoryID()%>"><%=dt.getCategoryID()%>: <%=dt.getCategoryName()%></option>
                            <%}%>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Submit" class="btn btn-success"/>
                        <input type="reset" value="Reset" class="btn btn-warning"/>
                    </td>
                </tr>

            </form>
        </table>
        <br> <br>
        <script>
            $(document).ready(function () {
                var d = new Date();
                var option = '<option value="0" disabled>Choose a year</option>';
                selectedYear = "Choose year";
                for (var i = 1930; i <= d.getFullYear(); i++) {// years start i
                    option += '<option value="' + i + '">' + i + '</option>';
                }
                $('#year').append(option);
                $('#year').val(selectedYear);
            });
        </script>
        <a href="UserServlet?action=mainPage" class="btn btn-primary"> List of product </a>

    </body>
</html>
