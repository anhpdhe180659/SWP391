<%-- 
    Document   : listAmenityDetail
    Created on : Sep 25, 2024, 8:46:26 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>List Amenity Detail</title><!--  page only for manager  -->
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
                            <h3 class="fw-bold mb-3">Amenity Detail</h3>
                            <button class="btn btn-primary btn-round ms-auto" onclick="BackToList()">
                                <i class="fas fa-angle-left"></i>
                                Back to list
                            </button>
                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Add Amenity Detail </h4>
                                        <button
                                            class="btn btn-primary btn-round ms-auto"
                                            data-bs-toggle="modal"
                                            data-bs-target="#addUserModal"
                                            >
                                            <i class="fa fa-plus"></i>
                                            Add Amenity Detail
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Modal -->
                                    <div
                                        class="modal fade"
                                        id="addUserModal"
                                        tabindex="-1"
                                        role="dialog"
                                        aria-hidden="true"
                                        >
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header border-0">
                                                    <h5 class="modal-title">
                                                        <span class="fw-mediumbold"> New</span>
                                                        <span class="fw-light"> Amenity Detail </span>
                                                    </h5>
                                                </div>
                                                <form class="form-add">
                                                    <div class="modal-body">
                                                        <p class="small">
                                                            Create a new amenity detail, make sure you
                                                            fill them all
                                                        </p>

                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Room Number</label>
                                                                    <input
                                                                        min ="1"
                                                                        name="roomnumber"
                                                                        type="number"
                                                                        class="form-control"
                                                                        title="Must have a room in the hotel"
                                                                        required
                                                                        />
                                                                </div>
                                                                <div class="form-group form-group-default">
                                                                    <label>Quantity</label>
                                                                    <input
                                                                        min="1"
                                                                        max="2"
                                                                        name="quantity"
                                                                        type="number"
                                                                        class="form-control"
                                                                        title="Must be greater than to 0"
                                                                        required
                                                                        />
                                                                </div>
                                                                <input
                                                                    hidden=""
                                                                    name="amenId"
                                                                    value="${requestScope.amenId}"
                                                                    type="number"
                                                                    class="form-control"
                                                                    required
                                                                    />
                                                            </div>
                                                        </div>  


                                                    </div>



                                                    <div class="modal-footer border-0">
                                                        <button
                                                            type="button submit"
                                                            class="btn btn-primary">
                                                            Add
                                                        </button>
                                                        <a onclick="doClose()">
                                                            <button
                                                                type="button"
                                                                class="btn btn-danger"
                                                                data-dismiss="modal"
                                                                aria-label="Close"
                                                                >
                                                                Close
                                                            </button>
                                                        </a>
                                                    </div>
                                                    <script>
                                                        // Get the button and input fields
                                                        const btn = document.querySelector('button[type="button submit"]');
                                                        const quantity = document.querySelector('input[name="quantity"]');
                                                        const roomnumber = document.querySelector('input[name="roomnumber"]');

                                                        // Function to validate conditions
                                                        function validate() {
                                                            const quantityValid = quantity.value > 0 && quantity.value < 3;
                                                            const roomnumberValid = roomnumber.value > 0 && roomnumber.value < 1000;

                                                            if (quantityValid && roomnumberValid) {
                                                                btn.disabled = false; // Enable button if both conditions are met
                                                            } else {
                                                                btn.disabled = true; // Disable button if either condition is not met
                                                                if (!quantityValid) {
                                                                    alert("Quantity must be from 0 to less than 3");
                                                                }
                                                                if (!roomnumberValid) {
                                                                    alert("Room number must be between 1 and 999.");
                                                                }
                                                            }
                                                        }

                                                        // Attach onchange events to call validate function
                                                        quantity.onchange = validate;
                                                        roomnumber.onchange = validate;
                                                    </script>

                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <table id="add-user" class="display table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Room Number</th>
                                                    <th>Quantity</th>
                                                    <th style="display: none;">Amenity ID</th> 
                                                    <th style="width: 10%">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listAmenityDetail}" var="a">
                                                    <tr>
                                                        <td>${a.roomNumber}</td> 
                                                        <td>${a.quantity}</td>
                                                        <td style="display: none;">${a.amenID}</td> 
                                                        <td>
                                                            <div class="form-button-action">
                                                                <a href="editAmenityDetail?roomid=${a.roomNumber}&amenId=${a.amenID}">
                                                                    <button
                                                                        type="button"
                                                                        data-bs-toggle="tooltip"
                                                                        title=""
                                                                        class="btn btn-link btn-primary btn-lg"
                                                                        data-original-title="Edit Task">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                </a>
                                                                <button
                                                                    type="button"
                                                                    title=""
                                                                    class="btn btn-link btn-danger"
                                                                    data-original-title="Remove"
                                                                    onclick="doDelete(${a.roomNumber})">
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
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
                                                                        document.querySelector('.close').addEventListener('click', function () {
                                                                            $('#addUserModal').modal('hide');
                                                                        });</script>
<script>
    function doClose() {
        $('#addUserModal').modal('hide');
    }
</script>



<script>
    function validate() {
        var email = document.querySelector('input[name="roomnumber"]').value;
        var quantity = document.querySelector('input[name="quantity"]').value;
        var regex1 = /^[0-9]+$/;
        if (!regex1.test(email)) {
            alert("Please enter a valid room number");
            document.querySelector('input[name="roomnumber"]').focus();
            return false;
        }

        return true;
    }
</script>
<script>
    function doDelete(userid) {
        var option = confirm("Are you sure to remove this?");
        if (option === true) {
            window.location = "deleteAmenityDetail?roomid=" + userid;
        }
    }
</script>
<script>
    $(document).ready(function () {
        $("#basic-datatables").DataTable({});
        $("#multi-filter-select").DataTable({
            pageLength: 5,
            initComplete: function () {
                this.api()
                        .columns()
                        .every(function () {
                            var column = this;
                            var select = $(
                                    '<select class="form-select"><option value=""></option></select>'
                                    )
                                    .appendTo($(column.footer()).empty())
                                    .on("change", function () {
                                        var val = $.fn.dataTable.util.escapeRegex($(this).val());
                                        column
                                                .search(val ? "^" + val + "$" : "", true, false)
                                                .draw();
                                    });
                            column
                                    .data()
                                    .unique()
                                    .sort()
                                    .each(function (d, j) {
                                        select.append(
                                                '<option value="' + d + '">' + d + "</option>"
                                                );
                                    });
                        });
            },
        });
        // Add Row
        $("#add-user").DataTable({
            pageLength: 5,
        });
        var action =
                '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';
        $("#addUserButton").click(function () {
            $("#add-user")
                    .dataTable()
                    .fnAddData([
                        $("#addName").val(),
                        $("#addPosition").val(),
                        $("#addOffice").val(),
                        action,
                    ]);
            $("#addUserModal").modal("hide");
        });
    });</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    const currentUrl = window.location.href;
    $('.form-add').on('submit', function (e) {
        e.preventDefault();
        var form = $(this);
        var actionUrl = 'addAmenityDetail';
        console.log(form.serialize());
        $.ajax({
            type: 'POST',
            url: actionUrl,
            data: form.serialize(),
            success: function (response) {
                if (response.status === 'success') {
                    swal({
                        icon: 'success',
                        text: response.message || 'Add successfully'
                    }).then(() => {
                        window.location = currentUrl;
                    });
                } else {
                    swal({
                        icon: 'error',
                        text: response.message || 'Failed to add'
                    }).then(() => {
                        window.location = currentUrl;
                    });
                }
            },
            error: function (xhr, status, error) {
                swal({
                    icon: 'error',
                    text: 'Failed to add'
                }).then(() => {
                    window.location = currentUrl;
                });
            }
        })
    })

</script>
<script>
    function BackToList() {
        window.location = "listAmenity";
    }
</script>

</body>
</html>
