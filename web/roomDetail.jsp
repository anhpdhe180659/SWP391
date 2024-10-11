<%-- 
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
        <title>Edit user</title><!--  page only for manager  -->
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <link
            rel="icon"
            href="assets/img/kaiadmin/favicon.ico"
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
                   <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Room Detail</h3>
                        </div>



                        <div class="col-md-12">
                            <c:set value="${sessionScope.detailRoom}" var="u"/>
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Room ${u.roomNumber}</h4>
                                        <button class="btn btn-primary btn-round ms-auto" onclick="BackToList()">
                                            <i class="fas fa-angle-left"></i>
                                            Back to list
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Modal -->

                                    <div>
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <form action="updateRoomStatus"  method="POST">
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Room Number</label>
                                                                    <input
                                                                        name="roomNumber"
                                                                        type="text"
                                                                        class="form-control"
                                                                        value="${u.roomNumber}"
                                                                        readonly
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Clean Status</label>                  
                                                                    <select name="cleanId" class="form-control" readonly>
                                                                        <option value="3"
                                                                                <c:if test="${u.cleanId == 3}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Cleaned</option>
                                                                        <option value="2"
                                                                                <c:if test="${u.cleanId == 2}">
                                                                                    selected
                                                                                </c:if>
                                                                                >In progress</option>
                                                                        <option value="1"
                                                                                <c:if test="${u.cleanId == 1}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Not clean</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Type Room</label>                  
                                                                    <c:if test="${u.typeId == 5}">
                                                                        <input
                                                                            name="typeId"
                                                                            type="text"
                                                                            class="form-control room-type"
                                                                            value="President"
                                                                            readonly
                                                                            />
                                                                    </c:if>
                                                                    <c:if test="${u.typeId == 4}">
                                                                        <input
                                                                            name="typeId"
                                                                            type="text"
                                                                            class="form-control room-type"
                                                                            value="Deluxe Room"
                                                                            readonly
                                                                            />
                                                                    </c:if>
                                                                    <c:if test="${u.typeId == 3}">
                                                                        <input
                                                                            name="typeId"
                                                                            type="text"
                                                                            class="form-control room-type"
                                                                            value="Family Room"
                                                                            readonly
                                                                            />
                                                                    </c:if>
                                                                    <c:if test="${u.typeId == 2}">
                                                                        <input
                                                                            name="typeId"
                                                                            type="text"
                                                                            class="form-control room-type"
                                                                            value="Double Room"
                                                                            readonly
                                                                            />
                                                                    </c:if>
                                                                    <c:if test="${u.typeId == 1}">
                                                                        <input
                                                                            name="typeId"
                                                                            type="text"
                                                                            class="form-control room-type"
                                                                            value="Single Room"
                                                                            readonly
                                                                            />
                                                                    </c:if>
                                                                </div>
                                                                <div class="form-group form-group-default">
                                                                    <label>Capacity</label>
                                                                    <input
                                                                        type="text"
                                                                        class="form-control capacity"
                                                                        readonly
                                                                        />
                                                                </div>
                                                                <div class="form-group form-group-default">
                                                                    <label>Price</label>
                                                                    <input
                                                                        type="text"
                                                                        class="form-control price"
                                                                        readonly
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Status</label>                  
                                                                    <select name="statusId" class="form-control" readonly> 
                                                                        <option class="text-warning" value="3"
                                                                                <c:if test="${u.statusId == 3}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Under Maintainance</option>
                                                                        <option class="text-danger" value="2"
                                                                                <c:if test="${u.statusId == 2}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Occupied</option>
                                                                        <option class="text-success" value="1"
                                                                                <c:if test="${u.statusId == 1}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Available</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="text" name="roomId" value="${u.roomId}" hidden="">
                                                    <div class="modal-footer border-0">
                                                        <c:set value="${requestScope.noti}" var="noti"/>
                                                        <c:if test="${noti == 'Update status successful !'}" >
                                                            <div style="margin-right: 25px; font-weight: bold;color: green">${noti}</div>
                                                        </c:if>
                                                        <c:if test="${noti != 'Update status successful !'}" >
                                                            <div style="margin-right: 25px; font-weight: bold;color: darkorange">${noti}</div>
                                                        </c:if>
                                                    </div>
                                                </form>
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
    <script>
                                            document.querySelector('.close').editEventListener('click', function () {
                                                $('#editUserModal').modal('hide');
                                            });

    </script>
    <script>
        var capacity = document.querySelector('.capacity');
        var price = document.querySelector('.price');
        var type = document.querySelector('.room-type');
        console.log(price);
        console.log(capacity);
        switch (type.value) {
            case 'Single Room' :
                capacity.value = 1;
                price.value = 500000;
                break;
            case 'Double Room' :
                capacity.value = 2;
                price.value = 800000;
                break;
            case 'Family Room' :
                capacity.value = 4;
                price.value = 1500000;
                break;
            case 'Deluxe Room' :
                capacity.value = 2;
                price.value = 2000000;
                break;
            case 'President' :
                capacity.value = 2;
                price.value = 5000000;
                break;
        }
    </script>
    <script>
        function doClose() {
            $('#editUserModal').modal('hide');
        }
    </script>
    <script>
        function BackToList() {
            window.location = "listRoom";
        }
    </script>

</body>
</html>


