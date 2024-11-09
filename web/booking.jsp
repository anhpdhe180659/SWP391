
<%-- 
    Document   : forms
    Created on : Sep 19, 2024, 9:33:29 AM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page import="dal.*" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Booking</title>
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
                                        <div class="card-title" style="font-size: 24px;">Create booking</div>
                                    </div>
                                    <form action="booking" method="POST" onsubmit="validate()">
                                        <div class="card-body">
                                            <div class="d-flex align-items-center">
                                                <ul class="nav nav-pills nav-secondary" id="pills-tab" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" id="pills-guest-tab" data-bs-toggle="pill" href="#pills-guest" role="tab" aria-controls="pills-guest" aria-selected="true">Select room</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="pills-room-tab" data-bs-toggle="pill" href="#pills-room" role="tab" aria-controls="pills-room" aria-selected="false">Guest information</a>
                                                    </li>
                                                </ul>
                                                <c:set value="${requestScope.noti}" var="noti"/>
                                                <span style="margin-left: 25px; font-weight: bold;color: red">${noti}</span>
                                                <button class="btn btn-primary btn-round ms-auto" type="submit">
                                                    Save
                                                </button>
                                            </div>
                                            <div class="tab-content mt-2 mb-3" id="pills-tabContent">
                                                <div class="row tab-pane fade show active" id="pills-guest" role="tabpanel" aria-labelledby="pills-guest-tab"
                                                     >
                                                    <div>
                                                        <table
                                                            class="display table table-striped table-hover"
                                                            style="text-align: center"
                                                            >
                                                            <thead>
                                                                <tr>
                                                                    <th>Room Number</th>
                                                                    <th>Type</th>
                                                                    <th>Capacity</th>
                                                                    <th>Price/night</th>
                                                                    <th>Status</th>
                                                                    <th>Cleaning</th>
                                                                    <th>Select</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%
                                                                    List<Room> listRoom = (List<Room>) session.getAttribute("listRoomAvailable");
                                                                    RoomDao rdao = new RoomDao();
                                                                    for (Room room : listRoom) {
                                                                        int capacity = rdao.getCapacityByRoomID(room.getRoomId());
                                                                        int price = rdao.getPriceByRoomID(room.getRoomId());
                                                                        String typeName = rdao.getTypeNameByRoomID(room.getRoomId());
                                                                        String statusName = rdao.getStatusNameByRoomID(room.getRoomId());
                                                                        String cleaningStatus = rdao.getCleaningStatusNameByRoomID(room.getRoomId());
                                                                %>
                                                                <tr onclick="toggleCheckbox(<%= room.getRoomId() %>)">
                                                                    <td><%= room.getRoomNumber() %></td>
                                                                    <!-- Room Type -->
                                                                    <td><%= typeName %></td>
                                                                    <!-- Room Capacity -->
                                                                    <td><%= capacity %> bed(s)</td>
                                                                    <% 
                                                     Locale localeVN = new Locale("vi", "VN");
                                                        // Create a currency instance for the Vietnamese Dong
                                                        Currency vnd = Currency.getInstance(localeVN);
                                                        // Create a NumberFormat instance
                                                        NumberFormat formatterPrice = NumberFormat.getCurrencyInstance(localeVN);
                                                        // Format the price
                                                        String formattedPrice = formatterPrice.format(price);
                                                                    %>
                                                                    <td><%= formattedPrice %></td>
                                                                    <td style="
                                                                        <%
                                                                            if (room.getStatusId() == 2) {
                                                                                out.print("color: red;");
                                                                            } else if (room.getStatusId() == 1) {
                                                                                out.print("color: green;");
                                                                            } else if (room.getStatusId() == 3) {
                                                                                out.print("color: orange;");
                                                                            }
                                                                        %>
                                                                        "><%= statusName %></td>
                                                                    <td
                                                                        style="
                                                                        <%
                                                                            if (room.getCleanId() == 1) {
                                                                                out.print("color: red;");
                                                                            } else if (room.getCleanId() == 3) {
                                                                                out.print("color: green;");
                                                                            } else if (room.getCleanId() == 2) {
                                                                                out.print("color: orange;");
                                                                            }
                                                                        %>
                                                                        "><%= cleaningStatus %></td>
                                                                    <td style="text-align: center">
                                                                        <%if (room.getStatusId() != 3) {
                                                                        %>
                                                                        <input type="checkbox"
                                                                               id="checkbox_<%= room.getRoomId() %>" name="roomSelected" value="<%= room.getRoomId()%>" class="row-checkbox" data-price="<%= price %>" onclick="updateTotalPrice()"/>
                                                                        <%
                                                                           }
                                                                        %>

                                                                    </td>
                                                                </tr>
                                                                <%
                                                                    } 
                                                                %>
                                                            </tbody>
                                                        </table>

                                                    </div>

                                                </div>
                                                <c:set value="${requestScope.name}" var="name"/>
                                                <c:set value="${requestScope.phone}" var="phone"/>
                                                <c:set value="${requestScope.email}" var="email"/>
                                                <c:set value="${requestScope.nationality}" var="nationality"/>
                                                <c:set value="${requestScope.identification}" var="identification"/>
                                                <c:set value="${requestScope.address}" var="address"/>
                                                <c:set value="${requestScope.gender}" var="gender"/>
                                                <c:set value="${requestScope.checkindate}" var="checkindate"/>
                                                <c:set value="${requestScope.checkoutdate}" var="checkoutdate"/>
                                                <div class="row tab-pane fade" id="pills-room" role="tabpanel" aria-labelledby="pills-room-tab">
                                                    <div style="display: flex">
                                                        <div class="col-md-3 col-lg-3">
                                                            <div class="form-group">
                                                                <label for="name"><i class="fas fa-address-book"></i> Name </label>
                                                                <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    id="name"
                                                                    name="name"
                                                                    maxlength="100"
                                                                    value="${name}"
                                                                    pattern="^[A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ][a-zàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]*(?:[ ][A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ][a-zàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]*)*$"
                                                                    title="Name contains only character and space, length should less than 100"
                                                                    placeholder="Enter guest's full name"
                                                                    required
                                                                    />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="phone"><i class="fas fa-phone"></i> Phone</label>
                                                                <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    id="phone"
                                                                    name="phone"
                                                                    maxlength="50"
                                                                    value="${phone}"
                                                                    placeholder="Enter phone number"
                                                                    pattern="^\d{10}$"
                                                                    title="Valid phone number must be 10 digits long"
                                                                    required
                                                                    />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="nationality"><i class="fas fa-globe"></i> Nationality</label>
                                                                <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    id="nationality"
                                                                    name="nationality"
                                                                    value="${nationality}"
                                                                    pattern="^[A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ][a-zàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]*(?:[ ][A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ][a-zàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]*)*$""
                                                                    title="Nationality should contain only letters and spaces, up to 50 characters."
                                                                    maxlength="50"
                                                                    placeholder="Enter nationality"
                                                                    list="countryList"
                                                                    required
                                                                    />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <div class="form-group">
                                                                <label for="iden"><i class="fas fa-address-card"></i> Identification</label>
                                                                <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    id="identification"
                                                                    name="identification"
                                                                    maxlength="20"
                                                                    value="${identification}"
                                                                    placeholder="Enter identification"
                                                                    pattern="^[A-Z]{1}[0-9]{7}|[0-9]{9}|[0-9]{12}$"
                                                                    title="Valid ID contains 1 uppercase letters and 7 digits, 9 or 12 digits"
                                                                    required
                                                                    />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="address"><i class="fas fa-map-marker-alt"></i> Address</label>
                                                                <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    id="address"
                                                                    name="address"
                                                                    maxlength="200"
                                                                    pattern="^[\p{L}\p{N}\s,.'-]+$"
                                                                    title="Address can contain letters, numbers, spaces, commas, periods, apostrophes, and hyphens."
                                                                    value="${address}"
                                                                    placeholder="Enter address"
                                                                    required
                                                                    />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="dob"><i class="fas fa-birthday-cake"></i> Date of birth</label>
                                                                <input
                                                                    type="date"
                                                                    class="form-control"
                                                                    id="birthday"
                                                                    name="birthday"
                                                                    required
                                                                    />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <div class="form-group">
                                                                <label for="iden"><i class="far fa-calendar-check"></i> Expected Check-in Date</label>
                                                                <input
                                                                    type="date"
                                                                    class="form-control"
                                                                    id="checkindate"
                                                                    name="checkindate"
                                                                    value="${checkindate}"
                                                                    placeholder="Enter identification"
                                                                    required
                                                                    onchange="calculateTotalStayPrice()"
                                                                    />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="address"><i class="far fa-calendar-times"></i> Expected Check-out Date</label>
                                                                <input
                                                                    type="date"
                                                                    class="form-control"
                                                                    id="checkoutdate"
                                                                    name="checkoutdate"
                                                                    value="${checkoutdate}"
                                                                    placeholder="Enter address"
                                                                    required
                                                                    onchange="calculateTotalStayPrice()"
                                                                    />
                                                                <!--datetime-local-->
                                                            </div>
                                                            <div class="form-group">
                                                                <label><i class="fab fa-telegram"></i> Email</label>
                                                                <input
                                                                    id="email"
                                                                    name="email"
                                                                    type="text"
                                                                    value="${email}"
                                                                    class="form-control"
                                                                    placeholder="Enter guest's email"
                                                                    />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-lg-3">
                                                            <div class="form-group">
                                                                <label><i class="fas fa-money-bill-wave"></i> Total Price</label>
                                                                <div id="totalPriceContainer" style="text-align: left; font-weight: bold; margin-top: 10px;color: green">
                                                                    Total Price: <span id="totalPrice">0</span>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">

                                                                <label><i class="fas fa-transgender"></i> Gender</label><br />
                                                                <div class="d-flex">
                                                                    <div class="form-check">
                                                                        <input
                                                                            class="form-check-input"
                                                                            type="radio"
                                                                            name="gender"
                                                                            id="flexRadioDefault1"
                                                                            value="1"
                                                                            <c:if test="${gender == 1 || gender == null}">
                                                                                checked
                                                                            </c:if>
                                                                            />
                                                                        <label
                                                                            class="form-check-label"
                                                                            for="flexRadioDefault1"
                                                                            >
                                                                            Male
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check">
                                                                        <input
                                                                            class="form-check-input"
                                                                            type="radio"
                                                                            name="gender"
                                                                            id="flexRadioDefault2"
                                                                            <c:if test="${gender == 0}">
                                                                                checked
                                                                            </c:if>
                                                                            value="0"
                                                                            />
                                                                        <label
                                                                            class="form-check-label"
                                                                            for="flexRadioDefault2"
                                                                            >
                                                                            Female
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <input
                                                                type="time"
                                                                class="form-control"
                                                                name="checkintime"
                                                                value="14:00"
                                                                required
                                                                readonly=""
                                                                hidden=""
                                                                />
                                                        </div>
                                                        <div class="form-group">
                                                            <input
                                                                type="time"
                                                                class="form-control"
                                                                name="checkouttime"
                                                                value="12:00"
                                                                readonly=""
                                                                hidden=""
                                                                />
                                                        </div>
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
            function calculateTotalStayPrice() {
                const checkinDate = document.getElementById("checkindate").value;
                const checkoutDate = document.getElementById("checkoutdate").value;

                // Parse dates and calculate the difference in days
                if (checkinDate && checkoutDate) {
                    const checkin = new Date(checkinDate);
                    const checkout = new Date(checkoutDate);
                    const stayDuration = (checkout - checkin) / (1000 * 60 * 60 * 24); // Difference in days
                    if (stayDuration > 0) {
                        // Calculate the base total price of selected rooms
                        let baseTotalPrice = 0;
                        const checkboxes = document.querySelectorAll('.row-checkbox:checked');
                        checkboxes.forEach(checkbox => {
                            baseTotalPrice += parseInt(checkbox.getAttribute('data-price'));
                        });

                        // Calculate the final total price based on the stay duration
                        const totalStayPrice = baseTotalPrice * stayDuration;
                        document.getElementById('totalPrice').innerText = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(totalStayPrice);
                    } else {
                        document.getElementById('totalPrice').innerText = "0 ₫";
                    }
                } else {
                    document.getElementById('totalPrice').innerText = "0 ₫";
                }
            }

            // Update the total price when a room checkbox is selected or deselected
            function updateTotalPrice() {
                calculateTotalStayPrice();
            }
            function toggleCheckbox(roomId) {
                var checkbox = document.getElementById("checkbox_" + roomId);
                checkbox.checked = !checkbox.checked;
                updateTotalPrice();
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
        <script></script>
        <script>
            // Get today's date in yyyy-mm-dd format
            const today = new Date().toISOString().split('T')[0];
            const today2 = new Date();
            // Set the max attribute for the birthday input to today's date
            const minAgeDate = new Date(today2.getFullYear() - 18, today2.getMonth(), today2.getDate());
            // Set the max attribute for the birthday input to the date 18 years ago
            document.getElementById("birthday").setAttribute("max", minAgeDate.toISOString().split('T')[0]);

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
            document.getElementById("address").addEventListener("blur", function () {
                const address = this.value.trim();
                const pattern = /^[\p{L}\p{N}\s,.'-]+$/u; // Supports letters, numbers, and common punctuation
                if (address !== "") {
                    if (!pattern.test(address)) {
                        alert("Invalid address. Please use only letters, numbers, spaces, commas, periods, apostrophes, and hyphens.");
                        this.value = "";
                        return; 
                    }
                }
            });
            document.getElementById("email").addEventListener("blur", function () {
                const email = this.value.trim();
                const regexEmail = /^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$/;
                if (email !== "") {
                    if (!regexEmail.test(email)) {
                        alert("Please enter a valid Email address (example@gmail.com)");
                        this.value = "";
                        return; 
                    }
                }
            });
            document.getElementById("nationality").addEventListener("blur", function () {
                const nationality = this.value.trim();
                const patternNationality = /^[\p{L} ]+$/u;
                if (nationality !== "") {
                    if (!patternNationality.test(nationality)) {
                        alert("Invalid nationality. Please use only letters, spaces, periods, and hyphens.");
                        this.value = "";
                        return; 
                    }
                }
            });
        </script>
        <script>
            function validate() {
                var checkboxes = document.querySelectorAll("input[name='roomSelected']");
                var isChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
                if (!isChecked) {
                    alert("Please select at least one room.");
                    return false;
                } else {
                    var option = confirm("Are you sure to save this booking?");
                    if (option === true) {
                        return true;
                    }
                    return false;
                }
            }
        </script>
        <script>
            document.getElementById("name").addEventListener("blur", function () {
                const nameInput1 = document.getElementById("name").value;
                // Check if the input contains only spaces
                if (nameInput1 !== "" && nameInput1.trim() === "") {
                    alert("The name field cannot contain only spaces.");
                    // Optionally, you can clear the field or take any other action
                    document.getElementById("name").value = ""; // Clear the field
                }
            });
            document.getElementById("email").addEventListener("blur", function () {
                const nameInput2 = document.getElementById("email").value;

                // Check if the input contains only spaces
                if (nameInput2 !== "" && nameInput2.trim() === "") {
                    alert("The email field cannot contain only spaces.");
                    // Optionally, you can clear the field or take any other action
                    document.getElementById("email").value = ""; // Clear the field
                }
            });
            document.getElementById("identification").addEventListener("blur", function () {
                const nameInput3 = document.getElementById("identification").value;

                // Check if the input contains only spaces
                if (nameInput3 !== "" && nameInput3.trim() === "") {
                    alert("The identification field cannot contain only spaces.");
                    // Optionally, you can clear the field or take any other action
                    document.getElementById("identification").value = ""; // Clear the field
                }
            });
            document.getElementById("phone").addEventListener("blur", function () {
                const nameInput4 = document.getElementById("phone").value;

                // Check if the input contains only spaces
                if (nameInput4 !== "" && nameInput4.trim() === "") {
                    alert("The phone field cannot contain only spaces.");
                    // Optionally, you can clear the field or take any other action
                    document.getElementById("phone").value = ""; // Clear the field
                }
            });
            document.getElementById("address").addEventListener("blur", function () {
                const nameInput5 = document.getElementById("address").value;
                // Check if the input contains only spaces
                if (nameInput5 !== "" && nameInput5.trim() === "") {
                    alert("The address field cannot contain only spaces.");
                    // Optionally, you can clear the field or take any other action
                    document.getElementById("address").value = ""; // Clear the field
                }
            });
            document.getElementById("nationality").addEventListener("blur", function () {
                const nameInput6 = document.getElementById("nationality").value; // Loại bỏ khoảng trắng ở đầu và cuối
                // Kiểm tra nếu trường không rỗng và không chỉ chứa khoảng trắng
                if (nameInput6 !== "" && nameInput6.trim() === "") {
                    alert("The nationality field cannot contain only spaces.");
                    document.getElementById("nationality").value = ""; // Xóa giá trị nếu chỉ chứa khoảng trắng
                    return; // Dừng không kiểm tra tiếp
                }
            });
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

