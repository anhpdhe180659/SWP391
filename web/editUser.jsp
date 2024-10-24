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
            <jsp:include page="sidebarManager.jsp"/>
            <!-- End Sidebar -->
            <div class="main-panel">
                <div class="main-header">
                    <div class="main-header-logo">
                        <!-- Logo Header -->
                        <div class="logo-header" data-background-color="dark">
                            <a href="../index.jsp" class="logo">
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
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Manage User</h3>
                        </div>



                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Edit User</h4>
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
                                                <form action="editUser"  method="POST"  onsubmit="return validate()">
                                                    <c:set value="${requestScope.user}" var="u"/>
                                                    <div class="modal-body">

                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="form-group form-group-default">
                                                                    <label>Full Name</label>
                                                                    <input
                                                                        name="name"
                                                                        value="${u.name}"
                                                                        type="text"
                                                                        maxlength="100"
                                                                        class="form-control"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group form-group-default">
                                                                    <label>Address</label>
                                                                    <input
                                                                        value="${u.address}"
                                                                        name="address"
                                                                        type="text"
                                                                        maxlength="200"
                                                                        class="form-control"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Phone</label>
                                                                    <input
                                                                        value="${u.phone}"
                                                                        id="phone"
                                                                        name="phone"
                                                                        maxlength="50"
                                                                        type="text"
                                                                        class="form-control"
                                                                        required
                                                                        pattern="^\d{10,15}$"
                                                                        title="Valid phone number must be 10 to 15 digits long"
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Identification</label>
                                                                    <input
                                                                        value="${u.identification}"
                                                                        id="identification"
                                                                        name="identification"
                                                                        type="text"
                                                                        maxlength="20"
                                                                        class="form-control"
                                                                        required
                                                                        pattern="(^[A-Z0-9]{10}$)|(^[A-Z0-9]{12}$)" 
                                                                        
                                                                        title="Valid ID contains 10 or 12 digits and uppercase letters"
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Sex</label>
                                                                    <select name="sex" class="form-control">
                                                                        <option value="1" <c:if test="${u.sex == 1}">
                                                                                selected
                                                                            </c:if> />Male</option>
                                                                        <option value="0" <c:if test="${u.sex == 0}">
                                                                                selected
                                                                            </c:if> />Female</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4" >
                                                                <div class="form-group form-group-default" style="line-height: 23px">
                                                                    <label>Date of Birth</label>
                                                                    <input 
                                                                        value="${u.dateOfBirth}"
                                                                        type="date" name="birthday" required
                                                                        style="width: 100%; border: none; "/>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4" >
                                                                <div class="form-group form-group-default" style="line-height: 23px">
                                                                    <label>Salary</label>
                                                                    <input type="number" name="salary"
                                                                           value="${u.salary}"
                                                                           min="0" max="2000000000" required
                                                                           style="width: 100%; border: none; "/>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4" >
                                                                <div class="form-group form-group-default" style="line-height: 23px">
                                                                    <label>Start Date</label>
                                                                    <input type="date" name="startdate" 
                                                                           value="${u.startDate}" required
                                                                           style="width: 100%; border: none; "/>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="form-group form-group-default">
                                                                    <label>Username</label>
                                                                    <input
                                                                        value="${u.username}"
                                                                        name="username"
                                                                        type="text"
                                                                        pattern="[a-zA-Z0-9]{4,12}$" title="length should be 4-12, no spaces, unsigned"
                                                                        class="form-control"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="form-group form-group-default">
                                                                    <label>Email</label>
                                                                    <input
                                                                        id="email"
                                                                        name="email"
                                                                        type="text"
                                                                        value="${u.email}"
                                                                        class="form-control"
                                                                        required
                                                                        pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                                                        title="Invalid email address"
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="form-group form-group-default">
                                                                    <label>Role</label>                  
                                                                    <select name="role" class="form-control">
                                                                        <option value="2"
                                                                                <c:if test="${u.role == 2}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Employee</option>
                                                                        <option value="1"
                                                                                <c:if test="${u.role == 1}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Admin</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <c:if test="${u.role != 1}">
                                                                <div class="col-sm-3">
                                                                    <div class="form-group form-group-default">
                                                                        <label>Status</label>
                                                                        <select name="status" class="form-control">
                                                                            <option value="1"
                                                                                    <c:if test="${u.status == 1}">
                                                                                        selected
                                                                                    </c:if>
                                                                                    style="color: green;font-weight: bold" >active</option>
                                                                            <option value="0"
                                                                                    <c:if test="${u.status == 0}">
                                                                                        selected
                                                                                    </c:if>
                                                                                    style="color: red;font-weight: bold">inactive</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${u.role == 1}">
                                                                <div class="col-sm-3">
                                                                    <div class="form-group form-group-default" >
                                                                        <label>Status</label>
                                                                        <c:if test="${u.status == 1}">
                                                                        <div style="margin:5px 0px;color: green;font-weight: bold">active</div>
                                                                        </c:if>
                                                                        <c:if test="${u.status == 0}">
                                                                        <div style="margin:5px 0px;color: red;font-weight: bold">inactive</div>
                                                                        </c:if>
                                                                        <input
                                                                        name="status"
                                                                        type="text"
                                                                        value="${u.status}"
                                                                        class="form-control"
                                                                        hidden
                                                                        />
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <input type="text" name="userid" value="${u.userID}" hidden="">
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
        function doClose() {
            $('#editUserModal').modal('hide');
        }
    </script>
    <script>
        function BackToList() {
            window.location = "listUser";
        }
    </script>
    <script>
        function validate() {
            var phone = document.getElementById("phone").value;
            var regex1 = /^\d{10}$/;
            return true;
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


