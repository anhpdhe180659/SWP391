<%-- 
    Document   : editUser
    Created on : Sep 22, 2024, 1:29:17 PM
    Author     : nhatk
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>View Room</title><!--  page only for manager  -->
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
        <!--        <link rel="stylesheet" href="assets/css/demo.css" />-->
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <jsp:include page="sidebarReceptionist.jsp"/>
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
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Room Detail</h3>
                        </div>



                        <div class="col-md-12">
                            <c:set value="${sessionScope.detailRoom}" var="u"/>
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Room ${u.roomNumber}</h4>
                                        <button class="btn btn-primary btn-round ms-auto" onclick="BackToList()">
                                            <i class="fas fa-angle-left"></i>
                                            Back to list
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Modal -->

                                    <div>
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <form action="updateRoomStatus"  method="POST">
                                                    <div class="modal-body">
                                                        <div class="modal-body">
                                                            <table class="table table-bordered">
                                                                <tbody>
                                                                    <tr>
                                                                        <th>Room Number</th>
                                                                        <td>${u.roomNumber}</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>Clean Status</th>
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${u.cleanId == 3}">Cleaned</c:when>
                                                                                <c:when test="${u.cleanId == 2}">In progress</c:when>
                                                                                <c:otherwise>Not clean</c:otherwise>
                                                                            </c:choose>
                                                                        </td>
                                                                    </tr>
                                                                    <c:forEach var="type" items="${sessionScope.roomType}">
                                                                        <c:if test="${u.typeId == type.typeId}">
                                                                            <tr>
                                                                                <th>Type Room</th>
                                                                                <td>${type.typeName}</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>Capacity</th>
                                                                                <td>${type.capacity}</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>Price</th>
                                                                                <td>${type.price}</td>
                                                                            </tr>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <tr>
                                                                        <th>Status</th>
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${u.statusId == 3}">Under Maintenance</c:when>
                                                                                <c:when test="${u.statusId == 2}">Occupied</c:when>
                                                                                <c:otherwise>Available</c:otherwise>
                                                                            </c:choose>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <footer class="footer">

                </footer>
            </div>

            <!-- Custom template | don't include it in your project! -->

            <!-- End Custom template -->
        </div>
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>
        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo2.js"></script>
        <script>
                                            document.querySelector('.close').editEventListener('click', function () {
                                                $('#editUserModal').modal('hide');
                                            });

        </script>

        <script>
            function doClose() {
                $('#editUserModal').modal('hide');
            }
        </script>
        <script>
            function BackToList() {
                window.location = "listRoom";
            }
        </script>

    </body>
</html>


