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
        <title>Add Room</title><!--  page only for manager  -->
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
                            <h3 class="fw-bold mb-3">Manage Room</h3>
                        </div>



                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Add Room</h4>
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
                                                <form action="addRoom"  method="POST">
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Room Number</label>
                                                                    <input
                                                                        name="roomNumber"
                                                                        type="text"
                                                                        pattern="[0-9]{3,5}$"
                                                                        class="form-control input-roomnum"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Clean Status</label>                  
                                                                    <select name="cleanId" class="form-control">
                                                                        <option value="3">Cleaned</option>
                                                                        <option value="2">In progress</option>
                                                                        <option value="1">Not clean</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Type Room</label>                  
                                                                    <td>
                                                                        <select name="typeId" class="form-control">
                                                                            <option value="1">Single Room</option>
                                                                            <option value="2">Double Room</option>
                                                                            <option value="3">Family Room</option>
                                                                            <option value="4">Deluxe Room</option>
                                                                            <option value="5">President Room</option>
                                                                        </select>
                                                                    </td>
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
                                                                    <select name="statusId" class="form-control">
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
                                                            <div class="modal-footer border-0">
                                                                <c:set value="${requestScope.noti}" var="noti"/>
                                                                <p class="text text-success me-4"> ${noti}</p>
                                                                <button
                                                                    type="submit"
                                                                    class="btn btn-primary">
                                                                    ADD
                                                                </button>
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
                function BackToList() {
                    window.location = "listRoomAdmin";
                }
            </script>
            <script>
                var capacity = document.querySelector('.capacity');
                var price = document.querySelector('.price');
                var type = document.querySelector('select[name="typeId"]'); // Reference the room type select element
                switch (type.value) {
                    case '1': // Single Room
                        capacity.value = 1;
                        price.value = 500000;
                        break;
                    case '2': // Double Room
                        capacity.value = 2;
                        price.value = 800000;
                        break;
                    case '3': // Family Room
                        capacity.value = 4;
                        price.value = 1500000;
                        break;
                    case '4': // Deluxe Room
                        capacity.value = 2;
                        price.value = 2000000;
                        break;
                    case '5': // President Room
                        capacity.value = 2;
                        price.value = 5000000;
                        break;
                }
                type.addEventListener('change', function () {
                    switch (this.value) {
                        case '1': // Single Room
                            capacity.value = 1;
                            price.value = 500000;
                            break;
                        case '2': // Double Room
                            capacity.value = 2;
                            price.value = 800000;
                            break;
                        case '3': // Family Room
                            capacity.value = 4;
                            price.value = 1500000;
                            break;
                        case '4': // Deluxe Room
                            capacity.value = 2;
                            price.value = 2000000;
                            break;
                        case '5': // President Room
                            capacity.value = 2;
                            price.value = 5000000;
                            break;
                    }
                });

                console.log(price);
                console.log(capacity);
            </script>

    </body>
</html>


