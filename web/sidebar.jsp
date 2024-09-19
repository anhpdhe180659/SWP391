<%-- 
    Document   : sidebar.jsp
    Created on : Sep 19, 2024, 8:05:03 AM
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
                        <a href="index.jsp" class="logo">
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
                <div class="sidebar-wrapper scrollbar scrollbar-inner">
                    <div class="sidebar-content">
                        <ul class="nav nav-secondary">
                            <li class="nav-item active">
                                <a
                                    data-bs-toggle="collapse"
                                    href="#dashboard"
                                    class="collapsed"
                                    aria-expanded="false"
                                    >
                                    <i class="fas fa-home"></i>
                                        <p>Dashboard</p>
                                </a>
                            </li>
                            <li class="nav-section">
                                <span class="sidebar-mini-icon">
                                    <i class="fa fa-ellipsis-h"></i>
                                </span>
                                <h4 class="text-section">Components</h4>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#base">
                                    <i class="fas fa-layer-group"></i>
                                    <p>Base</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="base">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="avatars.jsp">
                                                <span class="sub-item">Avatars</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="buttons.jsp">
                                                <span class="sub-item">Buttons</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="gridsystem.jsp">
                                                <span class="sub-item">Grid System</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="panels.jsp">
                                                <span class="sub-item">Panels</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="notifications.jsp">
                                                <span class="sub-item">Notifications</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="sweetalert.jsp">
                                                <span class="sub-item">Sweet Alert</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="font-awesome-icons.jsp">
                                                <span class="sub-item">Font Awesome Icons</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="simple-line-icons.jsp">
                                                <span class="sub-item">Simple Line Icons</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="typography.jsp">
                                                <span class="sub-item">Typography</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#sidebarLayouts">
                                    <i class="fas fa-th-list"></i>
                                    <p>Sidebar Layouts</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="sidebarLayouts">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="sidebar-style-2.jsp">
                                                <span class="sub-item">Sidebar Style 2</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="icon-menu.jsp">
                                                <span class="sub-item">Icon Menu</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#forms">
                                    <i class="fas fa-pen-square"></i>
                                    <p>Forms</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="forms">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="forms.jsp">
                                                <span class="sub-item">Basic Form</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#tables">
                                    <i class="fas fa-table"></i>
                                    <p>Tables</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="tables">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="tables.jsp">
                                                <span class="sub-item">Basic Table</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="datatables.jsp">
                                                <span class="sub-item">Datatables</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#maps">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <p>Maps</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="maps">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="googlemaps.jsp">
                                                <span class="sub-item">Google Maps</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="jsvectormap.jsp">
                                                <span class="sub-item">Jsvectormap</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
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
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End Sidebar -->
    </body>
</html>
