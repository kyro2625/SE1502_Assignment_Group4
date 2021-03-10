<%@page import="Entities.User"%>


<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%-- --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>

        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/style.css">

    </head>
    <body style="backgroud-color:#19aa8d">
        <%
            User u = (User) request.getAttribute("pObject");
            String headerMsg = (String) request.getAttribute("msg");
            String action = (String) request.getAttribute("action");
            String welcomePage = "userLoginPage.jsp";
        %>

        <div class="main">

            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign Up</h2>
                            <% if (request.getParameter("error") != null) {%>
                            <h5 class="form-title" style="color: red">This User ID has already existed please use it to login or try a different User ID</h5>
                            <%}%>

                            <form action="UserServlet?action=<%=action%>" method="POST" name="f1" class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="userID"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="userID" id="name" placeholder="User ID" required/>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="pass" placeholder="Password" required/>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="text" name="userName" id="name" placeholder="Your Name" required/>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Your Email" required/>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="text" name="address" id="name" placeholder="Your Address"/>
                                </div>

                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                            <a href="UserServlet?action=rollback" class="signup-image-link"><strong>Already have an account? Login here</strong></a>
                        </div>
                    </div>
                </div>
            </section>



            <!-- JS -->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="js/main.js"></script>
    </body>
</html>
