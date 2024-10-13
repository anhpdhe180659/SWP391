<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <jsp:include page="sidebarManager.jsp"/>
            <!-- End Sidebar -->
            <div class="main-panel">
                <div class="main-header">
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Guest List</h3>
                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <!--<h4 class="card-title">Add New Guest</h4>-->
                                        <button class="btn btn-primary btn-round ms-auto" onclick="addGuest()">
                                            <i class="fa fa-plus"></i> Add Guest
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="display table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Guest ID</th>
                                                    <th>Name</th>
                                                    <th>Date of Birth</th>
                                                    <th>Sex</th>
                                                    <th>Address</th>
                                                    <th>Phone</th>
                                                    <th>Identification</th>
                                                    <th>Nationality</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listGuest}" var="g">
                                                    <tr>
                                                        <td>${g.guestID}</td>
                                                        <td>${g.name}</td>
                                                        <td>${g.dateOfBirth}</td>
                                                        <td><c:choose>
                                                                <c:when test="${g.sex == 1}"><img src="assets/img/male-icon.png" alt="alt"/></c:when>
                                                                <c:otherwise><img src="assets/img/female-icon.png" alt="alt"/></c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>${g.address}</td>
                                                        <td>${g.phone}</td>
                                                        <td>${g.identification}</td>
                                                        <td>${g.nationality}</td>
                                                        <td>
                                                            <div class="form-button-action">
                                                                <a href="editGuest?guestID=${g.guestID}">
                                                                    <button type="button" class="btn btn-link btn-primary btn-lg">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                </a>
                                                                <button type="button" class="btn btn-link btn-danger" onclick="doDelete(${g.guestID})">
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

            <footer class="footer">
                <!-- Add your footer content here -->
            </footer>
        </div>

        <!-- Core JS Files -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>

        <script>
            function doDelete(guestID) {
                var option = confirm("Are you sure to delete this guest?");
                if (option === true) {
                    window.location = "deleteGuest?guestID=" + guestID;
                }
            }

            function addGuest() {
                window.location = "addGuest";
            }
        </script>
    </body>
</html>
