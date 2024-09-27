<<<<<<< OURS
<%-- 
    Document   : listEmployee
    Created on : Sep 21, 2024, 7:31:52 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>List Employee</title><!--  page only for manager  -->
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
                }
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
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Manage Employee</h3>

                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <nav
                                            class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                                            >
                                            <c:set value="${requestScope.searchName} " var="n"/>
                                            <form action="searchEmployee">
                                                <div class="input-group" >
                                                    <div class="input-group-prepend">
                                                        <button type="submit" class="btn btn-search pe-1">
                                                            <i class="fa fa-search search-icon"></i>
                                                        </button>
                                                    </div>
                                                    <c:if test="${n.length() < 2}">
                                                        <input
                                                            type="text"
                                                            name="name"
                                                            placeholder="Search employee by name..."
                                                            class="form-control"
                                                            />
                                                    </c:if>
                                                    <c:if test="${n.length() > 1}">
                                                        <input
                                                            type="text"
                                                            name="name"
                                                            value="${n}"
                                                            placeholder="Search employee by name..."
                                                            class="form-control"
                                                            />
                                                    </c:if>
                                                </div>
                                            </form>
                                        </nav>
                                        <button
                                            class="btn btn-primary btn-round ms-auto"
                                            onclick="addEmployee()">
                                            <i class="fa fa-plus"></i>
                                            Add Employee
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Modal -->
                                    <!--                                    <div
                                                                            class="modal fade"
                                                                            id="addEmployeeModal"
                                                                            tabindex="-1"
                                                                            role="dialog"
                                                                            aria-hidden="true"
                                                                            >
                                                                            <div class="modal-dialog" role="document">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header border-0">
                                                                                        <h5 class="modal-title">
                                                                                            <span class="fw-mediumbold"> New</span>
                                                                                            <span class="fw-light"> Employee </span>
                                                                                        </h5>
                                                                                    </div>
                                                                                    <form action="addEmployee" onsubmit="return validate()">
                                                                                        <div class="modal-body">
                                                                                            <p class="small">
                                                                                                Create a new Employee, make sure you
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
                                                                                                        <label>Address</label>
                                                                                                        <input
                                                                                                            name="address"
                                                                                                            type="text"
                                                                                                            class="form-control"
                                                                                                            required
                                                                                                            />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-sm-6">
                                                                                                    <div class="form-group form-group-default">
                                                                                                        <label>Phone</label>
                                                                                                        <input
                                                                                                            id="phone"
                                                                                                            name="phone"
                                                                                                            type="text"
                                                                                                            class="form-control"
                                                                                                            required
                                                                                                            />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-sm-6">
                                                                                                    <div class="form-group form-group-default">
                                                                                                        <label>Identification</label>
                                                                                                        <input
                                                                                                            name="identification"
                                                                                                            type="text"
                                                                                                            class="form-control"
                                                                                                            required
                                                                                                            />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-sm-6">
                                                                                                    <div class="form-group form-group-default">
                                                                                                        <label>Sex</label>
                                                                                                        <select name="sex" class="form-control">
                                                                                                            <option value="1">Male</option>
                                                                                                            <option value="0">Female</option>
                                                                                                        </select>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-sm-6" >
                                                                                                    <div class="form-group form-group-default" style="line-height: 23px">
                                                                                                        <label>Date of Birth</label>
                                                                                                        <input type="date" name="birthday" value="" required
                                                                                                               style="width: 100%; border: none; "/>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-sm-6" >
                                                                                                    <div class="form-group form-group-default" style="line-height: 23px">
                                                                                                        <label>Salary</label>
                                                                                                        <input type="number" name="salary" value="" required
                                                                                                               style="width: 100%; border: none; "/>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-sm-6" >
                                                                                                    <div class="form-group form-group-default" style="line-height: 23px">
                                                                                                        <label>Start Date</label>
                                                                                                        <input type="date" name="startdate" value="" required
                                                                                                               style="width: 100%; border: none; "/>
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
                                                                        </div>-->
                                    <div class="table-responsive">
                                        <table class="display table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Date Of Birth</th>
                                                    <th>Sex</th>
                                                    <th>Phone</th>
                                                    <th>Salary</th>
                                                    <th>Start Date</th>
                                                    <th style="width: 10%">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listEmployee}" var="s">
                                                    <tr>
                                                        <td>${s.name}</td>
                                                        <td>
                                                            ${s.dateOfBirth}
                                                        </td>
                                                        <td>${(s.sex == 1?
                                                              '<img src="assets/img/male-icon.png" alt="male-image"/>':
                                                              '<img src="assets/img/female-icon.png" alt="female-image"/>')}
                                                        </td>
                                                        <td>${s.phone}</td>
                                                        <td>${s.salary}</td>
                                                        <td>${s.startDate}</td>
                                                        <td>
                                                            <div class="form-button-action">
                                                                <a href="editEmployee?empid=${s.empID}" >
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
                                                                    onclick="doDelete(${s.empID})"
                                                                    >
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${requestScope.noti != null}">
                                                    <tr >
                                                        <td style="text-align: center" colspan="7"><p class="text-warning">${requestScope.noti}</p></td><!-- comment --></tr>
                                                        </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <c:set value="${sessionScope.currentindex}" var="index" />
                                <c:set value="${sessionScope.Nopage}" var="Nopage" />
                                <div class="card-body" >
                                    <div class="demo">
                                        <ul class="pagination pg-primary" style="display: flex; justify-content: flex-end;">
                                            <div style="width: 100px; align-content: end">${index} of ${Nopage} page</div>
                                            <li class="page-item ${index < 2 ? 'disabled' :'' } ">
                                                <a class="page-link" href="listEmployee?index=${index-1}" aria-label="Previous">
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
                                                        <a class="page-link" href="listEmployee?index=${p}">${p}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${index != p}">
                                                    <li class="page-item">
                                                        <a class="page-link" href="listEmployee?index=${p}">${p}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                            <li class="page-item ${index < Nopage ? '' :'disabled' }" >
                                                <a class="page-link" href="listEmployee?index=${index+1}" aria-label="Next">
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
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <script>
                                                                        function doDelete(empid) {
                                                                            var option = confirm("Are you sure? You won't be able to revert this");
                                                                            if (option === true) {
                                                                                window.location = "deleteEmployee?empid=" + empid;
                                                                            }
                                                                        }
                                                                        function doClose() {
                                                                            $('#addEmployeeModal').modal('hide');
                                                                        }
        </script>
        <script type="text/javascript">
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
            function addEmployee() {
                window.location = "addEmployee";
            }
        </script>
        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>
        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo2.js"></script>
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

                // Add Employee
                $("#add-row").DataTable({
                    pageLength: 5,
                });

                var action =
                        '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

                $("#addEmployeeButton").click(function () {
                    $("#add-row")
                            .dataTable()
                            .fnAddData([
                                $("#addName").val(),
                                $("#addPosition").val(),
                                $("#addOffice").val(),
                                action,
                            ]);
                    $("#addEmployeeModal").modal("hide");
                });
            });
        </script>
    </body>
</html>