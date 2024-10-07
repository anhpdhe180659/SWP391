<%-- 
    Document   : navbar-header
    Created on : Sep 26, 2024, 7:55:02 AM
    Author     : phand
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navbar Header -->
<nav
    class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
    >
    <div class="container-fluid">
        <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
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
                        <!-- Sidebar -->
                        <span class="fw-bold">
                                    ${sessionScope.user.name}
                        </span>
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
                                    <h4>${sessionScope.user.name}</h4>
                                    <p class="text-muted">${sessionScope.user.email}</p>
                                    <a
                                        href="ViewProfileServlet?userId=${sessionScope.user.userID}"
                                        class="btn btn-xs btn-secondary btn-sm"
                                        >View Profile</a
                                    >
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="ViewProfileServlet?userId=${sessionScope.user.userID}">My Profile</a>
                            <a class="dropdown-item" href="changePassword.jsp">Change Password</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Account Setting</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="logout">Logout</a>
                        </li>
                    </div>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<!-- End Navbar -->