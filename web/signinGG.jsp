<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Google Login</title>
        <link rel="stylesheet" href="CSS/footer.css">
        <!-- Load Google's platform library -->
        <script src="https://accounts.google.com/gsi/client" async defer></script>
    </head>
    <body>
        <div class="container">
            <h1>Login with Google</h1>
            <!-- Google Sign-In Button -->
            <div id="g_id_onload"
                 data-client_id="YOUR_GOOGLE_CLIENT_ID"
                 data-login_uri="http://localhost:8080/yourwebapp/googleLogin"
                 data-auto_prompt="false">
            </div>
            <div class="g_id_signin"
                 data-type="standard"
                 data-shape="rectangular"
                 data-theme="outline"
                 data-text="sign_in_with"
                 data-size="large"
                 data-logo_alignment="left">
            </div>
        </div>
        
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
