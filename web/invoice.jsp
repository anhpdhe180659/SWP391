<%-- 
    Document   : dashboard
    Created on : Sep 21, 2024, 7:57:19 PM
    Author     : nhatk
--%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Dashboard for receptionist</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="img/logo/favicon.png" type="image/x-icon" />
        <link rel="stylesheet" href="CSS/invoice.css"/>
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
        <link rel="stylesheet" href="/CSS/receptionHome.css"/>
        <!-- Additional CSS -->
        <style>
            .fine-highlight {
                background-color: #ffe6e6; /* Light red background for fine */
                font-weight: bold;
            }
        </style>
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
                                <img src="img/logo/logoAdmin.png" alt="navbar brand" class="navbar-brand" height="20" />
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
                        <div class="row">
                            <!-- Invoice Section -->
                            <div class="col-md-9">
                                <button class="btn btn-label-success" id="exportButton" onclick="exportPDF()">PRINT INVOICE</button>
                                <section class="invoice-container">
                                    <div class="card">
                                        <div class="card-header">
                                            <h2>ALIHOTEL INVOICE</h2>
                                            <%
                                                Date now = new Date();
                                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                                String formattedDate = sdf.format(now);
                                            %>
                                            <p>Ha Noi, <%= formattedDate %></p>
                                        </div>
                                        <div class="card-body">
                                            <!-- Customer and Hotel Information in the Same Row -->
                                            <div class="row invoice-header">
                                                <c:set var="g" value="${sessionScope.guest}"/>
                                                <div class="col-6">
                                                    <h4><b>Customer Information</b></h4>
                                                    <p>Name: ${g.name}</p>
                                                    <p>Contact: ${g.phone}</p>
                                                    <p>Nationality: ${g.nationality}</p>
                                                    <p>Email: ${g.email}</p>
                                                </div>
                                                <div class="col-6">
                                                    <h4><b>Hotel Information</b></h4>
                                                    <p>Hotel Name: ALI HOTEL</p>
                                                    <p>Hotline: 1900 1833</p>
                                                    <p>Email: ali33hotel@gmail.com</p>
                                                    <p>Address: Beta Building, FPT University</p>
                                                </div>
                                            </div>

                                            <!-- Invoice Details in a Table -->
                                            <div class="invoice-table">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Room</th>
                                                            <th>Price per Night</th>
                                                            <th>Services</th>
                                                            <th>Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${sessionScope.allBookingRoom}" var="br">
                                                            <tr>
                                                                <c:set var="serviceTotal" value="0" />
                                                                <c:forEach items="${sessionScope.listRoom}" var="r">
                                                                    <c:if test="${r.roomId == br.roomID}">
                                                                        <td>Room: ${r.roomNumber}</td>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <td><span class="price-vnd">${br.price}</span> x ${br.numOfNight}</td>
                                                                <td>
                                                                    <table class="table table-sm table-borderless">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Service</th>
                                                                                <th>Quantity</th>
                                                                                <th>Total Price</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <c:forEach items="${sessionScope.allBookingService}" var="bs">
                                                                                <c:if test="${bs.roomID == br.roomID}">
                                                                                    <c:forEach items="${sessionScope.listService}" var="s">
                                                                                        <c:if test="${s.serviceID == bs.serviceID}">
                                                                                            <tr>
                                                                                                <td>${s.name}</td>
                                                                                                <td>${bs.quantity}</td>
                                                                                                <td><span class="price-vnd">${bs.totalPrice}</span></td>
                                                                                            </tr>
                                                                                            <c:set var="serviceTotal" value="${serviceTotal + bs.totalPrice}" />
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td>
                                                                    <c:set var="roomTotal" value="${br.price * br.numOfNight + serviceTotal}" />
                                                                    <span class="price-vnd">${roomTotal}</span>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        <!-- Conditionally Display Fine -->
                                                        <c:if test="${sessionScope.invoice.fine >= 0}">
                                                            <tr class="fine-highlight">
                                                                <td colspan="3"><b>Note and Fine:</b></td>
                                                                <td>
                                                                    <table class="table table-sm table-borderless">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Description</th>
                                                                                <th>Extra Fee</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>${sessionScope.invoice.note}</td>
                                                                                <td>+<span class="price-vnd">${sessionScope.invoice.fine}</span></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <tr>
                                                            <td colspan="3"><b>Grand Total:</b></td>
                                                            <td><span class="price-vnd">${sessionScope.invoice.finalAmount}</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"><b>Deposit:</b></td>
                                                            <td><span class="price-vnd">-${sessionScope.booking.deposit}</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"><b>Final Total:</b></td>
                                                            <td><span class="price-vnd">${sessionScope.invoice.finalAmount - sessionScope.booking.deposit }</span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <!-- Footer -->
                                        <div class="card-footer text-center">
                                            <p>Thank you for staying with us!</p>
                                            <p>Contact us at: <a href="mailto:ali33hotel@gmail.com">ali33hotel@gmail.com</a></p>
                                        </div>
                                    </div>
                                </section>
                            </div>

                            <!-- Payment Method Section -->
                            <div class="col-md-3">
                                <section>
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>Select Payment Method</h4>
                                        </div>
                                        <div class="card-body">
                                            <form action="checkout" method="post">
                                                <input type="hidden" value="${sessionScope.bookingId}" name="bookingId">
                                                <label for="paymentMethod">Payment Method</label>
                                                <select class="form-control" id="paymentMethod" name="paymentMethod">
                                                    <option value="2">Cash</option>
                                                    <option value="1">Online Banking</option>
                                                </select>
                                                <button type="submit" class="btn btn-primary mt-3">Proceed to Payment</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="mb-0">Extra Fee</h4>
                                        </div>
                                        <div class="card-body">
                                            <form class="modify" action="modifyInvoice" method="post">
                                                <input type="hidden" value="${sessionScope.invoice.invoiceNo}" name="invoiceId">

                                                <div class="mb-3">
                                                    <label for="note" class="form-label"><strong>Note</strong></label>
                                                    <input type="text" class="form-control" id="note" name="note" value="${sessionScope.invoice.note}" placeholder="Enter notes here..." />
                                                    <small id="noteError" class="form-text text-danger d-none">Note must contain only letters, digits, and a single space between words.</small>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="fine" class="form-label"><strong>Extra Fee (VND)</strong></label>
                                                    <div class="input-group">
                                                        <span class="input-group-text">₫</span>
                                                        <input type="number" class="form-control" id="fine" min="0" max="100000000" name="fine" value="${sessionScope.invoice.fine}" placeholder="Enter fine amount" />
                                                        <small id="fineError" class="form-text text-danger d-none">Invalid input: number must not contain 'e' or scientific notation.</small>
                                                    </div>
                                                </div>

                                                <div class="text-end">
                                                    <button type="submit" class="btn btn-primary">Add Fine</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <script>
                                        const keyword = document.querySelector('input[name="fine"]');
                                        console.log(keyword);
                                        const errorMessage = document.getElementById("fineError");
                                        keyword.addEventListener("keypress", function (event) {
                                            if (event.key === "e" || event.key === "E") {
                                                event.preventDefault();
                                            }
                                        });
                                        keyword.onchange = function () {
                                            const numberPattern = /^[1-9][0-9]{0,2}$|^1000$/;
                                            if (!numberPattern.test(keyword.value)) {

                                            } else {

                                            }
                                        };
                                        document.querySelector('form.modify').addEventListener('submit', function (event) {
                                            const nameInput = document.querySelector('input[name="note"]');

                                            // Trim leading and trailing spaces
                                            nameInput.value = nameInput.value.trim();

                                            // Replace multiple spaces between words with a single space
                                            nameInput.value = nameInput.value.replace(/\s+/g, ' ');

                                            // Validate name (letters and single spaces between words)
                                            const namePattern = /^[A-Za-zÀ-ỹ0-9.,:]+(?:\s[A-Za-zÀ-ỹ0-9.,:]+)*$/;
                                            if (!namePattern.test(nameInput.value)) {
                                                alert("Name can only contain letters and single spaces between words.");
                                                event.preventDefault();
                                                return;
                                            }
                                        });

                                    </script>


                                </section>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Core JS Files -->
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

                                        function exportPDF() {
                                            var printContents = document.querySelector('.invoice-container').innerHTML;
                                            var originalContents = document.body.innerHTML;

                                            // Set the entire body to just the print area
                                            document.body.innerHTML = printContents;

                                            // Trigger print dialog
                                            window.print();

                                            // Restore the original content after printing
                                            document.body.innerHTML = originalContents;
                                        }
        </script>
    </body>
</html>
