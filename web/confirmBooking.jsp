<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.*" %>
<%@page import="dal.*" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.util.Locale" %>
<%@page import="java.util.*" %>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html> 
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Booking Code</title>
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
                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Booking Code</h3>
                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <c:set value="${requestScope.noti}" var="noti" />
                                        <c:set value="${requestScope.code}" var="code" />
                                        <c:set value="${requestScope.guestid}" var="guestid" />
                                        <button class="btn btn-primary btn-round ms-auto" onclick="backToList()">
                                            <i class="fa fa-arrow-circle-left"></i> Back to list
                                        </button>
                                    </div>
                                </div>
                                <form action="sendBookingCode" method="POST">
                                    <div class="card-body">
                                        <h4 class="fw-bold mb-3">Booking Code: <span style="color: red">${code}</span></h4>
                                        <div style="display: flex">
                                            <div class="col-sm-4">
                                                <span style="color: green; font-weight: bold">${noti}</span>
                                            </div>
                                            <div class="col-sm-4">
                                                
                                                <div class="form-group">
                                                                <label><i class="fas fa-user-check"></i> Check-in</label><br />
                                                                <div class="d-flex">
                                                                    <div class="form-check">
                                                                        <input
                                                                            class="form-check-input"
                                                                            type="radio"
                                                                            name="checkinstatus"
                                                                            id="check1"
                                                                            value="1"
                                                                            checked
                                                                            />
                                                                        <label
                                                                            class="form-check-label"
                                                                            for="check1"
                                                                            >
                                                                            Now
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input
                                                                            class="form-check-input"
                                                                            type="radio"
                                                                            name="checkinstatus"
                                                                            id="check2"
                                                                            value="0"
                                                                            />
                                                                        <label
                                                                            class="form-check-label"
                                                                            for="check2"
                                                                            >
                                                                            Later
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                <div class="form-group">
                                                                <label for="paymentMethod"><i class="far fa-credit-card"></i> Payment Method</label>
                                                                <div class="form-group form-group-default">
                                                                    <select id="paymentMethod" name="paymentMethod" class="form-control">
                                                                        <option value="1">Cash</option>
                                                                        <option value="2">Bank transfer</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                            </div>
                                            <div class="col-sm-4" style="display: flex;align-items: center">
                                                <button type="submit" class="btn btn-primary" style="margin-left: 20px">Send booking code</button>
                                            </div>
                                        </div>
                                        
                                        <input type="text" class="form-control"
                                            name="bookingcode" value="${code}"
                                            readonly hidden />
                                        <input type="text" class="form-control"
                                            name="guestid" value="${guestid}"
                                            readonly hidden />
                                    </div>
                                </form>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <!-- Datatables -->
        <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
        <script src="assets/js/kaiadmin.min.js"></script>
        <script src="assets/js/setting-demo2.js"></script>
        <script>
                                            function backToList() {
                                                window.location = "bookingList";
                                            }
        </script>

    </body>
</html>
