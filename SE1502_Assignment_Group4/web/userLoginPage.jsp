<%--
    Document   : userLoginPage
    Created on : Mar 7, 2021, 9:49:36 PM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
            .loginbtn {
                background-color: #4CAF50;
                color: white;
                padding: 16px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
                opacity: 0.9;
            }

            .loginbtn:hover {
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
    <body style="background-color: wheat">
        <br>  <br> <br> <br> <br> <br> <br>  <br> <br> <br> <br> <br>


        <form action="UserLoginServlet" method="POST" name="f1">
            <div class="container">
                <h1>Login</h1>
                <strong style="color: red">${message}</strong>

                <hr>

                <label for="username"><b>User ID</b></label>
                <input type="text" placeholder="Enter User ID" name="userID" id="userID" required>

                <label for="password"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" id="password" required>


                <button type="submit" class="loginbtn">Login</button>
            </div>

            <div class="container signin">
                <p>Don't have an account? <a href="UserServlet?action=registerUser">Create one here</a>.</p>
            </div>
        </form>

    </body>
</html>