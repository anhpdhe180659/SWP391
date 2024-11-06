<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*, model.AmenityDetail, model.RoomType" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Update Amenity by Room Type</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="img/logo/favicon.png" type="image/x-icon" />
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
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
        <style>
            .form-container {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
            }
            .message-success {
                background-color: #d4edda;
                color: #155724;
                padding: 10px;
                border-radius: 5px;
                margin-top: 10px;
            }
            .message-error {
                background-color: #f8d7da;
                color: #721c24;
                padding: 10px;
                border-radius: 5px;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar would go here -->

            <div class="main-panel">
                <div class="main-header">
                    <jsp:include page="navbar-header.jsp"/>
                </div>
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


                <div class="container">
                    <div class="page-inner">
                        
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Update Room Type Amenities</h3>
                        </div>
                        <div class="col-md-12">
                            <div class="card" style="border-radius: 10px;">
                                <div class="card-header text-white" style="border-top-left-radius: 10px; border-top-right-radius: 10px; background-color: #b6e8f3">
                                    <h4 class="card-title">Update Amenity Quantity</h4>
                                </div>
                                <div class="card-body">
                                    <div class="form-container">
                                        <form action="UpdateAmenByRoomtype" method="post">
                                            <div class="form-group">
                                                <label for="typeId">Room Type</label>
                                                <select class="form-control" id="typeId" name="typeId" required>
                                                    <c:forEach var="roomType" items="${roomTypes}">
                                                        <option value="${roomType.typeId}">${roomType.typeName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>


                                            <div class="form-group">
                                                <label for="amenID">Amenity ID</label>
                                                <input type="number" class="form-control" id="amenID" name="amenID" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="quantity">New Quantity</label>
                                                <input type="number" class="form-control" id="quantity" name="quantity" required>
                                            </div>

                                            <div class="form-group mt-4">
                                                <button type="submit" class="btn btn-primary" style="border-radius: 5px;">Update Amenity</button>
                                                <a href="listRoomAmenity" class="btn btn-secondary" style="border-radius: 5px;">Back to Room List</a>
                                            </div>
                                        </form>

                                        <% 
                                        String message = (String) request.getAttribute("message");
                                        if (message != null) { 
                                            boolean isError = message.toLowerCase().contains("error") || message.toLowerCase().contains("failed");
                                        %>
                                        <div class="<%= isError ? "message-error" : "message-success" %>">
                                            <%= message %>
                                        </div>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                    <div class="col-12">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Room Type ID</th>
                                        <th>Room Type Name</th>
                                        <th>Amenities</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="roomType" items="${roomTypes}">
                                        <tr>
                                            <td>${roomType.typeId}</td>
                                            <td>${roomType.typeName}</td>
                                            <td>
                                                <ul>
                                                    <!-- Kiểm tra xem có tiện nghi cho hạng phòng này không -->
                                                    <c:if test="${not empty amenitiesByRoomType[roomType.typeId]}">
                                                        <c:forEach var="amenity" items="${amenitiesByRoomType[roomType.typeId]}">
                                                            <li>
                                                                Amenity Name: ${amenityNames[amenity.amenID]}, <!-- Lấy tên tiện nghi từ amenityNames -->
                                                                Quantity: ${amenity.quantity}
                                                            </li>
                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${empty amenitiesByRoomType[roomType.typeId]}">
                                                        <li>No amenities found for this room type.</li>
                                                        </c:if>
                                                </ul>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    <footer class="footer">
                        <!-- Footer content here -->
                    </footer>
                </div>
            </div>
        </div>

        <!-- Core JS Files -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>

        <script>
            $(document).ready(function () {
                // Add input validation
                $('form').on('submit', function (e) {
                    const quantity = $('#quantity').val();
                    if (quantity <= 0) {
                        alert('Quantity must be greater than 0');
                        e.preventDefault();
                        return false;
                    }
                });
            });
        </script>
    </body>
</html>