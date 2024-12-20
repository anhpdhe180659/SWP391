<%-- 
    Document   : editUser
    Created on : Sep 22, 2024, 1:29:17 PM
    Author     : nhatk
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Edit Room</title><!--  page only for manager  -->
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
        <link rel="stylesheet" href="CSS/roomDetailAdmin.css"/>
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <!--        <link rel="stylesheet" href="assets/css/demo.css" />-->
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
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Room Detail</h3>
                        </div>



                        <div class="col-md-12">
                            <c:set value="${sessionScope.detailRoomAdmin}" var="u"/>
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
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
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
                                                                    <td><fmt:formatNumber value="${type.price}" type="currency" currencyCode="VND"/></td>
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
            <div class="warning hidden" style="margin-right: 25px; font-weight: bold;color: darkorange">
                <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                <p>Update fail !</p>
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
        var warning = document.querySelector('.warning');
        var success = document.querySelector('.success');
        var overlay = document.querySelector('.overlay');
        var noti = '${requestScope.noti}';

        if (noti !== '') {
            overlay.classList.add('show-overlay'); // Show the overlay to blur background
            switch (noti) {
                case 'Update room successful !':
                    success.classList.toggle('show');
                    setTimeout(function () {
                        success.classList.toggle('show');
                        overlay.classList.remove('show-overlay'); // Hide overlay after the notification disappears
                    }, 1500);
                    break;
                default:
                    warning.classList.toggle('show');
                    setTimeout(function () {
                        warning.classList.toggle('show');
                        overlay.classList.remove('show-overlay'); // Hide overlay after the notification disappears
                    }, 1500);
            }
        }

    </script>
    <script>
        var capacity = document.querySelector('.capacity');
        var price = document.querySelector('.price');
        var type = document.querySelector('select[name="typeId"]'); // Reference the room type select element
        switch (type.value) {
            case '1': // Single Room
                capacity.value = 1;
                price.value = 500000;
                break;
            case '2': // Double Room
                capacity.value = 2;
                price.value = 800000;
                break;
            case '3': // Family Room
                capacity.value = 4;
                price.value = 1500000;
                break;
            case '4': // Deluxe Room
                capacity.value = 2;
                price.value = 2000000;
                break;
            case '5': // President Room
                capacity.value = 2;
                price.value = 5000000;
                break;
        }
        type.addEventListener('change', function () {
            switch (this.value) {
                case '1': // Single Room
                    capacity.value = 1;
                    price.value = 500000;
                    break;
                case '2': // Double Room
                    capacity.value = 2;
                    price.value = 800000;
                    break;
                case '3': // Family Room
                    capacity.value = 4;
                    price.value = 1500000;
                    break;
                case '4': // Deluxe Room
                    capacity.value = 2;
                    price.value = 2000000;
                    break;
                case '5': // President Room
                    capacity.value = 2;
                    price.value = 5000000;
                    break;
            }
        });

        console.log(price);
        console.log(capacity);
    </script>

    <script>
        function doClose() {
            $('#editUserModal').modal('hide');
        }
    </script>
    <script>
        function BackToList() {
            window.location = "listRoomAdmin";
        }
    </script>

    <script>
        $(document).ready(function () {
            $("#basic-datatables").DataTable({});
            $("#multi-filter-select").DataTable({
                pageLength: 5,
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
            // edit Row
            $("#edit-user").DataTable({
                pageLength: 5,
            });
            var action =
                    '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';
            $("#editUserButton").click(function () {
                $("#edit-user")
                        .dataTable()
                        .fneditData([
                            $("#editName").val(),
                            $("#editPosition").val(),
                            $("#editOffice").val(),
                            action,
                        ]);
                $("#editUserModal").modal("hide");
            });
        });
    </script>

</body>
</html>


