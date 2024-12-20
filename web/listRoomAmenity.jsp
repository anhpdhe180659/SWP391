<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Dashboard for receptionist</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <link
            rel="icon"
            href="img/logo/logo.png"
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
        <!--<link rel="stylesheet" href="assets/css/demo.css" />-->
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <% Integer role = (Integer) session.getAttribute("role"); %>
            <c:choose>
                <c:when test="${role == 1}">
                    <%-- Hiển thị sidebar cho Manager --%>
                    <jsp:include page="sidebarManager.jsp"/>
                </c:when>
                <c:when test="${role == 2}">
                    <%-- Hiển thị sidebar cho Receptionist --%>
                    <jsp:include page="sidebarReceptionist.jsp"/>
                </c:when>
                <c:when test="${role == 3}">
                    <%-- Hiển thị sidebar cho Staff --%>
                    <jsp:include page="sidebarstaff.jsp"/>
                </c:when>
            </c:choose>

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
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="container">
                        <div class="page-inner">
                            <div class="page-header">
                                <h2 class="fw-bold mb-3">Room Status</h2>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">Room Amenity Status Statistics</h4>
                                        </div>
                                        <div class="card-body">
                                            <canvas id="amenityStatsChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body row">
                                        <h3 class="fw-bold mb-3">Room Filter</h3>
                                        <form action="listRoomAmenity">
                                            <span>Type</span>
                                            <select class="form-select-sm col-2 me-3" name="typeId">
                                                <option value="0" ${requestScope.typeId == '0' ? 'selected' : ''}>All</option>
                                                <option value="1" ${requestScope.typeId == '1' ? 'selected' : ''}>Single Room</option>
                                                <option value="2" ${requestScope.typeId == '2' ? 'selected' : ''}>Double Room</option>
                                                <option value="3" ${requestScope.typeId == '3' ? 'selected' : ''}>Family Room</option>
                                                <option value="4" ${requestScope.typeId == '4' ? 'selected' : ''}>Deluxe Room</option>
                                                <option value="5" ${requestScope.typeId == '5' ? 'selected' : ''}>President Room</option>
                                            </select>

                                            <span>Status</span>
                                            <select class="form-select-sm col-2 me-3" name="statusId">
                                                <option value="0" ${requestScope.statusId == '0' ? 'selected' : ''}>All</option>
                                                <option value="1" ${requestScope.statusId == '1' ? 'selected' : ''}>Available</option>
                                                <option value="2" ${requestScope.statusId == '2' ? 'selected' : ''}>Occupied</option>
                                                <option value="3" ${requestScope.statusId == '3' ? 'selected' : ''}>Under maintenance</option>
                                            </select>

                                            <span>Amenity Status</span>
                                            <select class="form-select-sm col-2 me-3" name="amenityStatus">
                                                <option value="0" ${requestScope.amenityStatus == '0' ? 'selected' : ''}>All</option>
                                                <option value="1" ${requestScope.amenityStatus == '1' ? 'selected' : ''}>Has Broken/Maintenance Amenities</option>
                                            </select>
                                            <button class="btn btn-label-info ms-4" type="submit">Filter</button>

                                        </form>
                                        <!--                                        <form id="searchForm" class="d-flex align-items-center mb-3">
                                                                                    <span class="me-2">Room Number:</span>
                                                                                    <input type="text" id="roomNumberInput" class="form-control col-4 me-4" placeholder="Enter room number" style="max-width: 250px;" />
                                                                                    <button type="button" class="btn btn-label-info" onclick="searchRoom()">Search</button>
                                                                                </form>-->

                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <div class="table-responsive">
                                                <table id="add-user" class="display table table-striped table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Room Number</th>
                                                            <th>Type</th>
                                                            <th>Room Status</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="roomTableBody">
                                                        <c:forEach items="${sessionScope.listRoom}" var="s">
                                                            <tr class="room-row">
                                                                <td>${s.roomNumber}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${s.typeId == 1}">Single Room</c:when>
                                                                        <c:when test="${s.typeId == 2}">Double Room</c:when>
                                                                        <c:when test="${s.typeId == 3}">Family Room</c:when>
                                                                        <c:when test="${s.typeId == 4}">Deluxe Room</c:when>
                                                                        <c:when test="${s.typeId == 5}">President Room</c:when>
                                                                    </c:choose>
                                                                </td>
                                                                <td class="${s.statusId == 1 ? 'text-bg-success' : (s.statusId == 2 ? 'text-bg-info' : 'text-bg-warning')}">
                                                                    ${s.statusId == 1 ? 'Available' : (s.statusId == 2 ? 'Occupied' : 'Under Maintenance')}
                                                                </td>
                                                                <td style="text-align: center">
                                                                    <a href="showRoomAmenities?id=${s.roomId}">
                                                                        <i class="far fa-eye me-3"></i>&nbsp;&nbsp;View Amenities of Room
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                <c:set value="${sessionScope.currentindex}" var="index" />
                                                <c:set value="${sessionScope.Nopage}" var="Nopage" />
                                                <div class="card-body">
                                                    <div class="demo">
                                                        <ul class="pagination pg-primary" style="display: flex; justify-content: flex-end;">
                                                            <div style="width: 100px; align-content: end">${index} of ${Nopage} page</div>
                                                            <li class="page-item ${index < 2 ? 'disabled' : ''}">
                                                                <a class="page-link" href="listRoomAmenity?index=${index - 1}&typeId=${requestScope.typeId}&statusId=${requestScope.statusId}&cleanId=${requestScope.cleanId}" aria-label="Previous">
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
                                                                <li class="page-item ${index == p ? 'active' : ''}">
                                                                    <a class="page-link" href="listRoomAmenity?index=${p}&typeId=${requestScope.typeId}&statusId=${requestScope.statusId}&cleanId=${requestScope.cleanId}">${p}</a>
                                                                </li>
                                                            </c:forEach>
                                                            <li class="page-item ${index < Nopage ? '' : 'disabled'}">
                                                                <a class="page-link" href="listRoomAmenity?index=${index + 1}&typeId=${requestScope.typeId}&statusId=${requestScope.statusId}&cleanId=${requestScope.cleanId}" aria-label="Next">
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
            function searchRoom() {
                const input = document.getElementById("roomNumberInput").value.toLowerCase();
                const rows = document.querySelectorAll(".room-row");
                let found = false; // Đánh dấu xem có phòng nào được tìm thấy không

                rows.forEach(row => {
                    const roomNumberCell = row.cells[0].textContent.toLowerCase();
                    if (roomNumberCell.includes(input) || input === "") {
                        row.style.display = ""; // Hiện hàng nếu tìm thấy
                        found = true;
                    } else {
                        row.style.display = "none"; // Ẩn hàng nếu không tìm thấy
                    }
                });

                // Nếu không có phòng nào tìm thấy, bạn có thể thông báo cho người dùng
                if (!found) {
                    alert("No rooms found with the specified number.");
                }
            }
            </script>
            <script>
                $(document).ready(function () {
                    $("#basic-datatables").DataTable({
                    });
                    $("#multi-filter-select").DataTable({
                        pageLength: 10,
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

                    //             Add Row

                });
            </script>
            <script>
                $(document).ready(function () {
                    $('.update').on('change', function () {
                        const roomId = $(this).data('room-id'); // Get room ID from data attribute
                        const field = $(this).data('field'); // Get field name from data attribute
                        const value = $(this).val(); // Get selected value
                        console.log(field);
                        // AJAX call to update the database
                        $.ajax({
                            url: 'updateCleanStatus', // Your servlet URL
                            method: 'POST',
                            data: {
                                roomId: roomId,
                                field: field,
                                value: value
                            },
                            success: function (response) {
                                // Handle success, you can show a notification or update the UI
                                alert('Update successfully');
                            },
                            error: function (xhr, status, error) {
                                // Handle error
                                alert('Update failed:');
                            }
                        });
                    });
                });
            </script>
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var ctx = document.getElementById('amenityStatsChart').getContext('2d');
                    var stats = {
                        labels: [
                            'Normal Rooms',
                            'Rooms Needing Maintenance',
                            'Rooms with Broken Amenities'
                        ],
                        datasets: [{
                                data: [
                ${maintenanceStats['Normal'] != null ? maintenanceStats['Normal'] : 0},
                ${maintenanceStats['Maintenance'] != null ? maintenanceStats['Maintenance'] : 0},
                ${maintenanceStats['Broken'] != null ? maintenanceStats['Broken'] : 0}
                                ],
                                backgroundColor: [
                                    '#2ecc71', // green for normal
                                    '#f1c40f', // yellow for maintenance
                                    '#e74c3c'  // red for broken
                                ]
                            }]
                    };

                    new Chart(ctx, {
                        type: 'pie',
                        data: stats,
                        options: {
                            responsive: true,
                            plugins: {
                                legend: {
                                    position: 'bottom'
                                },
                                title: {
                                    display: true,
                                    text: 'Room Amenity Status Distribution'
                                }
                            }
                        }
                    });
                });
            </script>
    </body>
</html>


