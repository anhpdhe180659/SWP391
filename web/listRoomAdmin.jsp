<%-- 
    Document   : dashboard
    Created on : Sep 21, 2024, 7:57:19 PM
    Author     : nhatk
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
            href="img/logo/logo.png"
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
                    <div class="container">
                        <div class="page-inner">
                            <div class="page-header row">
                                <h2 class="fw-bold mb-3 col-12">Room</h2>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="d-flex align-items-center">
                                            <nav
                                                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                                                >
                                                <c:set value="${requestScope.searchName} " var="n"/>
                                                <form action="searchUser">
                                                    <div class="input-group" >
                                                        <div class="input-group-prepend">
                                                            <button type="submit" class="btn btn-search pe-1">
                                                                <i class="fa fa-search search-icon"></i>
                                                            </button>
                                                        </div>
                                                        <c:if test="${n.length() < 2}">
                                                            <input
                                                                type="text"
                                                                name="username"
                                                                placeholder="Search room..."
                                                                class="form-control"
                                                                />
                                                        </c:if>
                                                        <c:if test="${n.length() > 1}">
                                                            <input
                                                                type="text"
                                                                name="username"
                                                                value="${n}"
                                                                placeholder="Search room..."
                                                                class="form-control"
                                                                />
                                                        </c:if>
                                                    </div>
                                                </form>
                                            </nav>
                                            <c:set value="${requestScope.noti}" var="noti" />

                                            <button
                                                class="btn btn-primary btn-round ms-auto"
                                                onclick="addRoom()">
                                                <i class="fa fa-plus"></i>
                                                Add Room
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body row">

                                        <h3 class="fw-bold mb-3">Room Filter</h3>
                                        <form action="listRoomAdmin">
                                            <span>Type</span>
                                            <select class="form-select-sm col-2 me-3" name="typeId">
                                                <option value="0" ${requestScope.typeId == '0' ? 'selected' : ''}>All</option>
                                                <option value="1" ${requestScope.typeId == '1' ? 'selected' : ''}>Single Room</option>
                                                <option value="2" ${requestScope.typeId == '2' ? 'selected' : ''}>Double Room</option>
                                                <option value="3" ${requestScope.typeId == '3' ? 'selected' : ''}>Family Room</option>
                                                <option value="4" ${requestScope.typeId == '4' ? 'selected' : ''}>Deluxe Room</option>
                                                <option value="5" ${requestScope.typeId == '5' ? 'selected' : ''}>President Room</option>
                                            </select>

                                            <span>Status</span>
                                            <select class="form-select-sm col-2 me-3" name="statusId">
                                                <option value="0" ${requestScope.statusId == '0' ? 'selected' : ''}>All</option>
                                                <option value="1" ${requestScope.statusId == '1' ? 'selected' : ''}>Available</option>
                                                <option value="2" ${requestScope.statusId == '2' ? 'selected' : ''}>Occupied</option>
                                                <option value="3" ${requestScope.statusId == '3' ? 'selected' : ''}>Under maintenance</option>
                                            </select>

                                            <span>Clean Status</span>
                                            <select class="form-select-sm col-2" name="cleanId">
                                                <option value="0" ${requestScope.cleanId == '0' ? 'selected' : ''}>All</option>
                                                <option value="1" ${requestScope.cleanId == '1' ? 'selected' : ''}>Not Cleaned</option>
                                                <option value="2" ${requestScope.cleanId == '2' ? 'selected' : ''}>In Progress</option>
                                                <option value="3" ${requestScope.cleanId == '3' ? 'selected' : ''}>Cleaned</option>
                                            </select>

                                            <button class="btn btn-label-info ms-4" type="submit">Filter</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="add-user" class="display table table-striped table-hover" >
                                                <thead>
                                                    <tr>
                                                        <th>Room Number</th>
                                                        <th>Clean Status</th>
                                                        <th>Type</th>
                                                        <th>Room Status</th>
                                                        <th style="text-align: center" colspan="2">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.listRoom}" var="s">
                                                        <tr>
                                                            <td>${s.roomNumber}</td>
                                                            <c:if test="${s.cleanId == 1}">
                                                                <td class="text-warning">
                                                                    Not cleaned
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${s.cleanId == 2}">
                                                                <td class="text-info">
                                                                    In progress
                                                                </td>
                                                            </c:if><c:if test="${s.cleanId == 3}">
                                                                <td class="text-success">
                                                                    Cleaned
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${s.typeId == 1}">
                                                                <td>
                                                                    Single Room
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${s.typeId == 2}">
                                                                <td>
                                                                    Double Room
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${s.typeId == 3}">
                                                                <td>
                                                                    Family Room
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${s.typeId == 4}">
                                                                <td>
                                                                    Deluxe Room
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${s.typeId == 5}">
                                                                <td>
                                                                    President Room
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${s.statusId == 1}">
                                                                <td class="text-bg-success">
                                                                    Available
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${s.statusId == 3}">
                                                                <td class="text-bg-warning">
                                                                    Under Maintenance
                                                                </td>
                                                            </c:if><c:if test="${s.statusId == 2}">
                                                                <td class="text-bg-info">
                                                                    Occupied
                                                                </td>
                                                            </c:if>
                                                            <td style="text-align: center">
                                                                <a href="viewDetailAdmin?id=${s.roomId}"
                                                                   <i class="far fa-eye me-3"></i>&nbsp;&nbsp;View
                                                                </a>
                                                            </td>
                                                            <td style="text-align: center">
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" checked>
                                                                    <label class="form-check-label text-danger" for="flexSwitchCheckDefault">Active/De-active</label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    <c:if test="${requestScope.noti != null}">
                                                        <tr >
                                                            <td style="text-align: center" colspan="5"><p class="text-warning">${requestScope.noti}</p></td><!-- comment --></tr>
                                                            </c:if>
                                                </tbody>
                                            </table>
                                            <c:set value="${sessionScope.currentindex}" var="index" />
                                            <c:set value="${sessionScope.Nopage}" var="Nopage" />
                                            <div class="card-body" >
                                                <div class="demo">
                                                    <ul class="pagination pg-primary" style="display: flex; justify-content: flex-end;">
                                                        <div style="width: 100px; align-content: end">${index} of ${Nopage} page</div>
                                                        <li class="page-item ${index < 2 ? 'disabled' :'' } ">
                                                            <a class="page-link" href="listRoomAdmin?index=${index-1}&typeId=${requestScope.typeId}&statusId=${requestScope.statusId}&cleanId=${requestScope.cleanId}" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                        </li>
                                                        <c:choose>
                                                            <c:when test="${index <= 3}">
                                                                <c:set var="startPage" value="1" />
                                                                <c:set var="endPage" value="${Nopage > 5 ? 5 : Nopage}" />
                                                            </c:when>
                                                            <c:when test="${index > Nopage - 3}">
                                                                <c:set var="startPage" value="${Nopage - 4 > 0 ? Nopage - 4 : 1}" />
                                                                <c:set var="endPage" value="${Nopage}" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="startPage" value="${index - 2}" />
                                                                <c:set var="endPage" value="${index + 2}" />
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:forEach var="p" begin="${startPage}" end="${endPage}">
                                                            <c:if test="${index == p}">
                                                                <li class="page-item active">
                                                                    <a class="page-link" href="listRoomAdmin?index=${p}&typeId=${requestScope.typeId}&statusId=${requestScope.statusId}&cleanId=${requestScope.cleanId}">${p}</a>
                                                                </li>
                                                            </c:if>
                                                            <c:if test="${index != p}">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="listRoomAdmin?index=${p}&typeId=${requestScope.typeId}&statusId=${requestScope.statusId}&cleanId=${requestScope.cleanId}">${p}</a>
                                                                </li>
                                                            </c:if>
                                                        </c:forEach>
                                                        <li class="page-item ${index < Nopage ? '' :'disabled' }" >
                                                            <a class="page-link" href="listRoomAdmin?index=${index+1}&typeId=${requestScope.typeId}&statusId=${requestScope.statusId}&cleanId=${requestScope.cleanId}" aria-label="Next">
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
                                                    function addRoom() {
                                                        window.location = 'addRoom';
                                                    }
        </script>
        <script>
            $(document).ready(function () {
                $("#basic-datatables").DataTable({
                });
                $("#multi-filter-select").DataTable({
                    pageLength: 10,
                    initComplete: function () {
                        this.api()
                                .columns()
                                .every(function () {
                                    var column = this;
                                    var select = $(
                                            '<select class="form-select"><option value=""></option></select>'
                                            )
                                            .appendTo($(column.footer()).empty())
                                            .on("change", function () {
                                                var val = $.fn.dataTable.util.escapeRegex($(this).val());
                                                column
                                                        .search(val ? "^" + val + "$" : "", true, false)
                                                        .draw();
                                            });

                                    column
                                            .data()
                                            .unique()
                                            .sort()
                                            .each(function (d, j) {
                                                select.append(
                                                        '<option value="' + d + '">' + d + "</option>"
                                                        );
                                            });
                                });
                    },
                });

                //             Add Row

            });
        </script>
    </body>
</html>

