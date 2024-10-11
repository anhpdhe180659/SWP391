
<%-- 
    Document   : listEmployee
    Created on : Sep 21, 2024, 7:31:52 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>List User</title><!--  page only for manager  -->
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

    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <jsp:include page="sidebarManager.jsp"/>
            <!-- End Sidebar -->
            <div class="main-panel">
                <div class="main-header">
                    <!-- Navbar Header -->
                    <jsp:include page="navbar-header.jsp"/>
                    <!-- End Navbar -->
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
                                                            name="name"
                                                            placeholder="Search by name..."
                                                            class="form-control"
                                                            />
                                                    </c:if>
                                                    <c:if test="${n.length() > 1}">
                                                        <input
                                                            type="text"
                                                            name="name"
                                                            value="${n}"
                                                            placeholder="Search by name..."
                                                            class="form-control"
                                                            />
                                                    </c:if>
                                                </div>
                                            </form>
                                        </nav>
                                        <c:set value="${requestScope.noti}" var="noti" />

                                        <button
                                            class="btn btn-primary btn-round ms-auto"
                                            onclick="addUser()">
                                            <i class="fa fa-plus"></i>
                                            Add User
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Modal -->


                                    <div class="table-responsive">
                                        <table class="display table table-striped table-hover" >
                                            <thead>
                                                <tr style="text-align: center">
                                                    <th>Name</th>
                                                    <th>Date Of Birth</th>
                                                    <th>Sex</th>
                                                    <th>Address</th>
                                                    <th>Phone</th>
                                                    <th>Salary</th>
                                                    <th>Start Date</th>
                                                    <th>Status</th>
                                                    <th style="width: 10%; text-align: center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listUser}" var="s">
                                                    <tr>
                                                        <td>${s.name}</td>
                                                        <td>${s.dateOfBirth}</td>
                                                        <td>${(s.sex == 1?
                                                              '<img src="assets/img/male-icon.png" alt="male-image"/>':
                                                              '<img src="assets/img/female-icon.png" alt="female-image"/>')}
                                                        </td>
                                                        <td>${s.address}</td>
                                                        <td>${s.phone}</td>
                                                        <td>
                                                            <fmt:formatNumber value="${s.salary}" type="number" groupingUsed="true" pattern="#,###"/> ₫</td>
                                                        <td>
                                                            ${s.startDate}
                                                            
                                                            </td>
                                                        <td>
                                                            <c:if test="${s.status == 0}">
                                                                <span style="color: red; font-weight:bold">inactive</span>
                                                            </c:if>
                                                            <c:if test="${s.status == 1}">
                                                                <span style="color: green; font-weight:bold">active</span>
                                                            </c:if>
                                                        </td>

                                                        <td>
                                                            <div class="form-button-action">
                                                                <a href="editUser?userid=${s.userID}" >
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
                                                                    onclick="doDelete(${s.userID})"
                                                                    >
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${requestScope.noti != null}">
                                                    <tr >
                                                        <td style="text-align: center; font-weight: bold" colspan="9"><p class="text-danger">${requestScope.noti}</p></td><!-- comment --></tr>
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
                                                <a class="page-link" href="listUser?index=${index-1}" aria-label="Previous">
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
                                                        <a class="page-link" href="listUser?index=${p}">${p}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${index != p}">
                                                    <li class="page-item">
                                                        <a class="page-link" href="listUser?index=${p}">${p}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                            <li class="page-item ${index < Nopage ? '' :'disabled' }" >
                                                <a class="page-link" href="listUser?index=${index+1}" aria-label="Next">
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

            <footer class="footer">

            </footer>
        </div>
</body>
        <!-- Custom template | don't include it in your project! -->

        <!-- End Custom template -->
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
        function addUser() {
            window.location = "addUser";
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
        function doDelete(userid) {
            var option = confirm("Are you sure to ban this user?");
            if (option === true) {
                window.location = "deleteUser?userid=" + userid;
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