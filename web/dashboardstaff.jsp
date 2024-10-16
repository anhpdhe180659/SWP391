<%-- 
    Document   : dashboardstaff
    Created on : Oct 12, 2024, 1:11:32 AM
    Author     : LENOVO
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
        <link rel="stylesheet" href="/CSS/receptionHome.css"/>
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <!--<link rel="stylesheet" href="assets/css/demo.css" />-->
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <jsp:include page="sidebarstaff.jsp"/>
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

                <div class="container">
                    <div class="page-inner">
                        <div
                            class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
                            >
                        </div>
                        <div class="row">
                            <div class="card-title col-12">Hotel Status</div>
                            <div class="col-sm-6 col-md-3">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-icon">
                                                <div
                                                    class="icon-big text-center icon-info bubble-shadow-small"
                                                    >
                                                    <i class="fas fa-bell"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Not cleaned</p>
                                                    <h4 class="card-title">${sessionScope.notCleaned}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">

                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-icon">
                                                <div
                                                    class="icon-big text-center icon-success bubble-shadow-small"
                                                    >
                                                    <i class="fas fa-air-freshener"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">In Progress</p>
                                                    <h4 class="card-title">${sessionScope.inProgress}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-icon">
                                                <div
                                                    class="icon-big text-center icon-secondary bubble-shadow-small"
                                                    >
                                                    <i class="far fa-check-circle"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Clean</p>
                                                    <h4 class="card-title">${sessionScope.cleaned}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Room Clean Status History</h4>
            </div>
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Room ID</th>
                            <th>Old Status</th>
                            <th>New Status</th>
                            <th>Updated At</th>
                            <th>Updated By</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="history" items="${sessionScope.historyList}">
                            <tr>
                                <td>${history.roomID}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${history.oldStatusID == 1}">Not Cleaned</c:when>
                                        <c:when test="${history.oldStatusID == 2}">In Progress</c:when>
                                        <c:when test="${history.oldStatusID == 3}">Cleaned</c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${history.newStatusID == 1}">Not Cleaned</c:when>
                                        <c:when test="${history.newStatusID == 2}">In Progress</c:when>
                                        <c:when test="${history.newStatusID == 3}">Cleaned</c:when>
                                    </c:choose>
                                </td>
                                <td>${history.updatedAt}</td>
                                <td>${history.updatedBy}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



                            <div class=" col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Cleaned Statistics</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas
                                                id="myChart"
                                                style="width: 50%; height: 50%"
                                                ></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Newest Notifications</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="container">
                                            <ul>
                                                <c:forEach var="news" items="${sessionScope.newsList}">
                                                    <li>
                                                        <span style="font-size: 21px" class="date">${news.publishDate}</span>
                                                        <a style="font-size: 22px" href="NewsServlet?action=view&id=${news.newsID}">${news.title}</a>
                                                        <p style="white-space: nowrap;       /* Không cho phép xuống dòng */
                                                           overflow: hidden;          /* Ẩn phần nội dung tràn ra */
                                                           text-overflow: ellipsis;
                                                           font-size:16px/* Hiển thị dấu ba chấm */">${news.content}</p>
                                                    </li>
                                                </c:forEach>
                                                <li><a href="viewNotification">View all notification</a></li>
                                            </ul> 
                                        </div>
                                    </div>
                                </div>
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
        <script>
            const notCleaned = ${sessionScope.notCleaned};
            const cleaned = ${sessionScope.cleaned};
            const inProgress = ${sessionScope.inProgress};
            var ctx = document.getElementById('myChart').getContext('2d');
            const data_chart = {
                labels: [
                    'Not Cleaned',
                    'Cleaned',
                    'In Progress'
                ],
                datasets: [{
                        data: [notCleaned, cleaned, inProgress],
                        backgroundColor: [
                            '#FEFFA7', // Màu đỏ cho giá trị 10
                            '#B6FFA1', // Màu xanh cho giá trị 20
                            '#C96868' // Màu vàng cho giá trị 30
                        ],
                        borderWidth: 1
                    }]
            };
            var myChart = new Chart(ctx, {
                type: 'doughnut',
                data: data_chart
            });

        </script>
    </body>
</html>


