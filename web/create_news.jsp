
<%-- 
    Document   : notifications
    Created on : Sep 19, 2024, 9:35:39 AM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Notifications - Kaiadmin Bootstrap 5 Admin Dashboard</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <link
            rel="icon"
            href="assets/img/kaiadmin/favicon.ico"
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

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <!--        <link rel="stylesheet" href="assets/css/demo.css" />-->
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <jsp:include page="sidebarManager.jsp"/>
            <!-- End Sidebar -->

            <div class="main-panel">
                <div class="main-header">
                    <div class="main-header-logo">
                        <!-- Logo Header -->
                        <div class="logo-header" data-background-color="dark">
                            <a href="../index.jsp" class="logo">
                                <img
                                    src="assets/img/kaiadmin/logo_light.svg"
                                    alt="navbar brand"
                                    class="navbar-brand"
                                    height="20"
                                    />
                            </a>
                            <div class="nav-toggle">
                                <button class="btn btn-toggle toggle-sidebar">
                                    <i class="gg-menu-right"></i>
                                </button>
                                <button class="btn btn-toggle sidenav-toggler">
                                    <i class="gg-menu-left"></i>
                                </button>
                            </div>
                            <button class="topbar-toggler more">
                                <i class="gg-more-vertical-alt"></i>
                            </button>
                        </div>
                        <!-- End Logo Header -->
                    </div>
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Notifications</h3>

                        </div> 
                        <style>
                            body {
                                font-family: Arial, sans-serif;
                                background-color: #f4f4f9;
                                margin: 0;
                                padding: 0;
                            }

                            .container {
                                max-width: 600px;
                                margin: 50px auto;

                                padding: 20px;
                                border-radius: 10px;
                                box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
                            }

                            h1 {
                                text-align: center;
                                color: #333333;
                                margin-bottom: 20px;
                            }

                            label {
                                font-weight: bold;
                                color: #333;
                                display: block;
                                margin-bottom: 8px;
                            }

                            input[type="text"],
                            textarea,
                            input[type="datetime-local"],
                            input[type="number"],
                            input[type="checkbox"] {
                                width: 100%;
                                padding: 10px;
                                margin-bottom: 20px;
                                border: 1px solid #ccc;
                                border-radius: 5px;
                                box-sizing: border-box;
                                font-size: 16px;
                            }

                            input[type="text"]:focus,
                            textarea:focus,
                            input[type="datetime-local"]:focus,
                            input[type="number"]:focus {
                                border-color: #00aaff;
                                outline: none;
                                box-shadow: 0 0 5px rgba(0, 170, 255, 0.5);
                            }

                            textarea {
                                resize: vertical;
                            }

                            .btn {
                                display: inline-block;
                                background-color: #00aaff;
                                color: white;
                                padding: 10px 20px;
                                text-align: center;
                                border-radius: 5px;
                                text-decoration: none;
                                border: none;
                                font-size: 16px;
                                cursor: pointer;
                                width: 100%;
                            }

                            .btn:hover {
                                background-color: #008fcc;
                            }
                        </style>
                        </head>
                        <body>
                            <div class="container">
                                <h1>Create News</h1>
                                <form action="create-news" method="post">
                                    <label for="title">Title</label>
                                    <input type="text" id="title" name="title" placeholder="Enter the news title" required>

                                    <label for="content">Content</label>
                                    <textarea id="content" name="content" rows="10" placeholder="Enter the news content" required></textarea>

                                    <label for="category">Category</label>
                                    <input type="text" id="category" name="category" placeholder="Enter the news category">

                                    <!--<label for="userID">User ID</label>-->
                                    <input type="hidden" id="userID" name="userID" value="${sessionScope.user.userID}" >

                                   

                                    <label for="is_active">Is Active?</label>
                                    <input type="checkbox" id="is_active" name="is_active" checked>

                                    <button type="submit" class="btn">Create News</button>
                                </form>
                            </div>
                    </div>
                </div>
            </div>
<%
    // Kiểm tra session và role
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRole() != 1) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
            <!-- End Custom template -->

            <!--   Core JS Files   -->
            <script src="assets/js/core/jquery-3.7.1.min.js"></script>
            <script src="assets/js/core/popper.min.js"></script>
            <script src="assets/js/core/bootstrap.min.js"></script>

            <!-- jQuery Scrollbar -->
            <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

            <!-- Chart JS -->
            <script src="assets/js/plugin/chart.js/chart.min.js"></script>

            <!-- jQuery Sparkline -->
            <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

            <!-- Chart Circle -->
            <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

            <!-- Datatables -->
            <script src="assets/js/plugin/datatables/datatables.min.js"></script>

            <!-- jQuery Vector Maps -->
            <script src="assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
            <script src="assets/js/plugin/jsvectormap/world.js"></script>

            <!-- Kaiadmin JS -->
            <script src="assets/js/kaiadmin.min.js"></script>

            <!-- Kaiadmin DEMO methods, don't include it in your project! -->
            <script src="assets/js/setting-demo.js"></script>
            <script src="assets/js/demo.js"></script>

    </body>
</html>

