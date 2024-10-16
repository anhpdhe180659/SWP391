<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="CSS/login.css">
    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-up">
                <form action="register" method="post">
                    <h1>Sign Up</h1>
                    <input type="text" placeholder="Username" name="username" required>
                    <input type="text" placeholder="Full Name" name="fullname" required>  
                    <input type="email" placeholder="Email" name="email" required>
                    <input type="text" placeholder="Phone Number" name="phone" required>
                    <input class="password" type="password" placeholder="Password" name="password" required>
                    <input class="cfpassword" type="password" placeholder="Confirm Password" name="cfPassword" required>
                    <button class="button" type="submit">Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in">
                <form action="login" method="post">
                    <h1>Login</h1>
                    <input type="text" placeholder="Username" name="username" value="${usernameC}" required>
                    <input type="password" placeholder="Password" value="${passwordC}" name="password" required>
                    <div class="remember">
                        <input type="checkbox" name="remember" style="width: 20px;">Remember me
                    </div>
                    <button type="submit">Login</button>
                    <a href="forgetpassword.jsp">Forgot Password ?</a>
                </form>
            </div>
            <div class="toggle-container">
                <div class="toggle">
                    <div class="toggle-panel toggle-left">
                        <h1>Hotel Management</h1>
                        <p>If you already have an account</p>
                        <button class="hidden" id="login">Login</button>
                    </div>
                    <div class="toggle-panel toggle-right">
                        <h1>Hotel Management</h1>
                        <p>If you already signed up with your email</p>
                        
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=profile email&redirect_uri=http://localhost:8080/SWP391/loginGoogle&response_type=code
		   &client_id=251851195797-be94bjjk1t71t8p8ed3ngr6o9dvsg9q5.apps.googleusercontent.com&approval_prompt=force"><button id="register" class="hidden">Login with Google</button></a>
                    </div>
                </div>
            </div>
        </div>
        <% if (request.getAttribute("error") != null) { %>
        <p style="color:red; margin-top: 20px "><%= request.getAttribute("error") %></p>
        <% } %>
        <% if (request.getAttribute("invalid") != null) { %>
        <p style="color:red; margin-top: 20px "><%= request.getAttribute("invalid") %></p>
        <% } %>
        <script>
            const container = document.getElementById('container');
            const registerBtn = document.getElementById('register');
            const loginBtn = document.getElementById('login');

            registerBtn.addEventListener('click', () => {
                container.classList.add("active");
            });

            loginBtn.addEventListener('click', () => {
                container.classList.remove("active");
            });
            document.querySelector('.button').onclick = function () {
                var password = document.querySelector('.password').value,
                        cfpassword = document.querySelector('.cfpassword').value;
                if (password === "") {
                    alert("Hãy điền đầy đủ vào khoảng trống.");
                } else if (password !== cfpassword) {
                    alert("Xác nhận mật khẩu không đúng");
                    return false;
                } else {
                    return true;
                }
            };
        </script>
        <script type="text/javascript">
            window.onload = function () {
                var successMessage = '<%= request.getAttribute("success") %>';
                if (successMessage !== "null") {
                    alert(successMessage);
                }
            };
        </script>
    </body>
</html>
