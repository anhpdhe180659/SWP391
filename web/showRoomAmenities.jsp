<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>View Room Amenities</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="img/logo/favicon.png" type="image/x-icon" />
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
        <style>
            .status-in-use {
                background-color: #d4edda; /* Màu xanh nhạt cho trạng thái "In Use" */
                color: #155724; /* Màu chữ xanh đậm */
            }
            .status-maintaining {
                background-color: #fff3cd; /* Màu vàng nhạt cho trạng thái "Maintaining" */
                color: #856404; /* Màu chữ vàng đậm */
            }
            .status-broken {
                background-color: #f8d7da; /* Màu đỏ nhạt cho trạng thái "Broken" */
                color: #721c24; /* Màu chữ đỏ đậm */
            }
        </style>

    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <jsp:include page="sidebarstaff.jsp"/>
            <!-- End Sidebar -->
            <div class="main-panel">
                <div class="main-header">
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <%
                        int role = (Integer) session.getAttribute("role");
                    %>
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Room Amenities</h3>
                        </div>

                        <div class="col-md-12">
                            <div class="card" style="border-radius: 10px;">
                                <div class="card-header text-white" style="border-top-left-radius: 10px; border-top-right-radius: 10px; background-color: #b6e8f3">
                                    <h4 class="card-title">Amenities in Room ${room.roomNumber}</h4>
                                </div>
                                <div class="card-body">
                                    <c:if test="${not empty amenities}">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Amenity</th>
                                                    <th>Room</th>
                                                    <th>Quantity</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="amenities" items="${amenities}">
                                                    <tr>
                                                        <c:forEach var="amen" items="${listAmen}">
                                                            <c:if test="${amen.amenID == amenities.amenID}">
                                                                <td>${amen.amenName}</td> <!-- Hiển thị tên tiện nghi -->
                                                            </c:if>
                                                        </c:forEach>
                                                        <td>${room.roomNumber}</td> <!-- Số phòng -->
                                                        <td>
                                                            <c:if test="${role == '1'}">
                                                                <input type="number" class="form-control quantity-input" value="${amenities.quantity}" data-room-id="${amenities.roomID}" data-amen-id="${amenities.amenID}" />
                                                            </c:if>
                                                            <c:if test="${role == '3'}">
                                                                ${amenities.quantity}
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <select class="form-select update ${amenities.status == 1 ? 'status-in-use' : amenities.status == 2 ? 'status-maintaining' : 'status-broken'}" name="status" data-room-id="${amenities.roomID}" data-field="status" data-amen-id="${amenities.amenID}">
                                                                <option value="1" ${amenities.status == 1 ? 'selected' : ''}>In Use</option>
                                                                <option value="2" ${amenities.status == 2 ? 'selected' : ''}>Maintaining</option>
                                                                <option value="3" ${amenities.status == 3 ? 'selected' : ''}>Broken</option>
                                                            </select>
                                                        </td>


                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                        <div class="form-group mt-4">
                                            <a href="listRoomAmenity" class="btn btn-secondary" style="border-radius: 5px;">Back to Room List</a>
                                        </div>
                                    </c:if>
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
                <!-- Kaiadmin JS -->
                <script src="assets/js/kaiadmin.min.js"></script>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script>
                    $(document).ready(function () {
                        // Lưu giá trị ban đầu của mỗi input số lượng
                        $('.quantity-input').each(function () {
                            $(this).data('original-value', $(this).val());
                        });

                        // Cập nhật trạng thái tiện nghi
                        $('.update').on('change', function () {
                            const roomId = $(this).data('room-id'); // Lấy Room ID từ thuộc tính data
                            const amenID = $(this).data('amen-id'); // Lấy Amenity ID từ thuộc tính data
                            const value = $(this).val(); // Lấy giá trị đã chọn

                            // Cập nhật trạng thái tiện nghi
                            updateAmenityStatus(roomId, amenID, value, this); // Truyền `this` vào hàm
                        });

                        // Cập nhật số lượng tiện nghi
                        $('.quantity-input').on('change', function () {
                            const roomId = $(this).data('room-id'); // Lấy Room ID từ thuộc tính data
                            const amenID = $(this).data('amen-id'); // Lấy Amenity ID từ thuộc tính data
                            const quantityInput = $(this).val().trim(); // Lấy giá trị số lượng mới và loại bỏ khoảng trắng
                            const originalValue = $(this).data('original-value'); // Lấy giá trị ban đầu

                            // Kiểm tra xem giá trị nhập vào có phải là số hay không
                            if (isNaN(quantityInput) || quantityInput === '') {
                                alert('Quantity must be a valid number');
                                $(this).val(originalValue); // Khôi phục lại giá trị ban đầu
                                return; // Dừng thực hiện nếu số lượng không hợp lệ
                            }

                            // Chuyển đổi giá trị sang số nguyên
                            const quantity = parseInt(quantityInput);

                            // Kiểm tra số lượng trước khi cập nhật
                            if (quantity <= 0 || quantity >= 10) {
                                alert('Quantity must be greater than 0 and less than 10');
                                $(this).val(originalValue); // Khôi phục lại giá trị ban đầu
                                return; // Dừng thực hiện nếu số lượng không hợp lệ
                            }

                            // Gọi hàm updateQuantity để cập nhật số lượng
                            updateQuantity(roomId, amenID, quantity);
                        });

                        // Cập nhật màu sắc ban đầu khi trang được tải
                        $('.update').each(function () {
                            updateStatusColor(this);
                        });
                    });

                    function updateAmenityStatus(roomId, amenID, status, selectElement) {
                        $.ajax({
                            url: 'updateAmenityStatus', // Đường dẫn đến servlet của bạn
                            method: 'POST',
                            data: {
                                amenID: amenID,
                                roomId: roomId,
                                value: status
                            },
                            success: function (response) {
                                alert('Update status successfully');
                                // Cập nhật màu sắc dropdown sau khi thay đổi
                                updateStatusColor(selectElement); // Cập nhật màu sắc cho select
                            },
                            error: function (xhr, status, error) {
                                alert('Update failed: ' + error);
                            }
                        });
                    }

                    function updateQuantity(roomID, amenID, quantity) {
                        $.ajax({
                            url: 'UpdateAmenityQuantityServlet', // Đường dẫn đến servlet của bạn
                            method: 'POST',
                            data: {
                                amenID: amenID,
                                roomId: roomID,
                                quantity: quantity
                            },
                            success: function (response) {
                                // Cập nhật giá trị mới cho input
                                $(`input[data-room-id="${roomID}"][data-amen-id="${amenID}"]`).val(quantity);
                                alert('Update quantity successfully');
                            },
                            error: function (xhr, status, error) {
                                alert('Update failed: ' + xhr.responseText);
                            }
                        });
                    }

                    function updateStatusColor(selectElement) {
                        const selectedValue = selectElement.value;

                        // Xóa tất cả các lớp trạng thái
                        selectElement.classList.remove('status-in-use', 'status-maintaining', 'status-broken');

                        // Thêm lớp tương ứng với trạng thái đã chọn
                        if (selectedValue == '1') {
                            selectElement.classList.add('status-in-use');
                        } else if (selectedValue == '2') {
                            selectElement.classList.add('status-maintaining');
                        } else if (selectedValue == '3') {
                            selectElement.classList.add('status-broken');
                        }
                    }
                </script>

                </body>
                </html>
