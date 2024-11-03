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
        <link rel="stylesheet" href="CSS/listRoom.css"/>

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <!--<link rel="stylesheet" href="assets/css/demo.css" />-->
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
                    <div class="container">
                        <div class="page-inner">
                            <div class="page-header">
                                <h1 class="fw-bold mb-3">Room</h1>
                            </div>
                            <div class="col-md-12">
                                <div class="card">

                                    <div class="card-body row">
                                        <h3 class="fw-bold mb-3">Room Filter</h3>
                                        <form action="listRoom">
                                            <span>Type</span>
                                            <select class="form-select-sm col-2 me-3" name="typeId">
                                                <option value="0" ${requestScope.typeId == '0' ? 'selected' : ''}>All</option>
                                                <c:forEach var="type" items="${sessionScope.roomType}">
                                                    <option value="${type.typeId}" ${requestScope.typeId == type.typeId ? 'selected' : ''}>
                                                        ${type.typeName}
                                                    </option>
                                                </c:forEach>
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
                                    <div class="card-header">
                                        <div class="d-flex align-items-center">
                                            <nav
                                                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                                                >
                                                <c:set value="${requestScope.keyword} " var="n"/>
                                                <form action="listRoom">
                                                    <div class="input-group" >
                                                        <div class="input-group-prepend">
                                                            <button type="submit" class="btn btn-search pe-1">
                                                                <i class="fa fa-search search-icon"></i>
                                                            </button>
                                                        </div>
                                                        <c:if test="${n.length() < 2}">
                                                            <input
                                                                type="text"
                                                                name="keyword"
                                                                placeholder="Search room by room number..."
                                                                class="form-control"
                                                                />
                                                        </c:if>
                                                        <c:if test="${n.length() > 1}">
                                                            <input
                                                                type="text"
                                                                name="keyword"
                                                                value="${n}"
                                                                placeholder="Search room by room number..."
                                                                class="form-control"
                                                                />
                                                        </c:if>
                                                    </div>
                                                </form>
                                            </nav>
                                            <c:set value="${requestScope.noti}" var="noti" />
                                        </div>
                                    </div>
                                    <div class="card-body row">
                                        <c:forEach items="${sessionScope.listRoom}" var="s">
                                            <div class="card col-3 m-5 p-3" style="border-radius: 10px; box-shadow:  1px 1px 1px grey">
                                                <div  class="card-header">
                                                    <h1 class="text-secondary"><i class="fas fa-home"> Room: ${s.roomNumber}</i></h1>
                                                    <c:if test="${s.statusId == 2}">
                                                        <c:forEach items="${sessionScope.unpaidBooking}" var="b">
                                                            <c:if test="${s.roomId == b.roomID}"> 
                                                                <c:forEach items="${sessionScope.bookings}" var="bk">
                                                                    <c:if test="${b.bookingID == bk.bookingID}">
                                                                        <c:forEach items="${sessionScope.guests}" var="g">
                                                                            <c:if test="${bk.guestID == g.guestID}">
                                                                                <div class="title-header">
                                                                                    <h5 style="color: red"><i class="fas fa-user-alt">Guest:  ${g.name}</i></h5>
                                                                                </div>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                    <div class="button-header">
                                                        <c:choose>
                                                            <c:when test="${s.statusId == 1}">
                                                                <a class="button" href="booking">Book now</a>
                                                                <button class="maintaince button btn-warning" data-room-id="${s.roomId}" >Maintance</button>
                                                            </c:when>
                                                            <c:when test="${s.statusId == 2}">
                                                                <c:forEach items="${sessionScope.unpaidBooking}" var="bk">
                                                                    <c:if test="${bk.roomID == s.roomId}">
                                                                        <a role="button" class="button " href="checkout?bookingId=${bk.bookingID}">Check out</a>
                                                                        <a role="button" class="button " href="addServiceBooking?bookingId=${bk.bookingID}&roomId=${s.roomId}">Add Service</a>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:when test="${s.statusId == 3}">
                                                                <button id="${s.roomId}" data-room-id="${s.roomId}" class="available button btn-success">Available</button>
                                                            </c:when>
                                                        </c:choose>
                                                        <a role="button" class="button " href="viewDetail?roomId=${s.roomId}">View detail</a>
                                                    </div> 
                                                </div>
                                                <div class="card card-body">
                                                    <c:if test="${s.statusId == 3}">
                                                        <p class="text text-warning" style="font-size: 20px"><b>Under maintaince</b></p>
                                                    </c:if>
                                                    <c:choose>
                                                        <c:when test="${s.cleanId == 1}">
                                                            <p><b>Cleaning status: </b>Not Cleaned</p>
                                                        </c:when>
                                                        <c:when test="${s.cleanId == 2}">
                                                            <p><b>Cleaning status: </b>In progress</p>
                                                        </c:when>
                                                        <c:when test="${s.cleanId == 3}">
                                                            <p><b>Cleaning status: </b>Cleaned</p>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <c:set value="${sessionScope.currentindex}" var="index" />
                                        <c:set value="${sessionScope.Nopage}" var="Nopage" />
                                        <div class="card-body" >
                                            <div class="demo">
                                                <ul class="pagination pg-primary" style="display: flex; justify-content: flex-end;">
                                                    <div style="width: 100px; align-content: end">${index} of ${Nopage} page</div>
                                                    <li class="page-item ${index < 3 ? 'disabled' :'' } ">
                                                        <a class="page-link" href="listRoom?index=${index-1}&typeId=${requestScope.typeId}&statusId=${requestScope.statusId}&cleanId=${requestScope.cleanId}" aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                            <span class="sr-only">Previous</span>
                                                        </a>
                                                    </li>
                                                    <c:choose>
                                                        <c:when test="${index <= 3}">
                                                            <c:set var="startPage" value="1" />
                                                            <c:set var="endPage" value="${Nopage > 6 ? 6 : Nopage}" />
                                                        </c:when>
                                                        <c:when test="${index > Nopage - 3}">
                                                            <c:set var="startPage" value="${Nopage - 6 > 0 ? Nopage - 6 : 1}" />
                                                            <c:set var="endPage" value="${Nopage}" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set var="startPage" value="${index - 3}" />
                                                            <c:set var="endPage" value="${index + 3}" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:forEach var="p" begin="${startPage}" end="${endPage}">
                                                        <c:if test="${index == p}">
                                                            <li class="page-item active">
                                                                <a class="page-link" href="listRoom?index=${p}&typeId=${requestScope.typeId}&statusId=${requestScope.statusId}&cleanId=${requestScope.cleanId}">${p}</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${index != p}">
                                                            <li class="page-item">
                                                                <a class="page-link" href="listRoom?index=${p}&typeId=${requestScope.typeId}&statusId=${requestScope.statusId}&cleanId=${requestScope.cleanId}">${p}</a>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                    <li class="page-item ${index < Nopage ? '' :'disabled' }" >
                                                        <a class="page-link" href="listRoom?index=${index+1}&typeId=${requestScope.typeId}&statusId=${requestScope.statusId}&cleanId=${requestScope.cleanId}" aria-label="Next">
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
                const currentUrl = window.location.href;
                console.log(currentUrl);
                $(document).ready(function () {
                    $('.available').on('click', function () {
                        const roomId = $(this).data('room-id'); // Get room ID from data attribute
                        const field = 'statusId'; // Get field name from data attribute
                        const value = 1; // Get selected value
                        console.log(field);
                        // AJAX call to update the database
                        $.ajax({
                            url: 'updateRoomStatus', // Your servlet URL
                            method: 'POST',
                            data: {
                                roomId: roomId,
                                field: field,
                                value: value
                            },
                            success: function (response) {
                                console.log(swal);
                                // Handle success, you can show a notification or update the UI
                                swal({
                                    icon: "success",
                                    text: 'Update successful'
                                }).then(() => {
                                    window.location = currentUrl;
                                });
                            },
                            error: function (xhr, status, error) {
                                // Handle error
                                alert('Update failed.');
                            }
                        });
                    });
                });


                $(document).ready(function () {
                    $('.maintaince').on('click', function () {
                        const roomId = $(this).data('room-id'); // Get room ID from data attribute
                        const field = 'statusId'; // Get field name from data attribute
                        const value = 3; // Get selected value
                        console.log(field);
                        // AJAX call to update the database
                        $.ajax({
                            url: 'updateRoomStatus', // Your servlet URL
                            method: 'POST',
                            data: {
                                roomId: roomId,
                                field: field,
                                value: value
                            },
                            success: function (response) {
                                console.log(swal);
                                // Handle success, you can show a notification or update the UI
                                swal({
                                    icon: "success",
                                    text: 'Update successful'
                                }).then(() => {
                                    window.location = currentUrl;
                                })
                            },
                            error: function (xhr, status, error) {
                                // Handle error
                                alert('Update failed:');
                            }
                        });
                    });
                });
        </script>
        <script>

        </script>
    </body>
</html>

