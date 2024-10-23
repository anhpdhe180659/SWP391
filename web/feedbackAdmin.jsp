<%-- 
    Document   : dashboard
    Created on : Sep 21, 2024, 7:57:19 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Dashboard for receptionist</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <link
            rel="icon"
            href="img/logo/logo.png"
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
        <link rel="stylesheet" href="CSS/listRoom.css"/>
        <style>
            .feedback-item {
                background-color: #fafafa;
                padding: 10px;
                border-bottom: 1px solid #ddd;
                margin-bottom: 10px;
            }
            .feedback-item p {
                margin: 0;
            }
            .feedback-item .author {
                font-weight: bold;
            }
            .rating {
                display: inline-block;
                direction: rtl;
                unicode-bidi: bidi-override;
            }
            .rating input {
                display: none;
            }
            .rating label {
                font-size: 20px;
                color: #ddd;
                padding: 0 5px;
                cursor: pointer;
            }
            .rating input:checked ~ label,
            .rating label:hover,
            .rating label:hover ~ label {
                color: #f5b301;
            }  
            
        </style>
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <!--<link rel="stylesheet" href="assets/css/demo.css" />-->
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

                <!-- Phần hiển thị feedback đã có -->
                <div class="container">
                    <h2>Customer Feedback</h2>
                    <div class="feedback-list">
                        <c:forEach items="${requestScope.listFeedback}" var="fb">
                            <!-- Feedback Item with jQuery AJAX -->
                            <div class="feedback-item">
                                <p class="author">${fb.name}</p>
                                <p>${fb.feedback}</p>
                                <p>Rating: ${'⭐'.repeat(fb.rating)}${'☆'.repeat(5 - fb.rating)}</p> 

                                <!-- The checkbox with data attributes to hold feedback ID and current status -->
                                <div class="form-check form-switch">
                                    <input class="form-check-input feedback-status-toggle" type="checkbox" 
                                           data-feedback-id="${fb.feedbackid}"
                                           ${fb.feedbackStatus == 1 ? 'checked' : ''}>
                                    <label class="form-check-label">
                                        ${fb.feedbackStatus == 1 ? "Hide" : "View"}
                                    </label>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>  

                <!--        <div id="editPopup" class="popup">
                            <div class="popup-content">
                                <span class="close-btn">&times;</span>
                                <h2>Edit Feedback</h2>
                                <form id="editForm" action="editFeedback" method="post">
                                    <input type="hidden" id="editGuestID" name="guestID">  hidden input for guestID 
                                    <div class="form-group">
                                        <label for="editName">Your Name:</label>
                                        <input type="text" id="editName" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="editFeedback">Your Feedback:</label>
                                        <textarea id="editFeedback" name="feedback" rows="5" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Your Rating:</label>
                                        <div class="rating">
                                            <input type="radio" id="editStar5" name="rating" value="5"><label for="editStar5">★</label>
                                            <input type="radio" id="editStar4" name="rating" value="4"><label for="editStar4">★</label>
                                            <input type="radio" id="editStar3" name="rating" value="3"><label for="editStar3">★</label>
                                            <input type="radio" id="editStar2" name="rating" value="2"><label for="editStar2">★</label>
                                            <input type="radio" id="editStar1" name="rating" value="1"><label for="editStar1">★</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit">Update Feedback</button>
                                    </div>
                                </form>
                            </div>
                        </div>-->



                <!-- Thêm SweetAlert từ CDN -->
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

                <script>
            $(document).ready(function () {
                // Handle change event on the checkbox
                $(".feedback-status-toggle").change(function () {
                    var feedbackId = $(this).data("feedback-id"); // Get feedback ID
                    var newStatus = $(this).is(":checked") ? 1 : 0; // Get new status based on checkbox state

                    // Send AJAX request to update feedback status
                    $.ajax({
                        url: 'ToggleFeedbackStatusServlet', // The servlet URL
                        type: 'POST',
                        data: {
                            feedbackID: feedbackId,
                            status: newStatus
                        },
                        success: function (response) {
                            // Update the label text based on the new status
                            if (newStatus === 1) {
                                $(this).next("label").text("Hide");
                            } else {
                                $(this).next("label").text("View");
                            }

                            // Display success message (optional)
                            alert("Feedback status updated successfully.");
                        }.bind(this), // Bind 'this' to maintain context
                        error: function (xhr, status, error) {
                            // Handle error case
                            alert("Failed to update feedback status.");
                        }
                    });
                });
            });
                </script>

            </div>
        </div>

        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

        <!-- Chart JS -->
        <script src="assets/js/plugin/chart.js/chart.min.js"></script>

        <!-- jQuery Sparkline -->
        <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

        <!-- Chart Circle -->
        <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>

        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>

        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo.js"></script>
        <script src="assets/js/demo.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            $(document).ready(function () {
                // Handle change event on the checkbox
                $(".feedback-status-toggle").change(function () {
                    var feedbackId = $(this).data("feedback-id"); // Get feedback ID
                    var newStatus = $(this).is(":checked") ? 1 : 0; // Get new status based on checkbox state

                    // Send AJAX request to update feedback status
                    $.ajax({
                        url: 'ToggleFeedbackStatusServlet', // The servlet URL
                        type: 'POST',
                        data: {
                            feedbackID: feedbackId,
                            status: newStatus
                        },
                        success: function (response) {
                            // Update the label text based on the new status
                            if (newStatus === 1) {
                                $(this).next("label").text("Hide");
                            } else {
                                $(this).next("label").text("View");
                            }

                        }, // Bind 'this' to maintain context
                        error: function (xhr, status, error) {
                            // Handle error case
                            alert("Failed to update feedback status.");
                        }
                    });
                });
            });
        </script>

    </body>
</html>

