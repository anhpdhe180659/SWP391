<%-- 
    Document   : bookingDetail
    Created on : Oct 12, 2024, 7:32:03 PM
    Author     : nhatk
--%>
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
        <title>Booking Detail</title>
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
                            <h3 class="fw-bold mb-3">Booking Detail</h3>
                        </div>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header"><% Guest guest = (Guest) session.getAttribute("guest"); %>
                                    <div class="d-flex align-items-center">
                                        <div class="card-header">
                                            <h4 class="card-title" style="color: blueviolet">  Guest Name: <%= guest.getName()%></h4>
                                        </div>
                                        <button class="btn btn-primary btn-round ms-auto" onclick="BackToList()">
                                            <i class="fas fa-arrow-circle-left"></i> Back to List
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table
                                            class="display table table-striped table-hover" 
                                            style="text-align: center"
                                            >
                                            <thead>
                                                <tr>
                                                    <th>ROOMNAME</th>
                                                    <th>Number of night</th>
                                                    <th>Expected CHECKIN DATE</th>
                                                    <th>Expected CHECKOUT DATE</th>
                                                    <th>PRICE</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    GuestDAO gdao = new GuestDAO();UserDAO udao = new UserDAO();RoomDao rdao = new RoomDao();
                                                    List<BookingRoom> listBookingRoom = (List<BookingRoom>) session.getAttribute("listBookingRoom");
                                                    for (BookingRoom book : listBookingRoom) {
                                                    Room room = rdao.findRoomById(book.getRoomID());
                                                %>
                                                <tr>
                                                    <td><%= room.getRoomNumber() %></td>
                                                    <!-- Room Type -->
                                                    <% 
                                                        // Assuming book.getCheckInDate() returns a LocalDateTime
                                                        LocalDateTime checkInDate = book.getCheckInDate();  
                                                        LocalDateTime CheckOutDate = book.getCheckOutDate();  
                                                        // Define the desired formatter
                                                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                                                        // Format the LocalDateTime to the desired string format
                                                        String indate = checkInDate.format(formatter);
                                                        String outdate = CheckOutDate.format(formatter);
                                                    %>
                                                    <td>
                                                        <%= book.getNumOfNight() %> nights
                                                    </td>
                                                    <td>
                                                        <%= indate %>
                                                    </td>
                                                    <td>
                                                        <%= outdate %>
                                                    </td>
                                                    <% 
                                                        double price = book.getPrice();
                                                         Locale localeVN = new Locale("vi", "VN");
                                                            // Create a currency instance for the Vietnamese Dong
                                                            Currency vnd = Currency.getInstance(localeVN);
                                                            // Create a NumberFormat instance
                                                            NumberFormat formatterPrice = NumberFormat.getCurrencyInstance(localeVN);
                                                            // Format the price
                                                            String formattedPrice = formatterPrice.format(price);
                                                    %>
                                                    <td>
                                                        <%= formattedPrice %>
                                                    </td>
                                                </tr>
                                                <%
                                                    }

                                                %>

                                            </tbody>
                                        </table>
                                    </div>
                                    <c:set value="${sessionScope.currentindex}" var="index" />
                                    <c:set value="${sessionScope.Nopage}" var="Nopage" />
                                    <div class="card-body" >
                                        <div class="demo">
                                            <ul class="pagination pg-primary" style="display: flex; justify-content: flex-end;">
                                                <div style="width: 100px; align-content: end">${index} of ${Nopage} page</div>
                                                <li class="page-item ${index < 2 ? 'disabled' :'' } ">
                                                    <a class="page-link" href="bookingDetail?index=${index-1}" aria-label="Previous">
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
                                                            <a class="page-link" href="bookingDetail?index=${p}">${p}</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${index != p}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="bookingDetail?index=${p}">${p}</a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                                <li class="page-item ${index < Nopage ? '' :'disabled' }" >
                                                    <a class="page-link" href="bookingDetail?index=${index+1}" aria-label="Next">
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
                                            function BackToList() {
                                                window.location = "bookingList";
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
        <script>

        </script>
    </body>
</html>
