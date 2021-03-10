<%@page import="Entities.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>

        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/style.css">
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                background-color: menutext;
            }

            * {
                box-sizing: border-box;
            }

            /* Add padding to containers */
            .container {
                padding: 20px;
                background-color: white;
            }

            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

            /* Overwrite default styles of hr */
            hr {
                border: 1px solid #f1f1f1;
                margin-bottom: 25px;
            }

            /* Set a style for the submit button */
            .registerbtn {
                background-color: #4CAF50;
                color: white;
                padding: 16px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
                opacity: 0.9;
            }

            .registerbtn:hover {
                opacity: 1;
            }

            /* Add a blue text color to links */
            a {
                color: dodgerblue;
            }

            /* Set a grey background color and center the text of the "sign in" section */
            .signin {
                background-color: #f1f1f1;
                text-align: center;
            }
        </style>
    </head>
    <body style="background-color: gainsboro">
        <%
            User u = (User) request.getAttribute("pObject");
            String headerMsg = (String) request.getAttribute("msg");
            String action = (String) request.getAttribute("action");
            String welcomePage = "userLoginPage.jsp";
        %>
        <br>  <br> <br> <br> <br> <br>
        <form action="UserServlet?action=<%=action%>" method="POST" name="f1">
            <div class="container">
                <h1>Register an account</h1>
                <% if (request.getParameter("error") != null) {%>
                <h5 class="form-title" style="color: red">This User ID has already existed please use it to login or try a different User ID</h5>
                <%}%>
                <hr>

                <label for="userID"><b>User ID</b></label>
                <input type="text" placeholder="Enter User ID" name="userID" id="userID" required>

                <label for="password"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" id="password" required>

                <label for="userName"><b>User Name</b></label>
                <input type="text" placeholder="Enter User Name" name="userName" id="userName" required>


                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" id="email" >

                <label for="userAddress"><b>User Address</b></label>
                <input type="text" placeholder="Enter Your Address" name="address" id="address" >


                <button type="submit" class="registerbtn">Register</button>
            </div>

            <div class="container signin">
                <p>Already have an account? <a href="UserServlet?action=rollback">Login here</a>.</p>
            </div>
        </form>

    </body>
</html>
