<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                                            <tbody>
                                                <c:forEach var="amenities" items="${amenities}">
                                                    <tr>
                                                        <c:forEach var="amen" items="${listAmen}">
                                                            <c:if test="${amen.amenID == amenities.amenID}">
                                                                <td>${amen.amenName}</td> <!-- Hiển thị tên tiện nghi -->
                                                            </c:if>
                                                        </c:forEach>
                                                        <td>${room.roomNumber}</td> <!-- Số phòng -->
                                                        <td>${amenities.quantity}</td> <!-- Số lượng -->
                                                        <td>
                                                            <select class="form-select update" name="status" data-room-id="${amenities.roomID}" data-field="status" data-amen-id="${amenities.amenID}">
                                                                <option value="1" ${amenities.status == 1 ? 'selected' : ''}>In Use</option>
                                                                <option value="2" ${amenities.status == 2 ? 'selected' : ''}>Maintaining</option>
                                                                <option value="3" ${amenities.status == 3 ? 'selected' : ''}>Broken</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>

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
                        $('.update').on('change', function () {
                            const roomId = $(this).data('room-id'); // Lấy Room ID từ thuộc tính data
                            const field = $(this).data('field'); // Lấy tên trường từ thuộc tính data
                            const value = $(this).val(); // Lấy giá trị đã chọn
                            const amenID = $(this).data('amen-id'); // Lấy Amenity ID từ thuộc tính data

                            // Gọi AJAX để cập nhật cơ sở dữ liệu
                            $.ajax({
                                url: 'updateAmenityStatus', // Đường dẫn đến servlet của bạn
                                method: 'POST',
                                data: {
                                    amenID: amenID,
                                    roomId: roomId,
                                    value: value
                                },
                                success: function (response) {
                                    // Xử lý khi thành công, bạn có thể hiển thị thông báo
                                    alert('Update successfully');
                                },
                                error: function (xhr, status, error) {
                                    // Xử lý khi có lỗi
                                    alert('Update failed: ' + error);
                                }
                            });
                        });
                    });
                </script>


                </body>
                </html>
