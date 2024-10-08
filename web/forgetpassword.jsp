<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot password</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="CSS/login.css">
    </head>
    <body>

        <div class="container" id="container">
            <div class="" style="margin-top: 100px">
                <form action="forgotpassword" method="post">
                    <h1>Forgot password</h1>
                    <input type="text" placeholder="Input your email!" name="email" required>
                    <button type="submit">Send</button>
                    <c:if test="${not empty error}">
                        <div style="color: red; margin-top: 10px;">
                            <strong>${error}</strong>
                        </div>
                    </c:if>
                    <a href="login">Back to login!</a>
                </form>
            </div>
        </div>
        <script>
        </script>
    </body>
</html>
