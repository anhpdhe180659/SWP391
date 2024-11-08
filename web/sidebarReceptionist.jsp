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
                    <a href="guestHomePage.jsp" class="logo">
                        <img
                            src="img/logo/logoAdmin.png"
                            alt="navbar brand"
                            class="navbar-brand"
                            height="120"
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
                                href="receptionDashboard"
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
                                <i class="fas fa-bed"></i>
                                <p>Room</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="base">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="listRoom">
                                            <span class="sub-item">View Room</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#sidebarLayouts">
                                <i class="fas fa-address-book"></i>
                                <p>Booking</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="sidebarLayouts">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="booking">
                                            <span class="sub-item">Create booking</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="bookingList">
                                            <span class="sub-item">View booking</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                         <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#forms">
                                <i class="fas fa-pen-square"></i>
                                <p>Guest</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="forms">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="listGuest">
                                            <span class="sub-item">Guest</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#tables">
                                <i class="fas fa-money-bill"></i>
                                <p>Invoice</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="tables">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="listInvoice">
                                            <span class="sub-item">Invoice</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            
                        </li>
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#C">
                                <i class="fas fa-bell"></i>
                                <p>Notifications</p>
                                <span class="caret"></span>
                            </a>
                            <div class="collapse" id="C">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="viewNotification">
                                            <span class="sub-item">All Notifications</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            
                        </li> 
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#X">
                                <i class="fas fa-bell"></i>
                                <p>Request Cleaning Room</p>
                                <span class="caret"></span> 
                            </a>  
                               <div class="collapse" id="X">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="RequestCleaningRoom">
                                            <span class="sub-item">Request</span>
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
