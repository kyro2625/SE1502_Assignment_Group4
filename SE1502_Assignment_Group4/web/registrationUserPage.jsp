<%@page import="Entities.User"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/signUpStyle.css"/>

    </head>
    <body style="backgroud-color:#19aa8d">
        <%
            User u = (User) request.getAttribute("pObject");
            String headerMsg = (String) request.getAttribute("msg");
            String action = (String) request.getAttribute("action");
            String welcomePage = "userLoginPage.jsp";
        %>
      
        <% if (request.getParameter("error")!=null) {%>
        <h2>This User ID has already existed please use it to login or try a different User ID</h2>
        <%}%>
        
        <div class="signup-form">
            <form action="UserServlet?action=<%=action%>" method="POST" name="f1">
                <h2>Sign Up</h2>
                <p>Please fill in this form to create an account!</p>
                <hr>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fa fa-user"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" name="userID" placeholder="UserID" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fa fa-lock"></i>
                            </span>
                        </div>
                        <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="fa fa-address-book"></span>
                            </span>
                        </div>
                        <input type="text" class="form-control" name="userName" placeholder="UserName">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="fa fa-address-book"></span>
                            </span>
                        </div>
                        <input type="text" class="form-control" name="email" placeholder="Email">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="fa fa-address-book"></span>
                            </span>
                        </div>
                        <input type="text" class="form-control" name="address" placeholder="Address">
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
                </div>
            </form>

            <div class="text-center">Already have an account? <a href="UserServlet?action=rollback">Login here</a></div>
        </div>

    </body>
</html>
