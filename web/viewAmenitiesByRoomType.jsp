<%-- 
    Document   : viewAmenitiesByRoomType
    Created on : Nov 6, 2024, 4:04:19 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, model.AmenityDetail, model.RoomType" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Amenities by Room Type</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>

        <div class="container mt-5">
            <h2>Amenities for Each Room Type</h2>

            <div class="row">
                <!-- Hiển thị danh sách các hạng phòng -->
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
                                                        ${amenityNames[amenity.amenID]}-
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
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
