<%-- 
    Document   : editService
    Created on : Sep 23, 2024, 11:13:16 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Edit Service</title><!--  page only for manager  -->
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
                            <h3 class="fw-bold mb-3">Manage Service</h3>
                        </div>



                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Edit Service</h4>
                                        <button class="btn btn-primary btn-round ms-auto" onclick="BackToList()">
                                            <i class="fas fa-angle-left"></i>
                                            Back to list
                                        </button>

                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Modal -->

                                    <div>
                                        <c:if test="${not empty noti}">
                                            <div style="margin-right: 25px; font-weight: bold;color: green;">${noti}</div>
                                        </c:if>
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <form id="myForm" onsubmit="return validate()">
                                                    <c:set value="${requestScope.service}" var="s"/>
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <!-- Name Field: Only alphabets allowed, required and trimmed -->
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Name</label>
                                                                    <input
                                                                        name="name"
                                                                        type="text"
                                                                        class="form-control"
                                                                        value="${s.name}" 
                                                                        pattern="^[A-Za-zÀ-ỹ\s]+$"  
                                                                        title="Name can only contain letters and spaces."
                                                                        required
                                                                        />
                                                                </div>
                                                                <script>
                                                                    document.querySelector('form').addEventListener('submit', function (event) {
                                                                        const nameInput = document.querySelector('input[name="name"]');

                                                                        // Trim leading and trailing spaces
                                                                        nameInput.value = nameInput.value.trim();

                                                                        // Replace multiple spaces between words with a single space
                                                                        nameInput.value = nameInput.value.replace(/\s+/g, ' ');

                                                                        // Validate name (letters and single spaces between words)
                                                                        const namePattern = /^[A-Za-zÀ-ỹ]+(?:\s[A-Za-zÀ-ỹ]+)*$/;
                                                                        if (!namePattern.test(nameInput.value)) {
                                                                            alert("Name can only contain letters and single spaces between words.");
                                                                            event.preventDefault();
                                                                            return;
                                                                        }
                                                                    });


                                                                </script>
                                                            </div>

                                                            <!-- Price Field: Must be a positive number greater than 0 -->
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Price</label>
                                                                    <input
                                                                        name="price"
                                                                        type="number"
                                                                        class="form-control"
                                                                        value="${s.price}"  
                                                                        min="1"  
                                                                        step="0.01"  
                                                                        title="Price must be greater than 0."
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="text" name="serviceid"  value="${s.serviceID}" hidden="">
                                                    <div class="modal-footer border-0">
                                                        <c:set value="${requestScope.noti}" var="noti"/>
                                                        <div style="margin-right: 25px; font-weight: bold; color: ${noti == 'Save successful!' ? 'green' : 'red'};">
                                                            ${noti}
                                                        </div>
                                                        <button
                                                            type="reset"
                                                            class="btn btn-danger">
                                                            Reset
                                                        </button>&nbsp;
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
            window.location = "listService";
        }
    </script>
    <script>
        var currentUrl = window.location.href;
        $(document).ready(function () {
            $('#myForm').on('submit', function (e) {
                e.preventDefault(); // Prevent the form from submitting the traditional way
                var formData = $(this).serialize(); // Serialize the form data
                $.ajax({
                    type: 'POST',
                    url: '/SWP391/editService', // Your server endpoint
                    data: formData,
                    success: function (response) {
                        if (response.status === 'success') {
                            swal({
                                icon: 'success',
                                text: response.message || 'Update successfully'
                            }).then(() => {
                                window.location = currentUrl;
                            });
                        } else {
                            swal({
                                icon: 'error',
                                text: response.message || 'Failed to update'
                            }).then(() => {
                                window.location = currentUrl;
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        // Handle error
                        swal({
                            icon: "fail",
                            text: 'Update fail'
                        });
                    }
                });
            });
        });
    </script>


</body>
</html>
