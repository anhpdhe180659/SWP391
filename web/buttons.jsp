<%-- 
    Document   : buttons.jsp
    Created on : Sep 19, 2024, 8:29:04 AM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Buttons - Kaiadmin Bootstrap 5 Admin Dashboard</title>
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
                            <h3 class="fw-bold mb-3">Buttons</h3>
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
                                    <a href="#">Buttons</a>
                                </li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Button Original</h4>
                                    </div>
                                    <div class="card-body">
                                        <p class="demo">
                                            <button class="btn btn-black">Default</button>

                                            <button class="btn btn-primary">Primary</button>

                                            <button class="btn btn-secondary">Secondary</button>

                                            <button class="btn btn-info">Info</button>

                                            <button class="btn btn-success">Success</button>

                                            <button class="btn btn-warning">Warning</button>

                                            <button class="btn btn-danger">Danger</button>

                                            <button class="btn btn-link">Link</button>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Button with Label</h4>
                                    </div>
                                    <div class="card-body">
                                        <p class="demo">
                                            <button class="btn btn-black">
                                                <span class="btn-label">
                                                    <i class="fa fa-archive"></i>
                                                </span>
                                                Default
                                            </button>

                                            <button class="btn btn-primary">
                                                <span class="btn-label">
                                                    <i class="fa fa-bookmark"></i>
                                                </span>
                                                Primary
                                            </button>

                                            <button class="btn btn-secondary">
                                                <span class="btn-label">
                                                    <i class="fa fa-plus"></i>
                                                </span>
                                                Secondary
                                            </button>

                                            <button class="btn btn-info">
                                                <span class="btn-label">
                                                    <i class="fa fa-info"></i>
                                                </span>
                                                Info
                                            </button>

                                            <button class="btn btn-success">
                                                <span class="btn-label">
                                                    <i class="fa fa-check"></i>
                                                </span>
                                                Success
                                            </button>

                                            <button class="btn btn-warning">
                                                <span class="btn-label">
                                                    <i class="fa fa-exclamation-circle"></i>
                                                </span>
                                                Warning
                                            </button>

                                            <button class="btn btn-danger">
                                                <span class="btn-label">
                                                    <i class="fa fa-heart"></i>
                                                </span>
                                                Danger
                                            </button>

                                            <button class="btn btn-link">
                                                <span class="btn-label">
                                                    <i class="fa fa-link"></i>
                                                </span>
                                                Link
                                            </button>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Button Icon</h4>
                                    </div>
                                    <div class="card-body">
                                        <p class="demo">
                                            <button
                                                type="button"
                                                class="btn btn-icon btn-round btn-black"
                                                >
                                                <i class="fa fa-align-left"></i>
                                            </button>

                                            <button
                                                type="button"
                                                class="btn btn-icon btn-round btn-primary"
                                                >
                                                <i class="fab fa-twitter"></i>
                                            </button>

                                            <button
                                                type="button"
                                                class="btn btn-icon btn-round btn-secondary"
                                                >
                                                <i class="fa fa-bookmark"></i>
                                            </button>

                                            <button
                                                type="button"
                                                class="btn btn-icon btn-round btn-info"
                                                >
                                                <i class="fa fa-info"></i>
                                            </button>

                                            <button
                                                type="button"
                                                class="btn btn-icon btn-round btn-success"
                                                >
                                                <i class="fa fa-check"></i>
                                            </button>

                                            <button
                                                type="button"
                                                class="btn btn-icon btn-round btn-warning"
                                                >
                                                <i class="fa fa-exclamation-circle"></i>
                                            </button>

                                            <button
                                                type="button"
                                                class="btn btn-icon btn-round btn-danger"
                                                >
                                                <i class="fa fa-heart"></i>
                                            </button>

                                            <button type="button" class="btn btn-icon btn-link">
                                                <i class="fa fa-link"></i>
                                            </button>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Disabled Button</h4>
                                    </div>
                                    <div class="card-body">
                                        <p class="demo">
                                            <button class="btn btn-black" disabled="disabled">
                                                Default
                                            </button>

                                            <button class="btn btn-primary" disabled="disabled">
                                                Primary
                                            </button>

                                            <button class="btn btn-secondary" disabled="disabled">
                                                Secondary
                                            </button>

                                            <button class="btn btn-info" disabled="disabled">
                                                Info
                                            </button>

                                            <button class="btn btn-success" disabled="disabled">
                                                Success
                                            </button>

                                            <button class="btn btn-warning" disabled="disabled">
                                                Warning
                                            </button>

                                            <button class="btn btn-danger" disabled="disabled">
                                                Danger
                                            </button>

                                            <button class="btn btn-link" disabled>Link</button>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Button Size</h4>
                                    </div>
                                    <div class="card-body">
                                        <p class="demo">
                                            <button class="btn btn-primary btn-lg">Large</button>

                                            <button class="btn btn-primary">Normal</button>

                                            <button class="btn btn-primary btn-sm">Small</button>

                                            <button class="btn btn-primary btn-xs">
                                                Extra Small
                                            </button>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Button Type</h4>
                                    </div>
                                    <div class="card-body">
                                        <p class="demo">
                                            <button class="btn btn-primary">Normal</button>
                                            <button class="btn btn-primary btn-border">Border</button>

                                            <button class="btn btn-primary btn-round">Round</button>

                                            <button class="btn btn-primary btn-border btn-round">
                                                Round
                                            </button>

                                            <button class="btn btn-primary btn-link">Link</button>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Bootstrap Dropdown</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="demo">
                                            <div class="btn-group dropdown">
                                                <button
                                                    class="btn btn-primary dropdown-toggle"
                                                    type="button"
                                                    data-bs-toggle="dropdown"
                                                    >
                                                    DropDown
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li>
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#"
                                                           >Something else here</a
                                                        >
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="btn-group dropup">
                                                <button
                                                    class="btn btn-info dropdown-toggle"
                                                    type="button"
                                                    data-bs-toggle="dropdown"
                                                    >
                                                    DropUp
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li>
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#"
                                                           >Something else here</a
                                                        >
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="btn-group dropend">
                                                <button
                                                    type="button"
                                                    class="btn btn-success btn-round dropdown-toggle"
                                                    data-bs-toggle="dropdown"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"
                                                    >
                                                    DropRight
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li>
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#"
                                                           >Something else here</a
                                                        >
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="btn-group dropstart">
                                                <button
                                                    type="button"
                                                    class="btn btn-black btn-border dropdown-toggle"
                                                    data-bs-toggle="dropdown"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"
                                                    >
                                                    DropLeft
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li>
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item" href="#"
                                                           >Something else here</a
                                                        >
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Badge</h4>
                                    </div>
                                    <div class="card-body">
                                        <span class="badge badge-count">Count</span>
                                        <span class="badge badge-black">Default</span>
                                        <span class="badge badge-primary">Primary</span>
                                        <span class="badge badge-info">Info</span>
                                        <span class="badge badge-success">Success</span>
                                        <span class="badge badge-warning">Warning</span>
                                        <span class="badge badge-danger">Danger</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Nav Pills</h4>
                                    </div>
                                    <div class="card-body">
                                        <ul class="nav nav-pills nav-primary">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="#">Active</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">Link</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">Link</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link disabled" href="#">Disabled</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Pagination</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="demo">
                                            <ul class="pagination pg-primary">
                                                <li class="page-item">
                                                    <a class="page-link" href="#" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                </li>
                                                <li class="page-item active">
                                                    <a class="page-link" href="#">1</a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#">2</a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#">3</a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                        <span class="sr-only">Next</span>
                                                    </a>
                                                </li>
                                            </ul>
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
