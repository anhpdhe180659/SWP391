<%-- 
    Document   : updateprofile
    Created on : Sep 25, 2024, 10:22:02 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Update Profile</title><!--  page only for manager  -->
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
                            <h3 class="fw-bold mb-3">My Profile</h3>
                        </div>



                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Update Profile</h4>
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
                                                <form action="updateProfileUser"  method="POST"  onsubmit="return validate()">
                                                    <c:set value="${requestScope.currentUser}" var="e"/>
                                                    <input type="text" name="userID" value="${e.userID}" hidden="">
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Name</label>
                                                                    <input
                                                                        name="name"
                                                                        type="text"
                                                                        class="form-control"
                                                                        value="${e.name}"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Address</label>
                                                                    <input
                                                                        name="address"
                                                                        type="text"
                                                                        class="form-control"
                                                                        value="${e.address}"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Phone</label>
                                                                    <input
                                                                        id="phone"
                                                                        name="phone"
                                                                        type="text"
                                                                        class="form-control"
                                                                        value="${e.phone}"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Identification</label>
                                                                    <input
                                                                        name="identification"
                                                                        type="text"
                                                                        class="form-control"
                                                                        value="${e.identification}"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Sex</label>
                                                                    <select name="sex" class="form-control">
                                                                        <option value="1" <c:if test="${e.sex == 1}">
                                                                                selected
                                                                            </c:if> />Male</option>
                                                                        <option value="0" <c:if test="${e.sex == 0}">
                                                                                selected
                                                                            </c:if> />Female</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                           <div class="col-sm-4" >
    <div class="form-group form-group-default" style="line-height: 23px">
        <label>Date of Birth</label>
        <input type="date" 
               id="birthday"
               name="birthday" 
               value="${e.dateOfBirth}" 
               required
               max=""
               style="width: 100%; border: none;"
        />
    </div>
</div>
                                                            <div class="col-sm-3" >
                                                                <div class="form-group form-group-default" style="line-height: 23px">
                                                                    <label>Salary</label>
                                                                    <input type="number" name="salary" value="${e.salary}" required
                                                                           style="width: 100%; border: none; "/>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3" >
                                                                <div class="form-group form-group-default" style="line-height: 23px">
                                                                    <label>Start Date</label>
                                                                    <input type="date" name="startdate" value="${e.startDate}" required
                                                                           style="width: 100%; border: none; "/>
                                                                </div>
                                                            </div>
                                                         
                                                        <div class="modal-footer border-0">
                                                            <c:set value="${requestScope.noti}" var="noti"/>
                                                            <c:if test="${noti == 'Save successful!'}" >
                                                                <div style="margin-right: 25px; font-weight: bold;color: green">${noti}</div>
                                                            </c:if>
                                                            <c:if test="${noti != 'Save successful!'}" >
                                                                <div style="margin-right: 25px; font-weight: bold;color: darkorange">${noti}</div>
                                                            </c:if>
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
                                                        $('#editEmployeeModal').modal('hide');
                                                    });
    </script>
    <script>
        function BackToList() {
            window.location = "ViewProfileServlet?userId=${sessionScope.user.userID}";
        }
    </script>
    <script>
        function validate() {
            var phone = document.getElementById("phone").value;
            var regex2 = /^\d{10}$/;
            if (!regex2.test(phone)) {
                alert("Please enter a valid phone number with 10 digit");
                document.getElementById("phone").focus();
                return false;
            }

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
            $("#edit-currentUser").DataTable({
                pageLength: 5,
            });

            var action =
                    '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

            $("#editEmployeeButton").click(function () {
                $("#edit-currentUser")
                        .dataTable()
                        .fneditData([
                            $("#editName").val(),
                            $("#editPosition").val(),
                            $("#editOffice").val(),
                            action,
                        ]);
                $("#editEmployeeModal").modal("hide");
            });
        });
    </script>
<script>
    // Thiết lập max date là ngày hiện tại
    function setMaxDate() {
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear()-18;

        maxDate = yyyy + '-' + mm + '-' + dd;
        document.getElementById("birthday").setAttribute("max", maxDate);
    }
    
    // Gọi hàm khi trang được load
    window.onload = function() {
        setMaxDate();
    };
</script>
</body>
</html>


