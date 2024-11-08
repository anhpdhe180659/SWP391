<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Add Service</title>
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

        <style>
            .services-container {
                display: flex;
                justify-content: space-between;
            }
            .service-list, .booked-list {
                width: 48%; /* Each side takes 48% of the width */
            }
            .service-list table, .booked-list table {
                width: 100%;
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
                    <jsp:include page="navbar-header.jsp"/>
                </div>
                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Add Service</h3>
                        </div>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Room  </h4>
                                        <button class="btn btn-primary btn-round ms-auto" onclick='window.location = "listRoom"'>
                                            <i class="fas fa-angle-left"></i>
                                            Back to list
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="services-container row">
                                        <!-- Left Side: Available Services -->
                                        <div class="service-list col-6">
                                            <h4>Available Services</h4>
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Service Name</th>
                                                        <th>Price</th>
                                                        <th>Add</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="available-services">
                                                    <c:forEach var="service" items="${sessionScope.listServiceAvailables}">
                                                        <tr id="service-row-${service.serviceID}">
                                                            <td>${service.name}</td>
                                                            <td><span class="price-vnd">${service.price}</span></td>
                                                            <td>
                                                                <button type="button" class="btn btn-primary"  
                                                                        onclick="moveServiceToBooked(${service.serviceID}, '${service.name}', ${service.price})">
                                                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>

                                        <!-- Right Side: Booked Services -->
                                        <div class="booked-list" style="overflow-x: auto;">
                                            <h4>Booked Services</h4>
                                            <table class="table table-striped" style="width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <th>Service Name</th>
                                                        <th>Price</th>
                                                        <th>Quantity</th>
                                                        <th>Total</th>
                                                        <th>Remove</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="booked-services">
                                                    <c:forEach var="bookedService" items="${sessionScope.bookingServices}">
                                                        <tr id="booked-row-${bookedService.serviceID}">
                                                            <c:forEach items="${sessionScope.listServices}" var="sv">
                                                                <c:if test="${bookedService.serviceID == sv.serviceID}">
                                                                    <td>${sv.name}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <td><span class="price-vnd">${bookedService.price}</span></td>
                                                            <td>
                                                                <input type="number" id="${bookedService.serviceID}" name="quantity_${bookedService.serviceID}" 
                                                                       value="${bookedService.quantity}" min="1" max="4" class="form-control"
                                                                       onchange="updatetQuantity(${bookedService.serviceID})"
                                                                       ">
                                                            </td>
                                                            <td>
                                                                <span class="price-vnd">${bookedService.totalPrice}</span> 
                                                            </td>
                                                            <td>
                                                                <button type="button" class="btn btn-danger" 
                                                                        onclick="removeBookedService(${bookedService.serviceID})">
                                                                    <i class="fa fa-times" aria-hidden="true"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <hr>
                                            <h4><strong><u><i>Total Price :</i></u> </strong><span class="price-vnd" style="margin-left: 240px">${requestScope.total}</span></h4>
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
                                                                            const url = window.location.href;

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

                                                                            function moveServiceToBooked(serviceId, serviceName, servicePrice) {
                                                                                $.post("addServiceBooking",
                                                                                        {
                                                                                            roomId: ${roomId},
                                                                                            bookingId: ${bookingId},
                                                                                            serviceId: serviceId
                                                                                        },
                                                                                        function (response) {
                                                                                            window.location = url;
                                                                                        }
                                                                                ).fail(function (xhr, status, error) {
                                                                                    // Handle error
                                                                                    console.error('Error adding service:', error);
                                                                                });
                                                                            }

                                                                            function removeBookedService(serviceID) {
                                                                                var check = confirm("Do you want to delete this service ?");
                                                                                if (check) {
                                                                                    $.post("deleteServiceBooking",
                                                                                            {
                                                                                                roomId: ${roomId},
                                                                                                bookingId: ${bookingId},
                                                                                                serviceId: serviceID
                                                                                            },
                                                                                            function (response) {
                                                                                                window.location = url;
                                                                                            }
                                                                                    ).fail(function (xhr, status, error) {
                                                                                        console.error('Error removing service:', error);
                                                                                    });
                                                                                }
                                                                            }

                                                                            function updatetQuantity(serviceId) {
                                                                                const value = document.querySelector(`input[name="quantity_\${serviceId}"]`).value;
                                                                                if (value > 4 || value < 1) {
                                                                                    alert("Re-enter quantity from 1 -> 4");
                                                                                    return;
                                                                                } else {
                                                                                    $.post("updateQuantityService",
                                                                                            {
                                                                                                roomId: ${roomId},
                                                                                                bookingId: ${bookingId},
                                                                                                serviceId: serviceId,
                                                                                                quantity: value
                                                                                            },
                                                                                            function (response) {
                                                                                                window.location = url;
                                                                                            }
                                                                                    ).fail(function (xhr, status, error) {
                                                                                        console.error('Error updating quantity:', error);
                                                                                    });
                                                                                }
                                                                            }
            </script>
        </div>
    </body>
</html>
