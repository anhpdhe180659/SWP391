<%-- 
    Document   : googlemaps
    Created on : Sep 19, 2024, 9:33:50 AM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Grid System - Kaiadmin Bootstrap 5 Admin Dashboard</title>
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
        <link rel="stylesheet" href="assets/css/demo.css" />
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
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Grid System</h3>
                            <ul class="breadcrumbs mb-3">
                                <li class="nav-home">
                                    <a href="#">
                                        <i class="icon-home"></i>
                                    </a>
                                </li>
                                <li class="separator">
                                    <i class="icon-arrow-right"></i>
                                </li>
                                <li class="nav-item">
                                    <a href="#">Base</a>
                                </li>
                                <li class="separator">
                                    <i class="icon-arrow-right"></i>
                                </li>
                                <li class="nav-item">
                                    <a href="#">Grid System</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title mt-3">XL Grid</h4>
                                <div class="row row-demo-grid">
                                    <div class="col-xl-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-xl-4</code></div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-xl-4</code></div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-xl-4</code></div>
                                        </div>
                                    </div>
                                </div>

                                <h4 class="card-title">LG Grid (Collapsed at 992px)</h4>
                                <div class="row row-demo-grid">
                                    <div class="col-lg-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-lg-4</code></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-lg-4</code></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-lg-4</code></div>
                                        </div>
                                    </div>
                                </div>

                                <h4 class="card-title">MD Grid (Collapsed at 768px)</h4>
                                <div class="row row-demo-grid">
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-md-4</code></div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-md-4</code></div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-md-4</code></div>
                                        </div>
                                    </div>
                                </div>

                                <h4 class="card-title">SM Grid (Collapsed at 576px)</h4>
                                <div class="row row-demo-grid">
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-sm-4</code></div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-sm-4</code></div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-sm-4</code></div>
                                        </div>
                                    </div>
                                </div>

                                <h4 class="card-title">XS Grid</h4>
                                <div class="row row-demo-grid">
                                    <div class="col-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-4</code></div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-4</code></div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="card">
                                            <div class="card-body"><code>.col-4</code></div>
                                        </div>
                                    </div>
                                </div>

                                <h4 class="card-title">Equality Width</h4>
                                <div class="row row-demo-grid">
                                    <div class="col">
                                        <div class="card">
                                            <div class="card-body"><code>col</code></div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card">
                                            <div class="card-body"><code>col</code></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-demo-grid">
                                    <div class="col">
                                        <div class="card">
                                            <div class="card-body"><code>col</code></div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card">
                                            <div class="card-body"><code>col</code></div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card">
                                            <div class="card-body"><code>col</code></div>
                                        </div>
                                    </div>
                                </div>

                                <h4 class="card-title">Setting one column width</h4>
                                <div class="row row-demo-grid">
                                    <div class="col">
                                        <div class="card">
                                            <div class="card-body"><code>col</code></div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="card">
                                            <div class="card-body"><code>col-6</code></div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card">
                                            <div class="card-body"><code>col</code></div>
                                        </div>
                                    </div>
                                </div>

                                <h4 class="card-title">
                                    Mix and Match (Showing different sizes on different screens)
                                </h4>
                                <!-- Stack the columns on mobile by making one full-width and the other half-width -->
                                <div class="row row-demo-grid">
                                    <div class="col-12 col-md-8">
                                        <div class="card">
                                            <div class="card-body"><code>col-12 col-md-8</code></div>
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-4">
                                        <div class="card">
                                            <div class="card-body"><code>col-6 col-md-6</code></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
                                <div class="row row-demo-grid">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="card">
                                            <div class="card-body">
                                                <code>col-sm-6 col-md-3</code>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="card">
                                            <div class="card-body">
                                                <code>col-sm-6 col-md-3</code>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="card">
                                            <div class="card-body">
                                                <code>col-sm-6 col-md-3</code>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="card">
                                            <div class="card-body">
                                                <code>col-sm-6 col-md-3</code>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Columns are always 50% wide, on mobile and desktop -->
                                <div class="row row-demo-grid">
                                    <div class="col-6">
                                        <div class="card">
                                            <div class="card-body"><code>col-6</code></div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="card">
                                            <div class="card-body"><code>col-6</code></div>
                                        </div>
                                    </div>
                                </div>

                                <h4 class="card-title">
                                    Offset Grid (Adding some space when needed)
                                </h4>
                                <div class="row row-demo-grid">
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <code>col-md-4</code>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 ms-auto">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <code>col-md-4 ms-auto</code>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row row-demo-grid">
                                    <div class="col-md-4 ms-auto me-auto">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <code>col-md-4 ms-auto me-auto</code>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 ms-auto me-auto">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <code>col-md-4 ms-auto me-auto</code>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row row-demo-grid">
                                    <div class="col-md-6 ms-auto me-auto">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <code>col-md-6 ms-auto me-auto</code>
                                            </div>
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

            <!-- jQuery Scrollbar -->
            <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
            <!-- Moment JS -->
            <script src="assets/js/plugin/moment/moment.min.js"></script>

            <!-- Chart JS -->
            <script src="assets/js/plugin/chart.js/chart.min.js"></script>

            <!-- jQuery Sparkline -->
            <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

            <!-- Chart Circle -->
            <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

            <!-- Datatables -->
            <script src="assets/js/plugin/datatables/datatables.min.js"></script>

            <!-- Bootstrap Notify -->
            <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

            <!-- jQuery Vector Maps -->
            <script src="assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
            <script src="assets/js/plugin/jsvectormap/world.js"></script>

            <!-- Sweet Alert -->
            <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

            <!-- Kaiadmin JS -->
            <script src="assets/js/kaiadmin.min.js"></script>

            <!-- Kaiadmin DEMO methods, don't include it in your project! -->
            <script src="assets/js/setting-demo2.js"></script>
    </body>
</html>
