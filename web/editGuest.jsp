<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Edit Guest</title>
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
        <style>
            .form-group label {
                display: flex;
                align-items: center;
            }

            .form-group label i {
                margin-right: 8px;
                color: #007bff;
            }
        </style>

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

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Edit Guest</h3>
                        </div>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Guest's Information</h4>
                                        <button class="btn btn-primary btn-round ms-auto" onclick="window.location = 'listGuest'">
                                            <i class="fa fa-angle-left"></i> Back to list
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Form to edit guest information -->
                                    <form action="editGuest" method="POST">
                                        <!-- Hidden input to hold guestID -->
                                        <input type="hidden" name="guestID" value="${guest.guestID}" />
                                        
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group form-group-default">
                                                    <label><i class="fa fa-user"></i> Full Name</label>
                                                    <input name="name" type="text" value="${guest.name}" maxlength="100" class="form-control" placeholder="Enter full name" required />
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group form-group-default">
                                                    <label><i class="fa fa-map-marker-alt"></i> Address</label>
                                                    <input name="address" type="text" value="${guest.address}" maxlength="200" class="form-control" placeholder="Enter address" required />
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group form-group-default">
                                                    <label><i class="fa fa-phone"></i> Phone</label>
                                                    <input name="phone" type="text" value="${guest.phone}" maxlength="50" class="form-control" placeholder="Enter phone number" required />
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group form-group-default">
                                                    <label><i class="fa fa-id-card"></i> Identification</label>
                                                    <input name="identification" type="text" value="${guest.identification}" maxlength="20" class="form-control" placeholder="Enter identification number" required />
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label><i class="fas fa-transgender"></i> Gender</label><br />
                                                    <div class="d-flex">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="sex" id="male" value="1" ${guest.sex == 1 ? 'checked' : ''} required />
                                                            <label class="form-check-label" for="male">Male</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="sex" id="female" value="2" ${guest.sex == 2 ? 'checked' : ''} required />
                                                            <label class="form-check-label" for="female">Female</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group form-group-default">
                                                    <label><i class="fa fa-calendar-alt"></i> Date of Birth</label>
                                                    <input type="date" name="dateOfBirth" value="${guest.dateOfBirth}" class="form-control" required />
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group form-group-default">
                                                    <label><i class="fa fa-globe"></i> Nationality</label>
                                                    <input name="nationality" type="text" value="${guest.nationality}" class="form-control" placeholder="Enter nationality" required />
                                                </div>
                                            </div>
                                            <div class="col-sm-6"></div>
                                            <div class="col-sm-2 text-right">
                                                <button type="submit" class="btn btn-primary btn-round">
                                                    <i class="fa fa-save"></i> Save Changes
                                                </button>
                                            </div>
                                        </div>
                                    </form>

                                    <c:if test="${not empty noti}">
                                        <h4><div class="noti" style="color: red">${noti}</div></h4>
                                    </c:if>
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
            <script src="assets/js/kaiadmin.min.js"></script>
        </div>
    </body>
</html>
