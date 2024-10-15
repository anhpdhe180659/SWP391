<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Add Room</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="img/logo/favicon.png" type="image/x-icon" />

        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {families: ["Public Sans:300,400,500,600,700"]},
                custom: {
                    families: ["Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"],
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
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <jsp:include page="sidebarManager.jsp" />
            <!-- End Sidebar -->
            <div class="main-panel">
                <div class="main-header">
                    <jsp:include page="navbar-header.jsp" />
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
                                        <h4 class="card-title">Add Room Type</h4>
                                        <button class="btn btn-primary btn-round ms-auto" onclick="BackToList()">
                                            <i class="fas fa-angle-left"></i> Back to list
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <form id="addForm" enctype="multipart/form-data">
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Type Name</label>
                                                                    <input name="typeName" type="text" class="form-control" required />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Capacity</label>
                                                                    <input name="capacity" type="number" class="form-control" required />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Price</label>
                                                                    <input type="number" name="price" class="form-control" />
                                                                </div>
                                                                <div class="form-group form-group-default">
                                                                    <label>Image</label>
                                                                    <input type="file" name="image" class="form-control image-input" required />
                                                                    <img height="300px" class="preview-img" style="display: none" src="#" alt="alt"/>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer border-0">
                                                                <button type="submit" class="btn btn-primary">ADD</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <!-- Loading spinner -->
                                                <div id="loadingSpinner" class="spinner-border" role="status" style="display: none;">
                                                    <span class="sr-only">Loading...</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Core JS Files -->
                <script src="assets/js/core/jquery-3.7.1.min.js"></script>
                <script src="assets/js/core/popper.min.js"></script>
                <script src="assets/js/core/bootstrap.min.js"></script>
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                                            function BackToList() {
                                                window.location = "listRoomType.jsp";
                                            }
                                            $('.image-input').on('change', function () {
                                                const input = document.querySelector('.image-input');
                                                const [file] = input.files;
                                                const img = document.querySelector('.preview-img');
                                                if (file) {
                                                    img.src = URL.createObjectURL(file);
                                                }
                                                img.style.display='block';
                                            });
                                            // Form submission via AJAX
                                            $('#addForm').on('submit', function (e) {
                                                e.preventDefault(); // Prevent default form submission

                                                const formData = new FormData(this); // FormData for file uploads
                                                $('#loadingSpinner').show(); // Show loading spinner

                                                $.ajax({
                                                    url: 'addRoomType', // Servlet URL
                                                    method: 'POST',
                                                    data: formData,
                                                    processData: false, // Important for file uploads
                                                    contentType: false, // Important for file uploads
                                                    success: function (response) {
                                                        $('#loadingSpinner').hide(); // Hide spinner on success
                                                        swal({icon: "success", text: "Add successful!"}).then(() => {
                                                            window.location = 'listRoomType';
                                                        });
                                                    },
                                                    error: function (xhr, status, error) {
                                                        $('#loadingSpinner').hide(); // Hide spinner on error
                                                        alert('Failed to add room type: ' + xhr.responseText);
                                                    }
                                                });
                                            });
                </script>
            </div>
        </div>
    </body>
</html>
