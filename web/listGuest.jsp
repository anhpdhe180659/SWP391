<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>List Guest</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="img/logo/logo.png" type="image/x-icon" />
        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {families: ["Public Sans:300,400,500,600,700"]},
                custom: {
                    families: ["Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"],
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
            <jsp:include page="sidebarManager.jsp"/>
            <!-- End Sidebar -->

            <div class="main-panel">
                <div class="main-header">
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Manage Guests</h3>
                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Add Guest</h4>
                                        <button class="btn btn-primary btn-round ms-auto" data-bs-toggle="modal" data-bs-target="#addGuestModal">
                                            <i class="fa fa-plus"></i> Add Guest
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Modal -->
                                    <div class="modal fade" id="addGuestModal" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header border-0">
                                                    <h5 class="modal-title">
                                                        <span class="fw-mediumbold"> New</span>
                                                        <span class="fw-light"> Guest </span>
                                                    </h5>
                                                </div>
                                                <form action="addGuest" onsubmit="return validateGuest()">
                                                    <div class="modal-body">
                                                        <p class="small">Create a new guest, make sure you fill them all</p>

                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Name</label>
                                                                    <input name="name" type="text" class="form-control" required />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Date of Birth</label>
                                                                    <input name="dob" type="date" class="form-control" required />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer border-0">
                                                        <button type="button submit" class="btn btn-primary">Add</button>
                                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="table-responsive">
                                        <table id="guest-table" class="display table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Date of Birth</th>
                                                    <th>Phone</th>
                                                    <th>Address</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listGuest}" var="g">
                                                    <tr>
                                                        <td><a href="guest-detail">${g.name}</a></td>
                                                        <td>${g.dateOfBirth}</td>
                                                        <td>${g.phone}</td>
                                                        <td>${g.address}</td>
                                                        <td>
                                                            <div class="form-button-action">
                                                                <a href="editGuest?guestId=${g.guestId}">
                                                                    <button type="button" class="btn btn-link btn-primary btn-lg">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                </a>
                                                                <button type="button" class="btn btn-link btn-danger" onclick="doDelete(${g.guestId})">
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
            </div>

            <footer class="footer"></footer>
        </div>
        <!-- Core JS Files -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>
        <script src="assets/js/kaiadmin.min.js"></script>

        <!--        <script>
                                                                            function doDelete(guestId) {
                                                                                var option = confirm("Are you sure? This action cannot be undone.");
                                                                                if (option === true) {
                                                                                    window.location = "deleteGuest?guestId=" + guestId;
                                                                                }
                                                                            }
        
                                                                            function validateGuest() {
                                                                                var name = document.querySelector("[name='name']").value;
                                                                                if (!name) {
                                                                                    alert("Please enter a valid name");
                                                                                    return false;
                                                                                }
                                                                                return true;
                                                                            }
        
                                                                            $(document).ready(function () {
                                                                                $('#guest-table').DataTable();
                                                                            });
                </script>-->
    </body>
</html>