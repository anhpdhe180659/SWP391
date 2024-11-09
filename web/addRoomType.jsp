
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page  import="java.util.List"%>
<%@page  import="model.RoomType"%>
<%@ page import="com.google.gson.Gson" %>
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
                                                                <span class="error" style="display: none; color: red">Duplicate</span>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Capacity</label>
                                                                    <input name="capacity" type="number" min="1" max="20" class="form-control" required />
                                                                </div>
                                                                <span class="capacityError" style="display: none; color: red"></span>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Price</label>
                                                                    <input type="number" min="1000" max="99999999" name="price" class="form-control" required=""/>
                                                                </div>
                                                                <span class="priceError" style="display: none; color: red"></span>
                                                                <div class="form-group form-group-default">
                                                                    <label>Image</label>
                                                                    <input type="file" name="image" class="form-control image-input" accept=".jpg, .jpeg, .png" required />
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
                <%
      // Retrieve the list of ChartRoom objects from the session
      List<RoomType> listRoomType = (List<RoomType>) session.getAttribute("listRoomType");

      // Convert the list to JSON format for JavaScript
      String roomTypeJson = new Gson().toJson(listRoomType);
                %>
                <script>
                                            var roomType = <%= roomTypeJson %>;

                                            // Extract the labels (room types) and data (booking times)
                                            const labels_type = roomType.map(room => room.typeName);
                                            console.log(labels_type);
                                            const error = document.querySelector('.error');
                                            const typeName = document.querySelector('input[name="typeName"]');
                                            const button = document.querySelector('button[type="submit"]');
                                            typeName.onchange = function () {
                                                const value = typeName.value;
                                                console.log(value);
                                                if (labels_type.includes(value)) {
                                                    button.disabled = true;
                                                    error.style.display = 'block';
                                                } else {
                                                    button.disabled = false;
                                                    error.style.display = 'none';
                                                }
                                            }
                </script>
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
                        img.style.display = 'block';
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
                <script>
                    const keyword = document.querySelector('input[type="number"]');
                    console.log(keyword);
                    const errorMessage = document.getElementById("error-message");
                    keyword.addEventListener("keypress", function (event) {
                        if (event.key === "e" || event.key === "E") {
                            event.preventDefault();
                        }
                    });

                    const capacity = document.querySelector('input[name="capacity"]');
                    console.log(capacity);
                    capacity.onchange = function () {
                        const value = capacity.value;
                        var re = new RegExp("^([0-9]{0,2})$");
                        console.log(re);
                        if (!re.test(value)) {
                            const error = document.querySelector('.capacityError');
                            error.textContent = "Please input number with 1-2 digits";
                            error.style.display = 'block';
                            button.disabled = true;
                        } else {
                            const error = document.querySelector('.capacityError');
                            error.style.display = 'none'; // Hide error if input is valid
                            button.disabled = false;
                        }
                    }
                    const roomNum = document.querySelector('input[name="price"]');
                    console.log(roomNum);
                    roomNum.onchange = function () {
                        const value = roomNum.value;
                        var re = new RegExp("^([0-9]{0,9})$");
                        console.log(re);
                        if (!re.test(value)) {
                            const error = document.querySelector('.priceError');
                            error.textContent = "Please input number with 5-9 digits";
                            error.style.display = 'block';
                            button.disabled = true;
                        } else {
                            const error = document.querySelector('.priceError');
                            error.style.display = 'none'; // Hide error if input is valid
                            button.disabled = false;
                        }
                    }
                </script>
            </div>
        </div>
    </body>
</html>
