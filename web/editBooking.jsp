
<%-- 
    Document   : forms
    Created on : Sep 19, 2024, 9:33:29 AM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Edit booking</title>
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
                    <!-- Navbar Header -->
                    <jsp:include page="navbar-header.jsp"/>
                    <!-- End Navbar -->
                </div>


                <div class="container">
                    <div class="page-inner">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="d-flex align-items-center">
                                            <div class="card-title" style="font-size: 24px;">Edit booking</div>
                                            <button class="btn btn-primary btn-round ms-auto" onclick="BackToList()">
                                                <i class="fa fa-arrow-circle-left"></i> Back to List
                                            </button>
                                        </div>
                                    </div>
                                    <form action="editBooking" method="POST">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center">
                                                <c:set value="${requestScope.bookingid}" var="bookingid"/>
                                                <input type="number"class="form-control"name="bookingid"value="${bookingid}"hidden=""/>
                                            </div>
                                            <div style="display: flex">
                                                <div class="col-md-3 col-lg-3">
                                                    <c:set value="${requestScope.name}" var="name"/>
                                                    <div class="form-group">
                                                        <label for="name"><i class="fas fa-address-book"></i> Name </label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="name"
                                                            name="name"
                                                            placeholder="Enter guest's full name"
                                                            value="${name}"
                                                            readonly=""
                                                            />
                                                    </div>
                                                    <c:set value="${requestScope.bookingcode}" var="bookingcode"/>
                                                    <div class="form-group">
                                                        <label for="iden"><i class="fas fa-address-card"></i> Booking code</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="bookingcode"
                                                            name="bookingcode"
                                                            readonly=""
                                                            value="${bookingcode}"
                                                            />
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-lg-3">
                                                    <div class="form-group">
                                                        <c:set value="${requestScope.checkindate}" var="checkindate"/>
                                                        <label for="iden"><i class="far fa-calendar-check"></i> Check-in Date</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="checkindate"
                                                            name="checkindate"
                                                            required
                                                            value="${checkindate}"
                                                            readonly=""
                                                            />
                                                    </div>
                                                    <div class="form-group">
                                                        <c:set value="${requestScope.deposit}" var="deposit"/>
                                                        <label for="address"><i class="far fa-calendar-times"></i> Check-out Date</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="checkoutdate"
                                                            name="checkoutdate"
                                                            required
                                                            value="${checkoutdate}"
                                                            readonly=""
                                                            />
                                                        <!--datetime-local-->
                                                    </div>
                                                    <c:set value="${requestScope.noti}" var="noti"/>
                                                    <span style="margin-left: 25px; font-weight: bold;color: green">${noti}</span>
                                                </div>
                                                <div class="col-md-3 col-lg-3">
                                                    <c:set value="${requestScope.deposit}" var="deposit"/>
                                                    <div class="form-group">
                                                        <label><i class="fas fa-money-bill-wave"></i> Deposit</label>
                                                        <input
                                                            type="number"
                                                            class="form-control"
                                                            min="0"
                                                            max="2000000000"
                                                            name="deposit"
                                                            value="${deposit}"
                                                            placeholder="Enter deposit"
                                                            required
                                                            />
                                                    </div>
                                                    <c:set value="${requestScope.checkinstatus}" var="checkinstatus"/>
                                                    <div class="form-group">
                                                        <label><i class="fas fa-user-check"></i> Check-in</label><br />
                                                        <div class="d-flex">
                                                            <div class="form-check">
                                                                <input
                                                                    class="form-check-input"
                                                                    type="radio"
                                                                    name="checkinstatus"
                                                                    id="check2"
                                                                    ${checkinstatus == 0 ? 'checked' : ''}
                                                                    value="0"
                                                                    />

                                                                <label
                                                                    class="form-check-label"
                                                                    for="check2"
                                                                    >
                                                                    Later
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input
                                                                    class="form-check-input"
                                                                    type="radio"
                                                                    name="checkinstatus"
                                                                    id="check1"
                                                                    value="1"
                                                                    ${checkinstatus == 1 ? 'checked' : ''}
                                                                    />
                                                                <label
                                                                    class="form-check-label"
                                                                    for="check1"
                                                                    >
                                                                    Now
                                                                </label>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="d-flex">

                                                            <button class="btn btn-danger btn-round ms-auto" type="reset">
                                                                Reset
                                                            </button>
                                                            <button class="btn btn-primary btn-round ms-auto" type="submit">
                                                                Save
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-lg-3">
                                                    <div class="form-group" style="height: 131.175px;">
                                                        <label for="exampleFormControlSelect2">List room booked</label>
                                                        <select multiple="" class="form-control" id="exampleFormControlSelect2" style="height: 132.775px;">
                                                            <c:forEach items="${requestScope.listRoom}" var="s">
                                                                <option>Room ${s.roomNumber}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>



                                            </div>
                                        </div>

                                    </form>

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
        <script>
            function BackToList() {
                window.location = "bookingList";
            }
        </script>
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

        <!-- Chart JS -->
        <script src="assets/js/plugin/chart.js/chart.min.js"></script>

        <!-- jQuery Sparkline -->
        <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

        <!-- Chart Circle -->
        <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>

        <!-- Bootstrap Notify -->
        <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

        <!-- jQuery Vector Maps -->
        <script src="assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
        <script src="assets/js/plugin/jsvectormap/world.js"></script>

        <!-- Google Maps Plugin -->
        <script src="assets/js/plugin/gmaps/gmaps.js"></script>

        <!-- Sweet Alert -->
        <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>

        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo2.js"></script>
        <script>
            // Get today's date in yyyy-mm-dd format
            const today = new Date().toISOString().split('T')[0];
            // Set the max attribute for the birthday input to today's date
            document.getElementById("birthday").setAttribute("max", today);
            document.getElementById("checkindate").setAttribute("min", today);
            document.getElementById("checkoutdate").setAttribute("min", today);
            document.getElementById("checkindate").addEventListener("change", function () {
                let checkInDate = new Date(this.value);
                let minCheckOutDate = new Date(checkInDate);
                minCheckOutDate.setDate(checkInDate.getDate() + 1);
                // Convert the date back to YYYY-MM-DD format
                let formattedCheckOutDate = minCheckOutDate.toISOString().split('T')[0];
                // Set the minimum date for checkout as one day after the check-in date
                let checkOutInput = document.getElementById("checkoutdate");
                checkOutInput.setAttribute("min", formattedCheckOutDate);
            });
        </script>
        <script>
            function validate() {
                var email = document.getElementById("email").value;
                var regex = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
                if (!regex.test(email)) {
                    alert("Please enter a valid Email address (example@gmail.com)");
                    document.getElementById("email").focus();
                    return false;
                }
                var phone = document.getElementById("phone").value;
                var regex1 = /^\d{10}$/;

                if (!regex1.test(phone)) {
                    alert("Please enter a valid phone number with 10 digit");
                    document.getElementById("phone").focus();
                    return false;
                }
                var identification = document.getElementById("identification").value;
                var regex2 = /^[A-Z0-9]{10}$|^[A-Z0-9]{12}$/;
                if (!regex2.test(identification)) {
                    alert("Please enter a valid identification number with 12 digit");
                    document.getElementById("identification").focus();
                    return false;
                }
                return true;
            }
        </script>
        <script>
            document.querySelectorAll('#multi-filter-select tbody tr').forEach(row => {
                row.addEventListener('click', function (e) {
                    // Nếu click vào chính checkbox thì không thay đổi trạng thái checked nữa
                    if (e.target.tagName !== 'INPUT') {
                        // Lấy checkbox trong hàng được click
                        let checkbox = this.querySelector('.row-checkbox');
                        // Đổi trạng thái của checkbox
                        checkbox.checked = !checkbox.checked;
                    }
                });
            });
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
                $("#add-row").DataTable({
                    pageLength: 5,
                });

                var action =
                        '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

                $("#addRowButton").click(function () {
                    $("#add-row")
                            .dataTable()
                            .fnAddData([
                                $("#addName").val(),
                                $("#addPosition").val(),
                                $("#addOffice").val(),
                                action,
                            ]);
                    $("#addRowModal").modal("hide");
                });
            });
        </script>
    </body>
</html>

