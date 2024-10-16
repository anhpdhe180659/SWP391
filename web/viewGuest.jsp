<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>View Guest Details</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="img/logo/favicon.png" type="image/x-icon" />
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
                <!--#b6e8f3-->
                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Guest Details</h3>
                        </div>

                        <div class="col-md-12">
                            <div class="card" style="border-radius: 10px;">
                                <div class="card-header text-white" style="border-top-left-radius: 10px; border-top-right-radius: 10px; background-color: #b6e8f3">
                                    <h4 class="card-title">Guest Information</h4>
                                </div>
                                <div class="card-body">
                                    <c:if test="${not empty guest}">
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td><strong>Guest ID:</strong></td>
                                                    <td>${guest.guestID}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Name:</strong></td>
                                                    <td>${guest.name}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Date of Birth:</strong></td>
                                                    <td>${guest.dateOfBirth}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Gender:</strong></td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${guest.sex == 1}">Male</c:when>
                                                            <c:otherwise>Female</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Phone:</strong></td>
                                                    <td>${guest.phone}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Address:</strong></td>
                                                    <td>${guest.address}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Identification:</strong></td>
                                                    <td>${guest.identification}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Nationality:</strong></td>
                                                    <td>${guest.nationality}</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Is Hidden:</strong></td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${guest.isHidden == 0}">No</c:when>
                                                            <c:otherwise>Yes</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="form-group mt-4">
                                            <a href="listGuest" class="btn btn-secondary" style="border-radius: 5px;">Back to Guest List</a>
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
                </body>
                </html>
