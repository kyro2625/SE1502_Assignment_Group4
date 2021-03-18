<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
    </head>
    <body>
        <h1>Update user information</h1>

        <form action="UpdateUser" method="POST" name="f1">
            <table>
                <tr>
                    <td>User ID</td>
                    <td>: ${user.userID}
                        <input type="text" name="userID" value="${user.userID}" hidden>
                        <font color="red">${requestScope.INVALID.idError}</font></td>
                </tr>
                <tr>
                    <td>User Password</td>
                    <td>: <input type="password" name="password" value="${user.password}">
                        <font color="red">${requestScope.INVALID.passwordError}</font></td>
                </tr>
                <tr>
                    <td>User Name</td>
                    <td>: <input type="text" name="userName" value="${user.fullname}">
                        <font color="red">${requestScope.INVALID.nameError}</font></td>
                </tr>
                <tr>
                    <td>User Email</td>
                    <td>: <input type="email" name="email" value="${user.email}">
                        <font color="red">${requestScope.INVALID.emailError}</font></td>
                </tr>
                <tr>
                    <td>User Address</td>
                    <td>: <input type="text" name="address" value="${user.address}">
                        <font color="red">${requestScope.INVALID.addressError}</font></td>
                </tr>


            </table>
            <button type="submit" class="registerbtn">Register</button>
        </div>
    </form>   
    <a href="mainAdminPage">Back to Admin Page</a>

</body>
</html>
