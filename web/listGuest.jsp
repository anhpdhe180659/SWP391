<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>List Guests</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="img/logo/favicon.png" type="image/x-icon" />

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
                            <h3 class="fw-bold mb-3">Guest List</h3>
                        </div>

                        <!-- Thông báo -->
                        <c:if test="${not empty success}">
                            <div id="success-alert" class="alert alert-success">
                                ${success}
                            </div>
                        </c:if>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center justify-content-between mb-3">
                                        <button class="btn btn-primary btn-round" onclick="addGuest()">
                                            <i class="fa fa-plus"></i> Add Guest
                                        </button>
                                        <button class="btn btn-primary btn-round" onclick="viewHiddenGuests()">
                                            <i class="fa fa-eye"></i> View Hidden Guests
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="display table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="background-color: #b6e8f3; border-right: 1px solid #ddd;">Guest ID</th>
                                                    <th style="background-color: #b6e8f3; border-right: 1px solid #ddd;">Name</th>
                                                    <th style="background-color: #b6e8f3; border-right: 1px solid #ddd;">Date of Birth</th>
                                                    <th style="background-color: #b6e8f3; border-right: 1px solid #ddd;">Gender</th>
                                                    <th style="background-color: #b6e8f3; border-right: 1px solid #ddd;">Phone</th>
                                                    <th style="background-color: #b6e8f3; border-right: 1px solid #ddd;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listGuest}" var="g">
                                                    <c:if test="${g.isHidden == 0}">
                                                        <tr>
                                                            <td style="border-right: 1px solid #ddd;">${g.guestID}</td>
                                                            <td style="border-right: 1px solid #ddd;">${g.name}</td>
                                                            <td style="border-right: 1px solid #ddd;">${g.dateOfBirth}</td>
                                                            <td style="border-right: 1px solid #ddd;">
                                                                <c:choose>
                                                                    <c:when test="${g.sex == 1}">
                                                                        <img src="assets/img/male-icon.png" alt="Male" title="Male"/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="assets/img/female-icon.png" alt="Female" title="Female"/>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td style="border-right: 1px solid #ddd;">${g.phone}</td>
                                                            <td style="border-right: 1px solid #ddd;">
                                                                <div class="form-button-action">
                                                                    <a href="editGuest?guestID=${g.guestID}">
                                                                        <button type="button" class="btn btn-link btn-success btn-lg">
                                                                            <i class="fa fa-edit"></i>Edit
                                                                        </button>
                                                                    </a>
                                                                    <button type="button" class="btn btn-link btn-danger" onclick="doHidden(${g.guestID})">
                                                                        <i class="fa fa-times"></i>Hide
                                                                    </button>
                                                                    <a href="viewGuest?guestID=${g.guestID}">
                                                                        <button type="button" class="btn btn-link btn-info">
                                                                            <i class="fa fa-eye"></i> View Details
                                                                        </button>
                                                                    </a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer class="footer">
                <!-- Add your footer content here -->
            </footer>
        </div>

        <!-- Scripts -->
        <script src="assets/js/core/jquery.3.2.1.min.js"></script>
        <script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>


        <script>
                                                                        $(document).ready(function () {
                                                                            $('.table').DataTable();
                                                                        });

                                                                        function addGuest() {
                                                                            window.location.href = "addGuest";
                                                                        }

                                                                        function viewHiddenGuests() {
                                                                            window.location.href = "hiddenListGuest";
                                                                        }

                                                                        function doHidden(guestID) {
                                                                            if (confirm('Are you sure you want to hide this guest?')) {
                                                                                window.location.href = "hideGuest?guestID=" + guestID;
                                                                            }
                                                                        }
                                                                        function doEdit(guestID) {
                                                                            if (confirm('Are you sure you want to edit this guest?')) {
                                                                                window.location.href = "editGuest?guestID=" + guestID;
                                                                            }
                                                                        }

        </script>
        <script>
            $(document).ready(function () {
                $("#basic-datatables").DataTable({
                    "pageLength": 5,
                    "lengthMenu": [5, 10, 25, 50]
                });
                $('#entryInput').on('change', function () {
                    var value = $(this).val();
                    table.page.len(value).draw(); // Cập nhật số entries hiển thị
                });
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



                var action =
                        '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';


            });
        </script>
    </body>
</html>