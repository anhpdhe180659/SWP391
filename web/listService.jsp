<%-- 
    Document   : listServices
    Created on : Sep 23, 2024, 4:25:24 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>List Service</title><!--  page only for manager  -->
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
            <jsp:include page="sidebarManager.jsp"/>
            <!-- End Sidebar -->
            <div class="main-panel">
                <div class="main-header">
                    <div class="main-header-logo">
                        <!-- Logo Header -->
                        <div class="logo-header" data-background-color="dark">
                            <a href="../index.jsp" class="logo">
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
                                            <span class="fw-bold">${sessionScope.user.username}</span>
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
                                                        <h4>${sessionScope.user.username}</h4>
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
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Manage Service</h3>
                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Add Service</h4>
                                        <button
                                            class="btn btn-primary btn-round ms-auto"
                                            data-bs-toggle="modal"
                                            data-bs-target="#addUserModal"
                                            >
                                            <i class="fa fa-plus"></i>
                                            Add Service
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Modal -->
                                    <div
                                        class="modal fade"
                                        id="addUserModal"
                                        tabindex="-1"
                                        role="dialog"
                                        aria-hidden="true"
                                        >
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header border-0">
                                                    <h5 class="modal-title">
                                                        <span class="fw-mediumbold"> New</span>
                                                        <span class="fw-light"> Service </span>
                                                    </h5>
                                                </div>
                                                <form action="addService" onsubmit="return validate()">
                                                    <div class="modal-body">
                                                        <p class="small">
                                                            Create a new service, make sure you
                                                            fill them all
                                                        </p>

                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Name</label>
                                                                    <input
                                                                        name="name"
                                                                        type="text"
                                                                        class="form-control"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Price</label>
                                                                    <input
                                                                        name="price"
                                                                        type="text"
                                                                        class="form-control"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            
                                                            
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer border-0">
                                                        <button
                                                            type="button submit"
                                                            class="btn btn-primary">
                                                            Add
                                                        </button>
                                                        <a onclick="doClose()">
                                                            <button
                                                                type="button"
                                                                class="btn btn-danger"
                                                                data-dismiss="modal"
                                                                aria-label="Close"
                                                                >
                                                                Close
                                                            </button>
                                                        </a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="table-responsive">
                                        <table id="add-user" class="display table table-striped table-hover" >
                                            <!--                                            <div class="table-responsive">
                                                                                    <table id="add-user" class="display table table-striped table-hover" >-->
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th style="width: 10%">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listService}" var="sv">
                                                    <tr>
                                                        <td>${sv.name}</td>
                                                        <td>${sv.price}</td>                                                      
                                                        <td>
                                                            <div class="form-button-action">
                                                                <a href="editService?serviceid=${sv.serviceID}" >
                                                                    <button
                                                                        type="button"
                                                                        data-bs-toggle="tooltip"
                                                                        title=""
                                                                        class="btn btn-link btn-primary btn-lg"
                                                                        data-original-title="Edit Task"
                                                                        >
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                </a>
                                                                <button
                                                                    type="button"
                                                                    title=""
                                                                    class="btn btn-link btn-danger"
                                                                    data-original-title="Remove"
                                                                    onclick="doDelete(${sv.serviceID})"
                                                                    >
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
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
                                                                        document.querySelector('.close').addEventListener('click', function () {
                                                                            $('#addUserModal').modal('hide');
                                                                        });
        </script>
        <script>
            function doClose() {
                $('#addUserModal').modal('hide');
            }
        </script>
        <script>
            function validate() {
                var email = document.getElementById("email").value;
                var regex1 = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;

                if (!regex1.test(email)) {
                    alert("Please enter a valid Email address (example@gmail.com)");
                    document.getElementById("email").focus();
                    return false;
                }
                return true;
            }
        </script>
        <script>
            function doDelete(serviceid) {
                var option = confirm("Are you sure? You won't be able to revert this");
                if (option === true) {
                    window.location = "deleteService?serviceid=" + serviceid;
                }
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

                // Add Row
                $("#add-user").DataTable({
                    pageLength: 5,
                });

                var action =
                        '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

                $("#addUserButton").click(function () {
                    $("#add-user")
                            .dataTable()
                            .fnAddData([
                                $("#addName").val(),
                                $("#addPosition").val(),
                                $("#addOffice").val(),
                                action,
                            ]);
                    $("#addUserModal").modal("hide");
                });
            });
        </script>
    </body>
</html>
