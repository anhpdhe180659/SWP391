<%-- 
    Document   : dashboard
    Created on : Sep 21, 2024, 7:57:19 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>List Invoice</title>
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
        <link rel="stylesheet" href="CSS/listRoom.css"/>

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <!--<link rel="stylesheet" href="assets/css/demo.css" />-->
    </head>
    <body>
        <div class="wrapper">
            <c:if test="${sessionScope.user.role == 2}">
                <jsp:include page="sidebarReceptionist.jsp"/>
            </c:if>
            <c:if test="${sessionScope.user.role == 1}">
                <jsp:include page="sidebarManager.jsp"/>
            </c:if>
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
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="container">
                        <div class="page-inner">
                            <div class="page-header">
                                <h1 class="fw-bold mb-3">INVOICE</h1>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body row">
                                        <h3 class="fw-bold mb-3">Invoice Filter</h3>
                                        <form action="listInvoice" method="get" class="d-flex align-items-center">
                                            <span class="me-2"><b>From</b></span>
                                            <input class="form-control me-3" type="date" name="dateFrom" id="dateFrom" style="max-width: 150px;" />

                                            <span class="me-2"><b>To</b></span>
                                            <input class="form-control me-3" type="date" name="dateTo" id="dateTo" style="max-width: 150px;" />


                                            <button class="btn btn-label-info" type="submit">Filter</button>
                                        </form>
                                        <span id="error-message" style="color: red; display: none; margin-right: 10px;">"End date" must be after "Start date".</span>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-body row">
                                        <div class="table-responsive">
                                            <table id="add-user" class="display table table-striped table-hover" >
                                                <thead>
                                                    <tr>
                                                        <th>Invoice No</th>
                                                        <th>Booking ID</th>
                                                        <th>Total Amount</th>
                                                        <th>Discount</th>
                                                        <th>Final Amount</th>
                                                        <th>Payment method</th>
                                                        <th>Payment Date</th>
                                                        <th style="text-align: center" colspan="2">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${sessionScope.listInvoice}" var="s">
                                                        <tr>
                                                            <td>${s.invoiceNo}</td>
                                                            <td>${s.bookingId}</td>
                                                            <td class="price-vnd">${s.totalAmount}</td>
                                                            <td>${s.discount}</td>
                                                            <td class="price-vnd">${s.finalAmount}</td>
                                                            <td>${s.paymentMethod}</td>
                                                            <td>${s.paymentDate}</td>
                                                            <td><a href="viewDetailInvoice?invoiceId=${s.invoiceNo}">View</a></td>
                                                        </tr>
                                                    </c:forEach>
                                                    <c:if test="${requestScope.noti != null}">
                                                        <tr >
                                                            <td style="text-align: center" colspan="5"><p class="text-warning">${requestScope.noti}</p></td><!-- comment --></tr>
                                                            </c:if>
                                                </tbody>
                                            </table>
                                            <c:set value="${sessionScope.currentindex}" var="index" />
                                            <c:set value="${sessionScope.Nopage}" var="Nopage" />
                                            <div class="card-body" >
                                                <div class="demo">
                                                    <ul class="pagination pg-primary" style="display: flex; justify-content: flex-end;">
                                                        <div style="width: 100px; align-content: end">${index} of ${Nopage} page</div>
                                                        <li class="page-item ${index < 3 ? 'disabled' :'' } ">
                                                            <a class="page-link" href="listInvoice?index=${index-1}" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                        </li>
                                                        <c:choose>
                                                            <c:when test="${index <= 3}">
                                                                <c:set var="startPage" value="1" />
                                                                <c:set var="endPage" value="${Nopage > 6 ? 6 : Nopage}" />
                                                            </c:when>
                                                            <c:when test="${index > Nopage - 3}">
                                                                <c:set var="startPage" value="${Nopage - 5 > 0 ? Nopage - 5 : 1}" />
                                                                <c:set var="endPage" value="${Nopage}" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="startPage" value="${index - 3}" />
                                                                <c:set var="endPage" value="${index + 2}" />
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:forEach var="p" begin="${startPage}" end="${endPage}">
                                                            <c:if test="${index == p}">
                                                                <li class="page-item active">
                                                                    <a class="page-link" href="listInvoice?index=${p}">${p}</a>
                                                                </li>
                                                            </c:if>
                                                            <c:if test="${index != p}">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="listInvoice?index=${p}">${p}</a>
                                                                </li>
                                                            </c:if>
                                                        </c:forEach>
                                                        <li class="page-item ${index < Nopage ? '' :'disabled' }" >
                                                            <a class="page-link" href="listInvoice?index=${index+1}" aria-label="Next">
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
                </div>
            </div>
        </div>
        <script>
            const dateFrom = document.getElementById("dateFrom");
            const dateTo = document.getElementById("dateTo");
            const errorMessage = document.getElementById("error-message");

            function validateDateOrder() {
                if (dateFrom.value && dateTo.value) {
                    const fromDate = new Date(dateFrom.value);
                    const toDate = new Date(dateTo.value);

                    if (toDate > fromDate) {
                        errorMessage.style.display = "none"; // Hide error message
                        dateTo.setCustomValidity(""); // Clear custom validity
                    } else {
                        errorMessage.style.display = "inline"; // Show error message
                        dateTo.setCustomValidity("End date must be after Start date"); // Set custom validity
                    }
                } else {
                    errorMessage.style.display = "none";
                    dateTo.setCustomValidity(""); // Clear custom validity if any date is missing
                }
            }

            // Attach validation to both date inputs
            dateFrom.addEventListener("change", validateDateOrder);
            dateTo.addEventListener("change", validateDateOrder);
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

        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>

        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo.js"></script>
        <script src="assets/js/demo.js"></script>
        <script>
            // Format price to VND
            function formatCurrencyVND(value) {
                return new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(value);
            }

            // Apply the format to all prices
            $(document).ready(function () {
                $('.price-vnd').each(function () {
                    let price = parseFloat($(this).text());
                    $(this).text(formatCurrencyVND(price));
                });
            });

            function doClose() {
                $('#addUserModal').modal('hide');
            }
        </script>
        <script>

        </script>
    </body>
</html>

