<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>List Guests</title>
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
            <jsp:include page="sidebarManager.jsp"/>
            <!-- End Sidebar -->
            <div class="main-panel">
                <div class="main-header">
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Guest List</h3>
                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <!--<h4 class="card-title">Add New Guest</h4>-->
                                        <button class="btn btn-primary btn-round ms-auto" onclick="addGuest()">
                                            <i class="fa fa-plus"></i> Add Guest
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table
                                            id="multi-filter-select"
                                            class="display table table-striped table-hover"
                                            >
                                            <thead>
                                                <tr>
                                                    <th>Room Number</th>
                                                    <th>Type</th>
                                                    <th>Capacity</th>
                                                    <th>Price/day</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listRoomAvailable}" var="s">
                                                    <tr>
                                                        <td>${s.roomNumber}</td>
                                                        <!-- Room Type -->
                                                        <td>
                                                            <select disabled class="form-select update text-bg-light" name="typeId" data-room-id="${s.roomId}" data-field="typeId">
                                                                <option value="1" ${s.typeId == 1 ? 'selected' : ''}>Single Room</option>
                                                                <option value="2" ${s.typeId == 2 ? 'selected' : ''}>Double Room</option>
                                                                <option value="3" ${s.typeId == 3 ? 'selected' : ''}>Family Room</option>
                                                                <option value="4" ${s.typeId == 4 ? 'selected' : ''}>Deluxe Room</option>
                                                                <option value="5" ${s.typeId == 5 ? 'selected' : ''}>President Room</option>
                                                            </select>
                                                        </td>
                                                        <!-- Room Capacity -->
                                                        <td>
                                                            <select disabled class="form-select update text-bg-light" name="cleanId" data-room-id="${s.roomId}" data-field="cleanId">
                                                                <option value="1" ${s.typeId == 1 ? 'selected' : ''}>1 bed</option>
                                                                <option value="2" ${s.typeId == 2 ? 'selected' : ''}>2 beds</option>
                                                                <option value="3" ${s.typeId == 3 ? 'selected' : ''}>4 beds</option>
                                                                <option value="4" ${s.typeId == 4 ? 'selected' : ''}>2 beds</option>
                                                                <option value="5" ${s.typeId == 5 ? 'selected' : ''}>2 beds</option>
                                                            </select>
                                                        </td>
                                                        <!-- Room Status -->
                                                        <td>
                                                            <select disabled class="form-select update text-bg-light" name="statusId" data-room-id="${s.roomId}" data-field="statusId">
                                                                <option value="1" ${s.typeId == 1 ? 'selected' : ''}><fmt:formatNumber value="500000" type="number" groupingUsed="true" pattern="#,###"/> ₫</option>
                                                                <option value="2" ${s.typeId == 2 ? 'selected' : ''}><fmt:formatNumber value="800000" type="number" groupingUsed="true" pattern="#,###"/> ₫</option>
                                                                <option value="3" ${s.typeId == 3 ? 'selected' : ''}><fmt:formatNumber value="1500000" type="number" groupingUsed="true" pattern="#,###"/> ₫</option>
                                                                <option value="4" ${s.typeId == 4 ? 'selected' : ''}><fmt:formatNumber value="2000000" type="number" groupingUsed="true" pattern="#,###"/> ₫</option>
                                                                <option value="5" ${s.typeId == 5 ? 'selected' : ''}><fmt:formatNumber value="5000000" type="number" groupingUsed="true" pattern="#,###"/> ₫</option>
                                                            </select>
                                                        </td>
                                                        <!-- View Details Button -->
                                                        <td style="text-align: center">
                                                            <a href="viewDetail?id=${s.roomId}">
                                                                <i class="far fa-eye me-3"></i>&nbsp;&nbsp;View
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
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
