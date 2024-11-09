<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <title>Booking List</title>
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
                            <h3 class="fw-bold mb-3">Booking List</h3>
                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <nav
                                            class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                                            >
                                            <c:set value="${fn:trim(requestScope.searchCode)}" var="n"/>
                                            <form action="searchBooking">
                                                <div class="input-group" >
                                                    <div class="input-group-prepend">
                                                        <button type="submit" class="btn btn-search pe-1">
                                                            <i class="fa fa-search search-icon"></i>
                                                        </button>
                                                    </div>
                                                    <c:if test="${fn:length(n) < 2}">
                                                        <input
                                                            type="text"
                                                            name="bookingcode"
                                                            placeholder="Search by bookingcode..."
                                                            class="form-control"
                                                            />
                                                    </c:if>
                                                    <c:if test="${fn:length(n) > 1}">
                                                        <input
                                                            type="text"
                                                            name="bookingcode"
                                                            value="${n}"
                                                            placeholder="Search by bookingcode..."
                                                            class="form-control"
                                                            />
                                                    </c:if>
                                                </div>
                                            </form>
                                        </nav>
                                        <c:set value="${requestScope.noti}" var="noti" />

                                        <form action="filterBooking" style="margin-left: 20px">
                                            <span></span>
                                            <select class="form-select-sm col-2 me-3" name="filterOption" style="width: 150px">
                                                <option value="0" ${requestScope.filterOption == '0' ? 'selected' : ''}>All</option>
                                                <option value="1" ${requestScope.filterOption == '1' ? 'selected' : ''}>No Show</option>
                                                <option value="2" ${requestScope.filterOption == '2' ? 'selected' : ''}>Overdue check-out</option>
                                                <option value="3" ${requestScope.filterOption == '3' ? 'selected' : ''}>Upcoming check-in</option>
                                                <option value="4" ${requestScope.filterOption == '4' ? 'selected' : ''}>Upcoming check-out</option>
                                                <option value="5" ${requestScope.filterOption == '5' ? 'selected' : ''}>Canceled booking</option>
                                            </select>
                                            <button class="btn btn-label-info ms-4" type="submit">Filter</button>
                                        </form>
                                        <button class="btn btn-primary btn-round ms-auto" onclick="addBooking()">
                                            <i class="fa fa-plus"></i> New booking
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
                                                    <th>BookingID</th>
                                                    <th>Guest Name</th>
                                                    <th>Receptionist</th>
                                                    <th>Deposit</th>
                                                    <th>Check-in Status</th>
                                                    <th>Paid Status</th>
                                                    <th>Booking date</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    GuestDAO gdao = new GuestDAO();UserDAO udao = new UserDAO();
                                                    List<Booking> listBooking = (List<Booking>) session.getAttribute("listBooking");
                                                    
                                                    for (Booking book : listBooking) {
                                                    Guest guest = gdao.getGuestByGuestID(book.getGuestID());
                                                    User user = udao.getUserByID(book.getUserID());
                                                %>
                                                <tr>
                                                    <td><%= book.getBookingID()%></td>
                                                    <!-- Room Type -->
                                                    <td><%= guest.getName()%>
                                                    </td>
                                                    <!-- Room Capacity -->
                                                    <td><%= user.getName()%>
                                                    </td>
                                                    <!-- Room Status -->
                                                    <% 
                                                        double price = book.getDeposit();
                                                         Locale localeVN = new Locale("vi", "VN");
                                                            // Create a currency instance for the Vietnamese Dong
                                                            Currency vnd = Currency.getInstance(localeVN);
                                                            // Create a NumberFormat instance
                                                            NumberFormat formatterPrice = NumberFormat.getCurrencyInstance(localeVN);
                                                            // Format the price
                                                            String formattedPrice = formatterPrice.format(price);
                                                    %>
                                                    <td><%= formattedPrice %></td>
                                                    <td><%= (book.getCheckInStatus() == 1) ? "<span style='color: green; font-weight: bold'>Checked-in</span>" : "<span style='color: red; font-weight: bold'>Not yet</span>" %></td>
                                                    <td><%= (book.getPaidStatus() == 1) ? "<span style='color: green; font-weight: bold'>Paid</span>" : "<span style='color: red; font-weight: bold'>Unpaid</span>" %>
                                                    </td>
                                                    <td><%= book.getBookingDate() %></td>
                                                    <!-- View Details Button -->
                                                    <td style="text-align: center">
                                                        <div class="form-button-action">
                                                            <button
                                                                type="button"
                                                                data-bs-toggle="tooltip"
                                                                title=""
                                                                class="btn btn-link btn-primary btn-lg"
                                                                data-original-title="View detail"
                                                                >
                                                                <a href="bookingDetail?bookingid=<%= book.getBookingID()%>">
                                                                    <i class="fa fa-eye"></i>
                                                                </a>
                                                            </button>
                                                            <a href="editBooking?bookingid=<%= book.getBookingID()%>" >
                                                                <button
                                                                    type="button"
                                                                    data-bs-toggle="tooltip"
                                                                    title=""
                                                                    class="btn btn-link btn-primary btn-lg"
                                                                    data-original-title="Edit booking"
                                                                    >
                                                                    <i class="fa fa-edit"></i>
                                                                </button>
                                                            </a>
                                                            <% if(book.getCheckInStatus() == 0 && book.getTotalPrice() > 0){
                                                            %>
                                                            <button
                                                                type="button"
                                                                data-bs-toggle="tooltip"
                                                                id="alertdelete"
                                                                class="btn btn-link btn-danger alertdelete"
                                                                data-original-title="Remove"
                                                                onclick="confirmDelete(<%= book.getBookingID()%>)"
                                                                >
                                                                <i class="fa fa-times"></i>
                                                            </button>
                                                            <%
                                                                };
                                                            %>


                                                        </div>

                                                    </td>
                                                </tr>
                                                <%
                                                    }

                                                %>
                                                <c:if test="${requestScope.notiSearch != null}">
                                                    <tr>
                                                        <td style="text-align: center; font-weight: bold" colspan="9"><p class="text-danger">${requestScope.notiSearch}</p></td><!-- comment --></tr>
                                                        </c:if>
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
                                                    <a class="page-link" href="bookingList?index=${index-1}" aria-label="Previous">
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
                                                            <a class="page-link" href="bookingList?index=${p}">${p}</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${index != p}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="bookingList?index=${p}">${p}</a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                                <li class="page-item ${index < Nopage ? '' :'disabled' }" >
                                                    <a class="page-link" href="bookingList?index=${index+1}" aria-label="Next">
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
                                                                    function addBooking() {
                                                                        window.location = "booking";
                                                                    }
        </script>

        <script>
            function doDelete(bookingid) {
                window.location = "deleteBooking?bookingid=" + bookingid;
            }
            function confirmDelete(bookingid) {
                // Hỏi người dùng có chắc chắn muốn xóa hay không
                swal({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    type: "warning",
                    buttons: {
                        confirm: {
                            text: "Yes, delete it!",
                            value: true,
                            visible: true,
                            className: "btn btn-success",
                            closeModal: false
                        }, cancel: {
                            text: "Cancel",
                            value: null,
                            visible: true,
                            className: "btn btn-danger",
                            closeModal: true,
                        }

                    }
                }).then(function (Delete) {
                    if (Delete) {
                        // Nếu người dùng xác nhận, thực hiện xóa
                        doDelete(bookingid);
                    } else {
                        // Nếu người dùng hủy, đóng cảnh báo
                        swal.close();
                    }
                });
            }
        </script>
    </body>
</html>
