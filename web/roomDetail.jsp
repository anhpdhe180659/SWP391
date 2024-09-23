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
        <title>Edit user</title><!--  page only for manager  -->
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
                    <!-- Navbar Header -->
                    <nav
                        class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
                        >
                        <div class="container-fluid">
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
                                <!--Notification-->


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
                                            <span class="fw-bold">${sessionScope.employee.name}</span>
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
                                                        <h4>${sessionScope.employee.name}</h4>
                                                        <p class="text-muted">${sessionScope.user.email}</p>
                                                        <a
                                                            href="profile.html"
                                                            class="btn btn-xs btn-secondary btn-sm"
                                                            >View Profile</a
                                                        >
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">My Profile</a>
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
                                        <!--                                        <button
                                                                                    class="btn btn-primary btn-round ms-auto"
                                                                                    data-bs-toggle="modal"
                                                                                    data-bs-target="#editUserModal"
                                                                                    >
                                                                                    <i class="fa fa-plus"></i>
                                                                                    Edit User
                                                                                </button>-->
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Modal -->

                                    <div>
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <form action="updateRoomStatus"  method="POST">

                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Room Number</label>
                                                                    <input
                                                                        name="roomNumber"
                                                                        type="text"
                                                                        class="form-control"
                                                                        value="${u.roomNumber}"
                                                                        readonly
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Clean Status</label>                  
                                                                    <select name="cleanId" class="form-control">
                                                                        <option value="3"
                                                                                <c:if test="${u.cleanId == 3}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Cleaned</option>
                                                                        <option value="2"
                                                                                <c:if test="${u.cleanId == 2}">
                                                                                    selected
                                                                                </c:if>
                                                                                >In progress</option>
                                                                        <option value="1"
                                                                                <c:if test="${u.cleanId == 1}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Not clean</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Type Room</label>                  
                                                                    <c:if test="${u.typeId == 5}">
                                                                        <input
                                                                            name="typeId"
                                                                            type="text"
                                                                            class="form-control room-type"
                                                                            value="President"
                                                                            readonly
                                                                            />
                                                                    </c:if>
                                                                    <c:if test="${u.typeId == 4}">
                                                                        <input
                                                                            name="typeId"
                                                                            type="text"
                                                                            class="form-control room-type"
                                                                            value="Deluxe Room"
                                                                            readonly
                                                                            />
                                                                    </c:if>
                                                                    <c:if test="${u.typeId == 3}">
                                                                        <input
                                                                            name="typeId"
                                                                            type="text"
                                                                            class="form-control room-type"
                                                                            value="Family Room"
                                                                            readonly
                                                                            />
                                                                    </c:if>
                                                                    <c:if test="${u.typeId == 2}">
                                                                        <input
                                                                            name="typeId"
                                                                            type="text"
                                                                            class="form-control room-type"
                                                                            value="Double Room"
                                                                            readonly
                                                                            />
                                                                    </c:if>
                                                                    <c:if test="${u.typeId == 1}">
                                                                        <input
                                                                            name="typeId"
                                                                            type="text"
                                                                            class="form-control room-type"
                                                                            value="Single Room"
                                                                            readonly
                                                                            />
                                                                    </c:if>
                                                                </div>
                                                                <div class="form-group form-group-default">
                                                                    <label>Capacity</label>
                                                                    <input
                                                                        type="text"
                                                                        class="form-control capacity"
                                                                        readonly
                                                                        />
                                                                </div>
                                                                <div class="form-group form-group-default">
                                                                    <label>Price</label>
                                                                    <input
                                                                        type="text"
                                                                        class="form-control price"
                                                                        readonly
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Status</label>                  
                                                                    <select name="statusId" class="form-control">
                                                                        <option class="text-warning" value="3"
                                                                                <c:if test="${u.statusId == 3}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Under Maintainance</option>
                                                                        <option class="text-danger" value="2"
                                                                                <c:if test="${u.statusId == 2}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Occupied</option>
                                                                        <option class="text-success" value="1"
                                                                                <c:if test="${u.statusId == 1}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Available</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="text" name="roomId" value="${u.roomId}" hidden="">
                                                    <div class="modal-footer border-0">
                                                        <c:set value="${requestScope.noti}" var="noti"/>
                                                        <div style="margin-right: 25px; font-weight: bold;color: darkorange">${noti}</div>
                                                        <button
                                                            type="reset"
                                                            class="btn btn-danger">
                                                            Reset
                                                        </button>&nbsp;
                                                        <button
                                                            type="submit"
                                                            class="btn btn-primary">
                                                            Save
                                                        </button>
                                                    </div>
                                                </form>
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
        var capacity = document.querySelector('.capacity');
        var price = document.querySelector('.price');
        var type = document.querySelector('.room-type');
        console.log(price);
        console.log(capacity);
        switch (type.value) {
            case 'Single Room' :
                capacity.value = 1;
                price.value = 500000;
                break;
            case 'Double Room' :
                capacity.value = 2;
                price.value = 800000;
                break;
            case 'Family Room' :
                capacity.value = 4;
                price.value = 1500000;
                break;
            case 'Deluxe Room' :
                capacity.value = 2;
                price.value = 2000000;
                break;
            case 'President Room' :
                capacity.value = 2;
                price.value = 5000000;
                break;
        }
    </script>
    <script>
        function doClose() {
            $('#editUserModal').modal('hide');
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


