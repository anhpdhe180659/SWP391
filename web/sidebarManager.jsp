<%-- 
    Document   : managerSidebar
    Created on : Sep 21, 2024, 7:33:50 PM
    Author     : nhatk
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sidebar</title>
    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar" data-background-color="dark">
            <div class="sidebar-logo">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="dark">
                    <a href="dashboard" class="logo">
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
            <div class="sidebar-wrapper scrollbar scrollbar-inner">
                <div class="sidebar-content">
                    <ul class="nav nav-secondary">
                        <li class="nav-item">
                            <a
                                href="dashboard"
                                >
                                <i class="fas fa-home"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <li class="nav-section">
                            <span class="sidebar-mini-icon">
                                <i class="fa fa-ellipsis-h"></i>
                            </span>
                            <h4 class="text-section">Manage</h4>
                        </li>
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#base">
                                <i class="fas fa-users"></i>
                                <p>User</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="base">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="listUser">
                                            <span class="sub-item">List user</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="addUser">
                                            <span class="sub-item">Add user</span>
                                        </a>
                                    </li>
                                    <!--                                    <li>
                                                                            <a href="listGuest">
                                                                                <span class="sub-item">Guest</span>
                                                                            </a>
                                                                        </li>-->
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#maps">
                                <i class="fas fa-home"></i>
                                <p>Room</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="maps">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="listRoomAdmin">
                                            <span class="sub-item">Room</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="listRoomType">
                                            <span class="sub-item">Room Type</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="addRoomType">
                                            <span class="sub-item">Add Room Type</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#sidebarLayouts">
                                <i class="far fa-check-circle"></i>
                                <p>Services</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="sidebarLayouts">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="listService">
                                            <span class="sub-item">Services</span>
                                        </a>                                    </li>

                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#forms">
                                <i class="fas fa-window-maximize"></i>
                                <p>Amenity</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="forms">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="listAmenity">
                                            <span class="sub-item">Amenity</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="listItem">
                                            <span class="sub-item">Item</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#tables">
                                <i class="fas fa-bell"></i>
                                <p>Notification</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="tables">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="NewsServlet">
                                            <span class="sub-item">Notification</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#h">
                                <i class="fas fa-bell"></i>
                                <p>Manage feedback</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="h">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="viewFeedbackAdmin">
                                            <span class="sub-item">Feedback</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#guestForms" aria-expanded="false" aria-controls="guestForms">
                                <i class="fas fa-pen-square"></i>
                                <p>Manage Guest</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="guestForms">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="listGuest">
                                            <span class="sub-item">Guest</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        <!--
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#charts">
                                <i class="far fa-chart-bar"></i>
                                <p>Charts</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="charts">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="charts.jsp">
                                            <span class="sub-item">Chart Js</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="sparkline.jsp">
                                            <span class="sub-item">Sparkline</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="widgets.jsp">
                                <i class="fas fa-desktop"></i>
                                <p>Widgets</p>
                                <span class="badge badge-success">4</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="index.jsp">
                                <i class="fas fa-file"></i>
                                <p>Documentation</p>
                                <span class="badge badge-secondary">1</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#submenu">
                                <i class="fas fa-bars"></i>
                                <p>Menu Levels</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="submenu">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a data-bs-toggle="collapse" href="#subnav1">
                                            <span class="sub-item">Level 1</span>
                                            <span class="caret"></span>
                                        </a>
                                        <div class="collapse" id="subnav1">
                                            <ul class="nav nav-collapse subnav">
                                                <li>
                                                    <a href="#">
                                                        <span class="sub-item">Level 2</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <span class="sub-item">Level 2</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <a data-bs-toggle="collapse" href="#subnav2">
                                            <span class="sub-item">Level 1</span>
                                            <span class="caret"></span>
                                        </a>
                                        <div class="collapse" id="subnav2">
                                            <ul class="nav nav-collapse subnav">
                                                <li>
                                                    <a href="#">
                                                        <span class="sub-item">Level 2</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="sub-item">Level 1</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>-->
                    </ul>
                </div>
            </div>
        </div>
        <!-- End Sidebar -->
    </body>
</html>