<%-- 
    Document   : dashboard
    Created on : Sep 21, 2024, 7:57:19 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Dashboard for receptionist</title>
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

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <!--<link rel="stylesheet" href="assets/css/demo.css" />-->
    </head>
    <body>
        <div class="wrapper">
            <c:if test="${sessionScope.user.role == 2}">
                <!-- Sidebar -->
                <jsp:include page="sidebarReceptionist.jsp"/>
            </c:if>
            <c:if test="${sessionScope.user.role == 1}">
                <!-- Sidebar -->
                <jsp:include page="sidebarManager.jsp"/>
            </c:if>
            <!-- End Sidebar -->

            <div class="main-panel">
                <div class="main-header">
                    <div class="main-header-logo">
                        <!-- Logo Header -->
                        <div class="logo-header" data-background-color="dark">
                            <a href="receptionDashboard" class="logo">
                                <img
                                    src="img/logo/logoAdmin.png"
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


                <div class="container" style="display: flex; justify-content: center; ">
                    <div class="card" style="width: 100%; max-width: 700px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); border-radius: 12px; padding: 20px">
                        <h2 style="text-align: center; margin-top: 20px; color: #333; font-weight: 600;">Employee Profile</h2> 


                        <table style="width: 100%; border-collapse: separate; border-spacing: 0 12px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                            <c:set value="${requestScope.employee}" var="e"/>

                            <tr>
                                <th style="text-align: left; color: #555; font-weight: 600; padding: 10px; background-color: #f5f5f5; border-radius: 8px 0 0 8px;">Name</th>
                                <td style="text-align: right; padding: 10px; background-color: #fafafa; border-radius: 0 8px 8px 0;">${e.name}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left; color: #555; font-weight: 600; padding: 10px; background-color: #f5f5f5; border-radius: 8px 0 0 8px;">Date of Birth</th>
                                <td style="text-align: right; padding: 10px; background-color: #fafafa; border-radius: 0 8px 8px 0;">${e.dateOfBirth}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left; color: #555; font-weight: 600; padding: 10px; background-color: #f5f5f5; border-radius: 8px 0 0 8px;">Sex</th>
                                <td style="text-align: right; padding: 10px; background-color: #fafafa; border-radius: 0 8px 8px 0;">${(s.sex == 1?
                                                                                                                                       '<img src="assets/img/male-icon.png" alt="male-image"/>':
                                                                                                                                       '<img src="assets/img/female-icon.png" alt="female-image"/>')}</td> 

                            <tr>
                                <th style="text-align: left; color: #555; font-weight: 600; padding: 10px; background-color: #f5f5f5; border-radius: 8px 0 0 8px;">Address</th>
                                <td style="text-align: right; padding: 10px; background-color: #fafafa; border-radius: 0 8px 8px 0;">${e.address}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left; color: #555; font-weight: 600; padding: 10px; background-color: #f5f5f5; border-radius: 8px 0 0 8px;">Phone</th>
                                <td style="text-align: right; padding: 10px; background-color: #fafafa; border-radius: 0 8px 8px 0;">${e.phone}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left; color: #555; font-weight: 600; padding: 10px; background-color: #f5f5f5; border-radius: 8px 0 0 8px;">Identification</th>
                                <td style="text-align: right; padding: 10px; background-color: #fafafa; border-radius: 0 8px 8px 0;">${e.identification}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left; color: #555; font-weight: 600; padding: 10px; background-color: #f5f5f5; border-radius: 8px 0 0 8px;">Start Date</th>
                                <td style="text-align: right; padding: 10px; background-color: #fafafa; border-radius: 0 8px 8px 0;">${e.startDate}</td>
                            </tr>
                            <tr>
                                <th style="text-align: left; color: #555; font-weight: 600; padding: 10px; background-color: #f5f5f5; border-radius: 8px 0 0 8px;">Salary</th>
                                <td style="text-align: right; padding: 10px; background-color: #fafafa; border-radius: 0 8px 8px 0;">${e.salary}</td>
                            </tr>
                        </table> 

                        <a href="updateProfileUser?userId=${requestScope.e.UserID}">Update Profile</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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

<!-- Kaiadmin JS -->
<script src="assets/js/kaiadmin.min.js"></script>

<!-- Kaiadmin DEMO methods, don't include it in your project! -->
<script src="assets/js/setting-demo.js"></script>
<script src="assets/js/demo.js"></script>
<script>
            $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
                type: "line",
                height: "70",
                width: "100%",
                lineWidth: "2",
                lineColor: "#177dff",
                fillColor: "rgba(23, 125, 255, 0.14)",
            });

            $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
                type: "line",
                height: "70",
                width: "100%",
                lineWidth: "2",
                lineColor: "#f3545d",
                fillColor: "rgba(243, 84, 93, .14)",
            });

            $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
                type: "line",
                height: "70",
                width: "100%",
                lineWidth: "2",
                lineColor: "#ffa534",
                fillColor: "rgba(255, 165, 52, .14)",
            });
</script>
</body>
</html>

