<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Hidden Guest List</title>

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
                    <jsp:include page="navbar-header.jsp"/>
                </div>
                <c:if test="${not empty success}">
                    <div class="alert alert-success">
                        ${success}
                    </div>
                </c:if>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Hidden Guest List</h3>
                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center justify-content-between mb-3">
                                        <button class="btn btn-primary btn-round" onclick="viewAllGuests()">
                                            <i class="fa fa-eye"></i> View All Guests
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
                                                <c:forEach items="${hiddenGuestList}" var="g">
                                                    <%--<c:if test="${g.isHidden == 1}">--%>
                                                    <tr>
                                                        <td style="border-right: 1px solid #ddd;">${g.guestID}</td>
                                                        <td style="border-right: 1px solid #ddd;">${g.name}</td>
                                                        <td style="border-right: 1px solid #ddd;">${g.dateOfBirth}</td>
                                                        <td style="border-right: 1px solid #ddd;">
                                                            <c:choose>
                                                                <c:when test="${g.sex == 1}">
                                                                    <img src="assets/img/male-icon.png" alt="Male"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img src="assets/img/female-icon.png" alt="Female"/>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td style="border-right: 1px solid #ddd;">${g.phone}</td>
                                                        <td style="border-right: 1px solid #ddd;">
                                                            <div class="form-button-action">
                                                                <button type="button" class="btn btn-link btn-success btn-lg" onclick="doRestore(${g.guestID})">
                                                                    <i class="fa fa-undo"></i> Restore
                                                                </button>
                                                                <a href="viewGuest?guestID=${g.guestID}">
                                                                    <button type="button" class="btn btn-link btn-info">
                                                                        <i class="fa fa-eye"></i> View Details
                                                                    </button>
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <%--</c:if>--%>
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
                                                                    function doRestore(guestID) {
                                                                        var option = confirm("Are you sure to restore this guest?");
                                                                        if (option === true) {
                                                                            window.location = "restoreGuest?guestID=" + guestID;
                                                                        }
                                                                    }

                                                                    function viewAllGuests() {
                                                                        window.location = "listGuest";
                                                                    }
            </script>
    </body>
</html>
