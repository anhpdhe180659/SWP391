<%-- 
    Document   : editItem
    Created on : Sep 23, 2024, 11:13:16 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Edit Consumable Item</title><!--  page only for manager  -->
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
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Manage Consumable Item</h3>
                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Edit Consumable Item</h4>
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
                                                <form action="editItem" method="POST">
                                                    <c:set value="${requestScope.item}" var="s"/>
                                                    <input name="itemid"
                                                                        value="${s.itemID}"
                                                                        class="form-control"
                                                                        required
                                                                        hidden
                                                                        />
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="form-group form-group-default">
                                                                    <label>Name</label>
                                                                    <input
                                                                        name="name"
                                                                        type="text"
                                                                        class="form-control"
                                                                        minlength="2"
                                                                        maxlength="50"
                                                                        value="${s.itemName}"
                                                                        pattern="^[a-zA-ZÀ-ÿ\s-]+$"
                                                                        title="The name should only contain letters, spaces, and hyphens, with 2 to 50 characters."
                                                                        required
                                                                        />
                                                                </div>
                                                                <div class="form-group form-group-default">
                                                                    <label>Price</label>
                                                                    <input
                                                                        name="price"
                                                                        type="number"
                                                                        min="0"
                                                                        max="50000000"
                                                                        value="${s.price}"
                                                                        class="form-control"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group form-group-default">
                                                                    <label>Quantity in one room</label>
                                                                    <input
                                                                        name="standardQuantity"
                                                                        type="number"
                                                                        min="0"
                                                                        max="10000"
                                                                        value="${s.standardQuantity}"
                                                                        class="form-control"
                                                                        required
                                                                        />
                                                                </div>
                                                                <div class="form-group form-group-default">
                                                                    <label>Stock Quantity</label>
                                                                    <input
                                                                        name="stockQuantity"
                                                                        type="number"
                                                                        min="0"
                                                                        max="10000"
                                                                        value="${s.stockQuantity}"
                                                                        class="form-control"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input
                                                        name="itemID"
                                                        value="${s.itemID}"
                                                        class="form-control"
                                                        required
                                                        hidden
                                                        />
                                                    <div class="modal-footer border-0">
                                                        <c:set value="${requestScope.noti}" var="noti"/>
                                                        <div style="margin-right: 25px; font-weight: bold;color: green">${noti}</div>
                                                        <button
                                                            type="submit"
                                                            class="btn btn-primary update">
                                                            Save
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
        function doClose() {
            $('#editUserModal').modal('hide');
        }
    </script>
    <script>
        function BackToList() {
            window.location = "listItem";
        }
    </script>
    <script>
        $(document).ready(function () {
            $('#myForm').on('submit', function (e) {
                e.preventDefault(); // Prevent the form from submitting the traditional way
                var formData = $(this).serialize(); // Serialize the form data
                $.ajax({
                    type: 'POST',
                    url: '/SWP391/addItem', // Your server endpoint
                    data: formData,
                    success: function (response) {
                        console.log(swal);
                        // Handle success, you can show a notification or update the UI
                        swal({
                            icon: "success",
                            text: 'Edit successful'
                        });
                    },
                    error: function (xhr, status, error) {
                        // Handle error
                        swal({
                            icon: "fail",
                            text: 'Edit fail'
                        });
                    }
                });
            });
        });
    </script>


</body>
</html>
