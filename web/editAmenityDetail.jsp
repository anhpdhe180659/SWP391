<%-- 
    Document   : editAmenity
    Created on : Sep 24, 2024, 10:29:09 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.AmenityDetail" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Edit Amenity</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="img/logo/favicon.png" type="image/x-icon" />
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

        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
    </head>
    <body>
        <div class="wrapper">
            <jsp:include page="sidebarManager.jsp"/>
            <div class="main-panel">
                <div class="main-header">
                    <div class="main-header-logo">
                        <div class="logo-header" data-background-color="dark">
                            <a href="../index.jsp" class="logo">
                                <img src="assets/img/kaiadmin/logo_light.svg" alt="navbar brand" class="navbar-brand" height="20" />
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
                    </div>
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Manage Amenity Detail</h3>
                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Edit Quantity</h4>
                                        <button class="btn btn-primary btn-round ms-auto" onclick="BackToList()">
                                            <i class="fas fa-angle-left"></i>
                                            Back to list
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <form action="editAmenityDetail" method="POST">
                                                    <% 
                                                        AmenityDetail detail = (AmenityDetail) request.getAttribute("amenityDetail");
                                                        if (detail != null) {
                                                    %>
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-default">
                                                                    <label>Quantity</label>
                                                                    <input
                                                                        name="quantity"
                                                                        type="number"
                                                                        class="form-control"
                                                                        value="<%=  detail.getQuantity() %>"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="text" name="amenid" value="<%= detail.getAmenID() %>" hidden="">
                                                    <input type="text" name="roomid" value="<%= detail.getRoomID() %>" hidden="">
                                                    <script>
                                                        function BackToList() {
                                                            window.location = "amenity-detail?amenityId=<%= detail.getAmenID() %>";
                                                        }
                                                    </script>
                                                    <% 
                                                        } 
                                                    %>
                                                    <div class="modal-footer border-0">
                                                        <% 
    String noti = (String) request.getAttribute("noti");
    String notiColor = (String) request.getAttribute("notiColor");
                                                        %>
                                                        <div style="margin-right: 25px; font-weight: bold; color: <%= notiColor != null ? notiColor : "red" %>;">
                                                            <%= noti != null ? noti : "" %>
                                                        </div>

                                                        <button type="reset" class="btn btn-danger">
                                                            Reset
                                                        </button>&nbsp;
                                                        <button type="submit" class="btn btn-primary">
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

                <footer class="footer"></footer>
            </div>

            <script src="assets/js/core/jquery-3.7.1.min.js"></script>
            <script src="assets/js/core/popper.min.js"></script>
            <script src="assets/js/core/bootstrap.min.js"></script>
            <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
            <script src="assets/js/plugin/datatables/datatables.min.js"></script>
            <script src="assets/js/kaiadmin.min.js"></script>
            <script src="assets/js/setting-demo2.js"></script>
            <script>
                                                        document.querySelector('form').addEventListener('submit', function (event) {
                                                            const quantity = document.querySelector('input[name="quantity"]').value;

                                                            // Check if quantity is a number greater than 0 and less than 3
                                                            if (quantity <= 0 || quantity >= 3) {
                                                                alert("Quantity must be greater than 0 and less than 3.");
                                                            }
                                                        });


            </script>




        </div>
    </body>
</html>
