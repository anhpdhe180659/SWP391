<<%-- 
    Document   : editUser
    Created on : Sep 22, 2024, 1:29:17 PM
    Author     : nhatk
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Booking History</title><!--  page only for manager  -->
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
        <style>  
/* General Reset */

/* Container */
.container {
    width: 90%;
    max-width: 1000px;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

/* Title */
h1 {
    text-align: center;
    font-size: 24px;
    color: #333;
    margin-bottom: 20px;
}

/* Table Controls */
.table-controls {
    display: flex;
    justify-content: space-between;
    margin-bottom: 15px;
}

.add-service {
    padding: 8px 12px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
}

.add-service:hover {
    background-color: #0056b3;
}

.search-box {
    padding: 8px;
    width: 200px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

/* Table Styling */
.booking-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
}

.booking-table thead th {
    background-color: #f0f2f5;
    font-weight: bold;
    color: #555;
    text-align: left;
    padding: 12px 10px;
    font-size: 14px;
}

.booking-table tbody tr {
    transition: background-color 0.2s ease;
}

.booking-table tbody tr:hover {
    background-color: #f9f9ff;
}

.booking-table tbody td {
    padding: 12px 10px;
    border-top: 1px solid #eee;
    font-size: 14px;
}

.booking-table tr:nth-child(even) {
    background-color: #fafafa;
}

/* Action Buttons */
.action-buttons i {
    font-size: 16px;
    margin-right: 8px;
    cursor: pointer;
    transition: color 0.2s ease;
}

.action-buttons i.fa-edit {
    color: #007bff;
}

.action-buttons i.fa-trash-alt {
    color: #dc3545;
}

.action-buttons i:hover {
    color: #333;
}

/* Pagination */
.pagination {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-top: 15px;
}

.pagination button, .pagination span {
    padding: 5px 12px;
    margin: 0 3px;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    border: 1px solid #007bff;
    color: #007bff;
    background-color: #fff;
    transition: all 0.2s ease;
}

.pagination button:hover {
    background-color: #007bff;
    color: #fff;
}

.pagination .prev, .pagination .next {
    font-weight: bold;
}

.pagination span {
    font-weight: bold;
    cursor: default;
    border: none;
}


            </style>

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
            <jsp:include page="sidebarManager.jsp"/>
            <!-- End Sidebar -->
            <div class="main-panel">
                <div class="main-header">
                    <div class="main-header-logo">
                        <!-- Logo Header -->
                        <div class="logo-header" data-background-color="dark">
                            <a href="../index.jsp" class="logo">
                                <img
                                    src="assets/img/kaiadmin/logo_light.svg"
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
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Booking History</h3>
                        </div>



                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Booking History</h4>
                                        
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Modal -->

                                   <table class="booking-table">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Room ID</th>
                    <th>Room Number</th> 
                    <th>CheckInDate</th>  
                     <th>CheckOutDate</th> 
                    <th>Action</th>
                </tr>
            </thead>
             <c:forEach var="history" items="${bookingHistories}">
            <tr>
                <td>${history.historyID}</td>
                <td>${history.roomID}</td>
                <td>${history.bookingID}</td> 
                <td>${history.bookingID}</td>
                <td>${history.bookingID}</td>
                    <td class="action-buttons">
                        
                        <i class="fas fa-trash-alt"></i>
                    </td>
            </tr>
        </c:forEach>
               
            </tbody>
        </table>
        <div class="pagination">
            <button class="prev">Previous</button>
            <span>1</span>
            <span>2</span>
            <button class="next">Next</button>
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

                    <footer class="footer">

                    </footer>
                </div>

                <!-- Custom template | don't include it in your project! -->

                <!-- End Custom template -->
            </div>
            <!--   Core JS Files   -->
            <script src="assets/js/core/jquery-3.7.1.min.js"></script>
            <script src="assets/js/core/popper.min.js"></script>
            <script src="assets/js/core/bootstrap.min.js"></script>

            <!-- jQuery Scrollbar -->
            <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
            <!-- Datatables -->
            <script src="assets/js/plugin/datatables/datatables.min.js"></script>
            <!-- Kaiadmin JS -->
            <script src="assets/js/kaiadmin.min.js"></script>
            <!-- Kaiadmin DEMO methods, don't include it in your project! -->
            <script src="assets/js/setting-demo2.js"></script>

            

            

          
    </body>
</html>


