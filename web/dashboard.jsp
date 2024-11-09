<%-- 
    Document   : dashboard
    Created on : Sep 21, 2024, 7:57:19 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page  import="java.util.List"%>
<%@page  import="dto.ChartRoom"%>
<%@ page import="com.google.gson.Gson" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Dashboard for manager</title>
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
            <!-- Sidebar -->
            <jsp:include page="sidebarManager.jsp"/>
            <!-- End Sidebar -->

            <div class="main-panel">
                <div class="main-header">
                    <div class="main-header-logo">
                        <!-- Logo Header -->
                        <div class="logo-header" data-background-color="dark">
                            <a href="index.html" class="logo">
                                <img
                                    src="img/logo/logoAdmin.png"
                                    alt="navbar brand"
                                    class="navbar-brand"
                                    height="130"
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
                            <div>
                                <h3 class="fw-bold mb-3">DASHBOARD</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-md-3">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-icon">
                                                <div
                                                    class="icon-big text-center icon-primary bubble-shadow-small"
                                                    >
                                                    <i class="fas fa-users"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Guest</p>
                                                    <h4 class="card-title">${sessionScope.numberOfVisitors}</h4>
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
                                                    class="icon-big text-center icon-info bubble-shadow-small"
                                                    >
                                                    <i class="fas fa-bed"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Rooms</p>
                                                    <h4 class="card-title">${sessionScope.numberOfRooms}</h4>
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
                                                    <i class="fas fa-file-invoice-dollar"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Total Amount</p>
                                                    <h4 class="card-title price-vnd">${sessionScope.totalInvoice}</h4>
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
                                                    <p class="card-category">Services</p>
                                                    <h4 class="card-title">${sessionScope.totalServices}</h4>
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
                                                    class="icon-big text-center icon-info bubble-shadow-small"style="background-color: orange"
                                                    >
                                                    <i class="fas fa-wrench"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Under Maintenance</p>
                                                    <h4 class="card-title">${sessionScope.maintaince}</h4>
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
                                                    class="icon-big text-center icon-success bubble-shadow-small"style="background-color: greenyellow"
                                                    >
                                                    <i class="fas fa-toggle-on"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Available</p>
                                                    <h4 class="card-title">${sessionScope.available}</h4>
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
                                                    class="icon-big text-center icon-secondary bubble-shadow-small"style="background-color:#286090 "
                                                    >
                                                    <i class="fas fa-user-check"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Occupied</p>
                                                    <h4 class="card-title">${sessionScope.occupied}</h4>
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
                                                    class="icon-big text-center icon-success bubble-shadow-small"style="background-color: #20c997"
                                                    >
                                                    <i class="fas fa-share-alt-square"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Amenity</p>
                                                    <h4 class="card-title">${sessionScope.amenityCount}</h4>
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
                                                    class="icon-big text-center icon-info bubble-shadow-small"style="background-color:springgreen"
                                                    >
                                                    <i class="fas fa-user"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Single Room</p>
                                                    <h4 class="card-title">${sessionScope.singleRoomCount}</h4>
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
                                                    class="icon-big text-center icon-info bubble-shadow-small"style="background-color: cadetblue"
                                                    >
                                                    <i class="fas fa-user-friends"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Double Room</p>
                                                    <h4 class="card-title">${sessionScope.doubleRoomCount}</h4>
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
                                                    class="icon-big text-center icon-info bubble-shadow-small"style="background-color: slategray"
                                                    >
                                                    <i class="fas fa-users"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Family Room</p>
                                                    <h4 class="card-title">${sessionScope.familyRoomCount}</h4>
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
                                                    class="icon-big text-center icon-info bubble-shadow-small"style="background-color: darkred"
                                                    >
                                                    <i class="fas fa-chess-king"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Deluxe Room</p>
                                                    <h4 class="card-title">${sessionScope.deluxeRoomCount}</h4>
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
                                                    class="icon-big text-center icon-info bubble-shadow-small"style="background-color:purple"
                                                    >
                                                    <i class="fas fa-crown"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">President Room</p>
                                                    <h4 class="card-title">${sessionScope.presidentRoomCount}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <!-- Newest Notifications Section -->
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
                                                            <p style="white-space: nowrap;
                                                               overflow: hidden;
                                                               text-overflow: ellipsis;
                                                               font-size:16px;">
                                                                ${news.content}
                                                            </p>
                                                        </li>
                                                    </c:forEach>
                                                    <li><a href="viewNotification">View all notifications</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Room Statistics Section -->
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title">Room Statistics</div>
                                        </div>
                                        <div class="card-body">
                                            <div class="chart-container">
                                                <canvas id="myChart" style="width: 50%; height: 50%;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Number of Room Types Section -->
                            <div class="row mt-4">
                                <!-- Transaction History Section -->
                                <div class="col-md-6">
                                    <div class="card card-round">
                                        <div class="card-header">
                                            <div class="card-head-row card-tools-still-right">
                                                <div class="card-title">Transaction History</div>
                                            </div>
                                        </div>
                                        <div class="card-body p-0">
                                            <div class="table-responsive">
                                                <!-- Projects table -->
                                                <table class="table align-items-center mb-0">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th scope="col">Invoice Number</th>
                                                            <th scope="col" class="text-end">Date & Time</th>
                                                            <th scope="col" class="text-end">Amount</th>
                                                            <th scope="col" class="text-end">Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${sessionScope.listInvoice}" var="i">
                                                            <tr>
                                                                <th scope="row">
                                                                    <button
                                                                        class="btn btn-icon btn-round btn-success btn-sm me-2"
                                                                        >
                                                                        <i class="fa fa-check"></i>
                                                                    </button>
                                                                    Payment No ${i.invoiceNo}
                                                                </th>
                                                                <td class="text-end">${i.paymentDate}</td>
                                                                <td class="text-end price-vnd">${i.finalAmount} VND</td>
                                                                <td class="text-end">
                                                                    <span class="badge badge-success">Completed</span>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Number of Room Types Section -->
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title">Number of room types</div>
                                        </div>
                                        <div class="card-body">
                                            <div class="chart-container">
                                                <canvas id="roomChart" style="width: 50%; height: 50%;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <canvas id="maintenanceChart"></canvas>
                </div>
                <div class="col-md-4">
                    <canvas id="availableChart"></canvas>
                </div>
                <div class="col-md-4">
                    <canvas id="occupiedChart"></canvas>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
            var maintenanceData = {
                labels: ["Under Maintenance", "Available", "Occupied"],
                datasets: [{
                        label: 'Room Status',
                        data: [<%= session.getAttribute("maintaince") %>, <%= session.getAttribute("available") %>, <%= session.getAttribute("occupied") %>],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)'
                        ],
                        borderWidth: 1
                    }]
            };
            var maintenanceCtx = document.getElementById('maintenanceChart').getContext('2d');
            var maintenanceChart = new Chart(maintenanceCtx, {
                type: 'bar',
                data: maintenanceData,
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
            </script>
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
                const underMaintenance = ${sessionScope.maintaince};
                const available = ${sessionScope.available};
                const occupied = ${sessionScope.occupied};
                console.log(available);
                var ctx = document.getElementById('myChart').getContext('2d');
                const data_chart = {
                    labels: [
                        'Under Maintenance',
                        'Available',
                        'Occupied'
                    ],
                    datasets: [{
                            data: [underMaintenance, available, occupied],
                            backgroundColor: [
                                'orange', // Màu đỏ cho giá trị 10
                                'greenyellow', // Màu xanh cho giá trị 20
                                '#286090' // Màu vàng cho giá trị 30
                            ],
                            borderWidth: 1
                        }]
                };
                var myChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: data_chart
                });
            </script>
            <%
        // Retrieve the list of ChartRoom objects from the session
        List<ChartRoom> roomStats = (List<ChartRoom>) session.getAttribute("chartRooms");

        // Convert the list to JSON format for JavaScript
        String roomStatsJson = new Gson().toJson(roomStats);
            %>
            <script>
                var roomStats = <%= roomStatsJson %>;

                // Extract the labels (room types) and data (booking times)
                const labels_type = roomStats.map(room => room.typeName);  // Room types on the x-axis
                const datatype = roomStats.map(room => room.bookTimes);   // Booking times on the y-axis
                console.log(datatype);
                // Render the chart
                var roomChart = document.getElementById('roomChart').getContext('2d');
                const data_chartss = {
                    labels: labels_type,
                    datasets: [{
                            label: 'Room Booking Statistics',
                            data: datatype,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 205, 86, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(201, 203, 207, 0.2)'
                            ],
                            borderColor: [
                                'rgb(255, 99, 132)',
                                'rgb(255, 159, 64)',
                                'rgb(255, 205, 86)',
                                'rgb(75, 192, 192)',
                                'rgb(54, 162, 235)',
                                'rgb(153, 102, 255)',
                                'rgb(201, 203, 207)'
                            ],
                            borderWidth: 1
                        }]
                };

                var roomCh = new Chart(roomChart, {
                    type: 'bar',
                    data: data_chartss,
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                                min: 0,
                                title: {
                                    display: true,
                                    text: 'Booking Times'  // Label for y-axis
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'Room Types'  // Label for x-axis
                                }
                            }
                        }
                    }
                });
            </script>
            <script>
                // Format price to VND
                function formatCurrencyVND(value) {
                    return new Intl.NumberFormat('vi-VN', {
                        style: 'currency',
                        currency: 'VND'
                    }).format(value);
                }

                // Apply the format to all prices
                $(document).ready(function () {
                    $('.price-vnd').each(function () {
                        let price = parseFloat($(this).text());
                        $(this).text(formatCurrencyVND(price));
                    });
                });
                function doClose() {
                    $('#addUserModal').modal('hide');
                }
            </script>
    </body>
</html>

