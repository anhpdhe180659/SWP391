<%-- 
    Document   : charts
    Created on : Sep 19, 2024, 9:31:43 AM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Charts - Kaiadmin Bootstrap 5 Admin Dashboard</title>
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
            <jsp:include page="sidebar.jsp"/>
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
                    <!-- Navbar Header -->
                    <nav
                        class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
                        >
                        <div class="container-fluid">
                            <nav
                                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                                >
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <button type="submit" class="btn btn-search pe-1">
                                            <i class="fa fa-search search-icon"></i>
                                        </button>
                                    </div>
                                    <input
                                        type="text"
                                        placeholder="Search ..."
                                        class="form-control"
                                        />
                                </div>
                            </nav>

                            <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                                <li
                                    class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                                    >
                                    <a
                                        class="nav-link dropdown-toggle"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        role="button"
                                        aria-expanded="false"
                                        aria-haspopup="true"
                                        >
                                        <i class="fa fa-search"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-search animated fadeIn">
                                        <form class="navbar-left navbar-form nav-search">
                                            <div class="input-group">
                                                <input
                                                    type="text"
                                                    placeholder="Search ..."
                                                    class="form-control"
                                                    />
                                            </div>
                                        </form>
                                    </ul>
                                </li>
                                <li class="nav-item topbar-icon dropdown hidden-caret">
                                    <a
                                        class="nav-link dropdown-toggle"
                                        href="#"
                                        id="messageDropdown"
                                        role="button"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i class="fa fa-envelope"></i>
                                    </a>
                                    <ul
                                        class="dropdown-menu messages-notif-box animated fadeIn"
                                        aria-labelledby="messageDropdown"
                                        >
                                        <li>
                                            <div
                                                class="dropdown-title d-flex justify-content-between align-items-center"
                                                >
                                                Messages
                                                <a href="#" class="small">Mark all as read</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="message-notif-scroll scrollbar-outer">
                                                <div class="notif-center">
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/jm_denis.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Jimmy Denis</span>
                                                            <span class="block"> How are you ? </span>
                                                            <span class="time">5 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/chadengle.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Chad</span>
                                                            <span class="block"> Ok, Thanks ! </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/mlane.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Jhon Doe</span>
                                                            <span class="block">
                                                                Ready for the meeting today...
                                                            </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/talha.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Talha</span>
                                                            <span class="block"> Hi, Apa Kabar ? </span>
                                                            <span class="time">17 minutes ago</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <a class="see-all" href="javascript:void(0);"
                                               >See all messages<i class="fa fa-angle-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item topbar-icon dropdown hidden-caret">
                                    <a
                                        class="nav-link dropdown-toggle"
                                        href="#"
                                        id="notifDropdown"
                                        role="button"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i class="fa fa-bell"></i>
                                        <span class="notification">4</span>
                                    </a>
                                    <ul
                                        class="dropdown-menu notif-box animated fadeIn"
                                        aria-labelledby="notifDropdown"
                                        >
                                        <li>
                                            <div class="dropdown-title">
                                                You have 4 new notification
                                            </div>
                                        </li>
                                        <li>
                                            <div class="notif-scroll scrollbar-outer">
                                                <div class="notif-center">
                                                    <a href="#">
                                                        <div class="notif-icon notif-primary">
                                                            <i class="fa fa-user-plus"></i>
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block"> New user registered </span>
                                                            <span class="time">5 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-icon notif-success">
                                                            <i class="fa fa-comment"></i>
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block">
                                                                Rahmad commented on Admin
                                                            </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/profile2.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block">
                                                                Reza send messages to you
                                                            </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-icon notif-danger">
                                                            <i class="fa fa-heart"></i>
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block"> Farrah liked Admin </span>
                                                            <span class="time">17 minutes ago</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <a class="see-all" href="javascript:void(0);"
                                               >See all notifications<i class="fa fa-angle-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item topbar-icon dropdown hidden-caret">
                                    <a
                                        class="nav-link"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        aria-expanded="false"
                                        >
                                        <i class="fas fa-layer-group"></i>
                                    </a>
                                    <div class="dropdown-menu quick-actions animated fadeIn">
                                        <div class="quick-actions-header">
                                            <span class="title mb-1">Quick Actions</span>
                                            <span class="subtitle op-7">Shortcuts</span>
                                        </div>
                                        <div class="quick-actions-scroll scrollbar-outer">
                                            <div class="quick-actions-items">
                                                <div class="row m-0">
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div class="avatar-item bg-danger rounded-circle">
                                                                <i class="far fa-calendar-alt"></i>
                                                            </div>
                                                            <span class="text">Calendar</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-warning rounded-circle"
                                                                >
                                                                <i class="fas fa-map"></i>
                                                            </div>
                                                            <span class="text">Maps</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div class="avatar-item bg-info rounded-circle">
                                                                <i class="fas fa-file-excel"></i>
                                                            </div>
                                                            <span class="text">Reports</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-success rounded-circle"
                                                                >
                                                                <i class="fas fa-envelope"></i>
                                                            </div>
                                                            <span class="text">Emails</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-primary rounded-circle"
                                                                >
                                                                <i class="fas fa-file-invoice-dollar"></i>
                                                            </div>
                                                            <span class="text">Invoice</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-secondary rounded-circle"
                                                                >
                                                                <i class="fas fa-credit-card"></i>
                                                            </div>
                                                            <span class="text">Payments</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="nav-item topbar-user dropdown hidden-caret">
                                    <a
                                        class="dropdown-toggle profile-pic"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        aria-expanded="false"
                                        >
                                        <div class="avatar-sm">
                                            <img
                                                src="assets/img/profile.jpg"
                                                alt="..."
                                                class="avatar-img rounded-circle"
                                                />
                                        </div>
                                        <span class="profile-username">
                                            <span class="op-7">Hi,</span>
                                            <span class="fw-bold">Hizrian</span>
                                        </span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-user animated fadeIn">
                                        <div class="dropdown-user-scroll scrollbar-outer">
                                            <li>
                                                <div class="user-box">
                                                    <div class="avatar-lg">
                                                        <img
                                                            src="assets/img/profile.jpg"
                                                            alt="image profile"
                                                            class="avatar-img rounded"
                                                            />
                                                    </div>
                                                    <div class="u-text">
                                                        <h4>Hizrian</h4>
                                                        <p class="text-muted">hello@example.com</p>
                                                        <a
                                                            href="profile.jsp"
                                                            class="btn btn-xs btn-secondary btn-sm"
                                                            >View Profile</a
                                                        >
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">My Profile</a>
                                                <a class="dropdown-item" href="#">My Balance</a>
                                                <a class="dropdown-item" href="#">Inbox</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Account Setting</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Logout</a>
                                            </li>
                                        </div>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <!-- End Navbar -->
                </div>

                <div class="container">
                    <div class="page-inner">
                        <h3 class="fw-bold mb-3">Chart.js</h3>
                        <div class="page-category">
                            Simple yet flexible JavaScript charting for designers &
                            developers. Please checkout their
                            <a href="http://www.chartjs.org/" target="_blank"
                               >full documentation</a
                            >.
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Line Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="lineChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Bar Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="barChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Pie Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas
                                                id="pieChart"
                                                style="width: 50%; height: 50%"
                                                ></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Radar Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="radarChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Bubble Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="bubbleChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Multiple Line Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="multipleLineChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Multiple Bar Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="multipleBarChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Chart with HTML Legends</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-sub">
                                            Sometimes you need a very complex legend. In these cases,
                                            it makes sense to generate an HTML legend. Charts provide
                                            a generateLegend() method on their prototype that returns
                                            an HTML string for the legend.
                                        </div>
                                        <div class="chart-container">
                                            <canvas id="htmlLegendsChart"></canvas>
                                        </div>
                                        <div id="myChartLegend"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <footer class="footer">
                    <div class="container-fluid d-flex justify-content-between">
                        <nav class="pull-left">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="http://www.themekita.com">
                                        ThemeKita
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#"> Help </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#"> Licenses </a>
                                </li>
                            </ul>
                        </nav>
                        <div class="copyright">
                            2024, made with <i class="fa fa-heart heart text-danger"></i> by
                            <a href="http://www.themekita.com">ThemeKita</a>
                        </div>
                        <div>
                            Distributed by
                            <a target="_blank" href="https://themewagon.com/">ThemeWagon</a>.
                        </div>
                    </div>
                </footer>
            </div>

            <!-- Custom template | don't include it in your project! -->
            <div class="custom-template">
                <div class="title">Settings</div>
                <div class="custom-content">
                    <div class="switcher">
                        <div class="switch-block">
                            <h4>Logo Header</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="selected changeLogoHeaderColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="selected changeLogoHeaderColor"
                                    data-color="blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="purple"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="light-blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="green"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="orange"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="red"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="white"
                                    ></button>
                                <br />
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="dark2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="purple2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="light-blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="green2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="orange2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="red2"
                                    ></button>
                            </div>
                        </div>
                        <div class="switch-block">
                            <h4>Navbar Header</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="purple"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="light-blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="green"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="orange"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="red"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="white"
                                    ></button>
                                <br />
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="dark2"
                                    ></button>
                                <button
                                    type="button"
                                    class="selected changeTopBarColor"
                                    data-color="blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="purple2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="light-blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="green2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="orange2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="red2"
                                    ></button>
                            </div>
                        </div>
                        <div class="switch-block">
                            <h4>Sidebar</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="selected changeSideBarColor"
                                    data-color="white"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeSideBarColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeSideBarColor"
                                    data-color="dark2"
                                    ></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="custom-toggle">
                    <i class="icon-settings"></i>
                </div>
            </div>
            <!-- End Custom template -->
        </div>
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <!-- Chart JS -->
        <script src="assets/js/plugin/chart.js/chart.min.js"></script>
        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>
        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo2.js"></script>
        <script>
            var lineChart = document.getElementById("lineChart").getContext("2d"),
                    barChart = document.getElementById("barChart").getContext("2d"),
                    pieChart = document.getElementById("pieChart").getContext("2d"),
                    doughnutChart = document
                    .getElementById("doughnutChart")
                    .getContext("2d"),
                    radarChart = document.getElementById("radarChart").getContext("2d"),
                    bubbleChart = document.getElementById("bubbleChart").getContext("2d"),
                    multipleLineChart = document
                    .getElementById("multipleLineChart")
                    .getContext("2d"),
                    multipleBarChart = document
                    .getElementById("multipleBarChart")
                    .getContext("2d"),
                    htmlLegendsChart = document
                    .getElementById("htmlLegendsChart")
                    .getContext("2d");

            var myLineChart = new Chart(lineChart, {
                type: "line",
                data: {
                    labels: [
                        "Jan",
                        "Feb",
                        "Mar",
                        "Apr",
                        "May",
                        "Jun",
                        "Jul",
                        "Aug",
                        "Sep",
                        "Oct",
                        "Nov",
                        "Dec",
                    ],
                    datasets: [
                        {
                            label: "Active Users",
                            borderColor: "#1d7af3",
                            pointBorderColor: "#FFF",
                            pointBackgroundColor: "#1d7af3",
                            pointBorderWidth: 2,
                            pointHoverRadius: 4,
                            pointHoverBorderWidth: 1,
                            pointRadius: 4,
                            backgroundColor: "transparent",
                            fill: true,
                            borderWidth: 2,
                            data: [
                                542, 480, 430, 550, 530, 453, 380, 434, 568, 610, 700, 900,
                            ],
                        },
                    ],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        position: "bottom",
                        labels: {
                            padding: 10,
                            fontColor: "#1d7af3",
                        },
                    },
                    tooltips: {
                        bodySpacing: 4,
                        mode: "nearest",
                        intersect: 0,
                        position: "nearest",
                        xPadding: 10,
                        yPadding: 10,
                        caretPadding: 10,
                    },
                    layout: {
                        padding: {left: 15, right: 15, top: 15, bottom: 15},
                    },
                },
            });

            var myBarChart = new Chart(barChart, {
                type: "bar",
                data: {
                    labels: [
                        "Jan",
                        "Feb",
                        "Mar",
                        "Apr",
                        "May",
                        "Jun",
                        "Jul",
                        "Aug",
                        "Sep",
                        "Oct",
                        "Nov",
                        "Dec",
                    ],
                    datasets: [
                        {
                            label: "Sales",
                            backgroundColor: "rgb(23, 125, 255)",
                            borderColor: "rgb(23, 125, 255)",
                            data: [3, 2, 9, 5, 4, 6, 4, 6, 7, 8, 7, 4],
                        },
                    ],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true,
                                },
                            },
                        ],
                    },
                },
            });

            var myPieChart = new Chart(pieChart, {
                type: "pie",
                data: {
                    datasets: [
                        {
                            data: [50, 35, 15],
                            backgroundColor: ["#1d7af3", "#f3545d", "#fdaf4b"],
                            borderWidth: 0,
                        },
                    ],
                    labels: ["New Visitors", "Subscribers", "Active Users"],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        position: "bottom",
                        labels: {
                            fontColor: "rgb(154, 154, 154)",
                            fontSize: 11,
                            usePointStyle: true,
                            padding: 20,
                        },
                    },
                    pieceLabel: {
                        render: "percentage",
                        fontColor: "white",
                        fontSize: 14,
                    },
                    tooltips: false,
                    layout: {
                        padding: {
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: 20,
                        },
                    },
                },
            });

            var myDoughnutChart = new Chart(doughnutChart, {
                type: "doughnut",
                data: {
                    datasets: [
                        {
                            data: [10, 20, 30],
                            backgroundColor: ["#f3545d", "#fdaf4b", "#1d7af3"],
                        },
                    ],

                    labels: ["Red", "Yellow", "Blue"],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        position: "bottom",
                    },
                    layout: {
                        padding: {
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: 20,
                        },
                    },
                },
            });

            var myRadarChart = new Chart(radarChart, {
                type: "radar",
                data: {
                    labels: ["Running", "Swimming", "Eating", "Cycling", "Jumping"],
                    datasets: [
                        {
                            data: [20, 10, 30, 2, 30],
                            borderColor: "#1d7af3",
                            backgroundColor: "rgba(29, 122, 243, 0.25)",
                            pointBackgroundColor: "#1d7af3",
                            pointHoverRadius: 4,
                            pointRadius: 3,
                            label: "Team 1",
                        },
                        {
                            data: [10, 20, 15, 30, 22],
                            borderColor: "#716aca",
                            backgroundColor: "rgba(113, 106, 202, 0.25)",
                            pointBackgroundColor: "#716aca",
                            pointHoverRadius: 4,
                            pointRadius: 3,
                            label: "Team 2",
                        },
                    ],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        position: "bottom",
                    },
                },
            });

            var myBubbleChart = new Chart(bubbleChart, {
                type: "bubble",
                data: {
                    datasets: [
                        {
                            label: "Car",
                            data: [
                                {x: 25, y: 17, r: 25},
                                {x: 30, y: 25, r: 28},
                                {x: 35, y: 30, r: 8},
                            ],
                            backgroundColor: "#716aca",
                        },
                        {
                            label: "Motorcycles",
                            data: [
                                {x: 10, y: 17, r: 20},
                                {x: 30, y: 10, r: 7},
                                {x: 35, y: 20, r: 10},
                            ],
                            backgroundColor: "#1d7af3",
                        },
                    ],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        position: "bottom",
                    },
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true,
                                },
                            },
                        ],
                        xAxes: [
                            {
                                ticks: {
                                    beginAtZero: true,
                                },
                            },
                        ],
                    },
                },
            });

            var myMultipleLineChart = new Chart(multipleLineChart, {
                type: "line",
                data: {
                    labels: [
                        "Jan",
                        "Feb",
                        "Mar",
                        "Apr",
                        "May",
                        "Jun",
                        "Jul",
                        "Aug",
                        "Sep",
                        "Oct",
                        "Nov",
                        "Dec",
                    ],
                    datasets: [
                        {
                            label: "Python",
                            borderColor: "#1d7af3",
                            pointBorderColor: "#FFF",
                            pointBackgroundColor: "#1d7af3",
                            pointBorderWidth: 2,
                            pointHoverRadius: 4,
                            pointHoverBorderWidth: 1,
                            pointRadius: 4,
                            backgroundColor: "transparent",
                            fill: true,
                            borderWidth: 2,
                            data: [30, 45, 45, 68, 69, 90, 100, 158, 177, 200, 245, 256],
                        },
                        {
                            label: "PHP",
                            borderColor: "#59d05d",
                            pointBorderColor: "#FFF",
                            pointBackgroundColor: "#59d05d",
                            pointBorderWidth: 2,
                            pointHoverRadius: 4,
                            pointHoverBorderWidth: 1,
                            pointRadius: 4,
                            backgroundColor: "transparent",
                            fill: true,
                            borderWidth: 2,
                            data: [10, 20, 55, 75, 80, 48, 59, 55, 23, 107, 60, 87],
                        },
                        {
                            label: "Ruby",
                            borderColor: "#f3545d",
                            pointBorderColor: "#FFF",
                            pointBackgroundColor: "#f3545d",
                            pointBorderWidth: 2,
                            pointHoverRadius: 4,
                            pointHoverBorderWidth: 1,
                            pointRadius: 4,
                            backgroundColor: "transparent",
                            fill: true,
                            borderWidth: 2,
                            data: [10, 30, 58, 79, 90, 105, 117, 160, 185, 210, 185, 194],
                        },
                    ],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        position: "top",
                    },
                    tooltips: {
                        bodySpacing: 4,
                        mode: "nearest",
                        intersect: 0,
                        position: "nearest",
                        xPadding: 10,
                        yPadding: 10,
                        caretPadding: 10,
                    },
                    layout: {
                        padding: {left: 15, right: 15, top: 15, bottom: 15},
                    },
                },
            });

            var myMultipleBarChart = new Chart(multipleBarChart, {
                type: "bar",
                data: {
                    labels: [
                        "Jan",
                        "Feb",
                        "Mar",
                        "Apr",
                        "May",
                        "Jun",
                        "Jul",
                        "Aug",
                        "Sep",
                        "Oct",
                        "Nov",
                        "Dec",
                    ],
                    datasets: [
                        {
                            label: "First time visitors",
                            backgroundColor: "#59d05d",
                            borderColor: "#59d05d",
                            data: [95, 100, 112, 101, 144, 159, 178, 156, 188, 190, 210, 245],
                        },
                        {
                            label: "Visitors",
                            backgroundColor: "#fdaf4b",
                            borderColor: "#fdaf4b",
                            data: [
                                145, 256, 244, 233, 210, 279, 287, 253, 287, 299, 312, 356,
                            ],
                        },
                        {
                            label: "Pageview",
                            backgroundColor: "#177dff",
                            borderColor: "#177dff",
                            data: [
                                185, 279, 273, 287, 234, 312, 322, 286, 301, 320, 346, 399,
                            ],
                        },
                    ],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        position: "bottom",
                    },
                    title: {
                        display: true,
                        text: "Traffic Stats",
                    },
                    tooltips: {
                        mode: "index",
                        intersect: false,
                    },
                    responsive: true,
                    scales: {
                        xAxes: [
                            {
                                stacked: true,
                            },
                        ],
                        yAxes: [
                            {
                                stacked: true,
                            },
                        ],
                    },
                },
            });

            // Chart with HTML Legends

            var gradientStroke = htmlLegendsChart.createLinearGradient(
                    500,
                    0,
                    100,
                    0
                    );
            gradientStroke.addColorStop(0, "#177dff");
            gradientStroke.addColorStop(1, "#80b6f4");

            var gradientFill = htmlLegendsChart.createLinearGradient(500, 0, 100, 0);
            gradientFill.addColorStop(0, "rgba(23, 125, 255, 0.7)");
            gradientFill.addColorStop(1, "rgba(128, 182, 244, 0.3)");

            var gradientStroke2 = htmlLegendsChart.createLinearGradient(
                    500,
                    0,
                    100,
                    0
                    );
            gradientStroke2.addColorStop(0, "#f3545d");
            gradientStroke2.addColorStop(1, "#ff8990");

            var gradientFill2 = htmlLegendsChart.createLinearGradient(500, 0, 100, 0);
            gradientFill2.addColorStop(0, "rgba(243, 84, 93, 0.7)");
            gradientFill2.addColorStop(1, "rgba(255, 137, 144, 0.3)");

            var gradientStroke3 = htmlLegendsChart.createLinearGradient(
                    500,
                    0,
                    100,
                    0
                    );
            gradientStroke3.addColorStop(0, "#fdaf4b");
            gradientStroke3.addColorStop(1, "#ffc478");

            var gradientFill3 = htmlLegendsChart.createLinearGradient(500, 0, 100, 0);
            gradientFill3.addColorStop(0, "rgba(253, 175, 75, 0.7)");
            gradientFill3.addColorStop(1, "rgba(255, 196, 120, 0.3)");

            var myHtmlLegendsChart = new Chart(htmlLegendsChart, {
                type: "line",
                data: {
                    labels: [
                        "Jan",
                        "Feb",
                        "Mar",
                        "Apr",
                        "May",
                        "Jun",
                        "Jul",
                        "Aug",
                        "Sep",
                        "Oct",
                        "Nov",
                        "Dec",
                    ],
                    datasets: [
                        {
                            label: "Subscribers",
                            borderColor: gradientStroke2,
                            pointBackgroundColor: gradientStroke2,
                            pointRadius: 0,
                            backgroundColor: gradientFill2,
                            legendColor: "#f3545d",
                            fill: true,
                            borderWidth: 1,
                            data: [
                                154, 184, 175, 203, 210, 231, 240, 278, 252, 312, 320, 374,
                            ],
                        },
                        {
                            label: "New Visitors",
                            borderColor: gradientStroke3,
                            pointBackgroundColor: gradientStroke3,
                            pointRadius: 0,
                            backgroundColor: gradientFill3,
                            legendColor: "#fdaf4b",
                            fill: true,
                            borderWidth: 1,
                            data: [
                                256, 230, 245, 287, 240, 250, 230, 295, 331, 431, 456, 521,
                            ],
                        },
                        {
                            label: "Active Users",
                            borderColor: gradientStroke,
                            pointBackgroundColor: gradientStroke,
                            pointRadius: 0,
                            backgroundColor: gradientFill,
                            legendColor: "#177dff",
                            fill: true,
                            borderWidth: 1,
                            data: [
                                542, 480, 430, 550, 530, 453, 380, 434, 568, 610, 700, 900,
                            ],
                        },
                    ],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        display: false,
                    },
                    tooltips: {
                        bodySpacing: 4,
                        mode: "nearest",
                        intersect: 0,
                        position: "nearest",
                        xPadding: 10,
                        yPadding: 10,
                        caretPadding: 10,
                    },
                    layout: {
                        padding: {left: 15, right: 15, top: 15, bottom: 15},
                    },
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    fontColor: "rgba(0,0,0,0.5)",
                                    fontStyle: "500",
                                    beginAtZero: false,
                                    maxTicksLimit: 5,
                                    padding: 20,
                                },
                                gridLines: {
                                    drawTicks: false,
                                    display: false,
                                },
                            },
                        ],
                        xAxes: [
                            {
                                gridLines: {
                                    zeroLineColor: "transparent",
                                },
                                ticks: {
                                    padding: 20,
                                    fontColor: "rgba(0,0,0,0.5)",
                                    fontStyle: "500",
                                },
                            },
                        ],
                    },
                    legendCallback: function (chart) {
                        var text = [];
                        text.push('<ul class="' + chart.id + '-legend html-legend">');
                        for (var i = 0; i < chart.data.datasets.length; i++) {
                            text.push(
                                    '<li><span style="background-color:' +
                                    chart.data.datasets[i].legendColor +
                                    '"></span>'
                                    );
                            if (chart.data.datasets[i].label) {
                                text.push(chart.data.datasets[i].label);
                            }
                            text.push("</li>");
                        }
                        text.push("</ul>");
                        return text.join("");
                    },
                },
            });

            var myLegendContainer = document.getElementById("myChartLegend");

            // generate HTML legend
            myLegendContainer.innerHTML = myHtmlLegendsChart.generateLegend();

            // bind onClick event to all LI-tags of the legend
            var legendItems = myLegendContainer.getElementsByTagName("li");
            for (var i = 0; i < legendItems.length; i += 1) {
                legendItems[i].addEventListener("click", legendClickCallback, false);
            }
        </script>
    </body>
</html>

