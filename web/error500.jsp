<%-- 
    Document   : error404.jsp
    Created on : Nov 9, 2024, 2:08:55 AM
    Author     : phand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Edit Amenity</title><!--  page only for manager  -->
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <link
            rel="icon"
            href="img/logo/favicon.png"
            type="image/x-icon"
            />
        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {families: ["Public Sans:300,400,500,600,700"]},
                custom: {
                    families: [
                        "Font Awesome 5 Solid",
                        "Font Awesome 5 Regular",
                        "Font Awesome 5 Brands",
                        "simple-line-icons",
                    ],
                    urls: ["assets/css/fonts.min.css"],
                },
                active: function () {
                    sessionStorage.fonts = true;
                },
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
        <style>
            .content{
                display: flex;
                width: fit-content;
                justify-content: center;
                text-align: center;
                border: 1px solid grey;
                margin-left: 38%;
                border-radius: 16px;
                box-shadow: 1px 1px 1px grey;
            }
        </style>
    </head>
    <body>
        <div class="logo" style="display: flex; justify-content: center">
            <img src="img/logo/logo.png" width="200px"/>
        </div>
        <div class="content">
            <div class="card-header" style="width: 400px">
                <h1>500</h1>
                <h2>Internal Server Error</h2>
                <a role="button" class="btn btn-back-home" href="/SWP391/">Back To Home</a>
            </div>
        </div>
    </body>
</html>
