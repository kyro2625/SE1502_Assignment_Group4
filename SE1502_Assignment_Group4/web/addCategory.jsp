<%@page import="Entities.Category"%>
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

            Category c = (Category) request.getAttribute("cObject");
            String headerMsg = (String) request.getAttribute("msg");
            String action = (String) request.getAttribute("action");
        %>

        <h2><%= headerMsg%> </h2>

        <table width="600px" border="0px solid">
            <form action="AddCategoryServlet?action=<%=action%>" method="POST" name="f1">
                <input type="hidden" name ="action" value="">
                <tr>
                    <td><label>Category ID:</label></td>
                    <td><input type="text" name="id" value="" class="w3-input" required/></td>
                </tr>
                <tr>
                    <td><label>Category Name:</label></td>
                    <td><input type="text" name="name" value="" class="w3-input" required/></td>
                </tr>

                <tr>
                    <td> <label>Description:</label></td>
                    <td><textarea name="description" class="w3-input"></textarea></td>
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
        
        <a href="UserServlet?action=mainPage" class="btn btn-primary"> Main Page </a>

    </body>
</html>
