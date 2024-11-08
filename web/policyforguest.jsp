<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="dal.PolicyDAO" %>
<%@ page import="model.policy" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chính Sách Đặt Phòng - Khách Sạn Tri Lễ</title>
        <link rel="icon" href="img/logo/favicon.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Fonts and icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Open+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="CSS/footer.css">
        <style>
            body {
                font-family: 'Open Sans', sans-serif;
                background-color: #f9f9f9;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
            }

            html{
                scroll-behavior: smooth;
            }
            .wrapper{
                height: fit-content;
            }

            .header-container{
                width: 100%;
                z-index: 1001;
                position: fixed;
                top:0;
                background-color: #fff;
            }
            /* Style for header when scrolling */
            .header-container.scrolled {
                background-color: transparent; /* Makes the header transparent */
                opacity: 0.8; /* Fades the header */
            }

            /* Style for elements inside the navbar to disappear when scrolling */
            .header-container.scrolled .container-fluid .navbar-link,
            .header-container.scrolled .container-fluid .login-area {
                display: none; /* Hides the search bar and login area */
            }

            /* Center the logo when scrolling */
            .header-container.scrolled .logo {
                margin: 0 auto; /* Center the logo */
            }

            .logo img {
                transition: all 0.5s ease;
            }
            .navbar .container-fluid .logo{
                display: flex;
                justify-content: center;
            }
            .navbar .container-fluid .logo img{
                margin: -15px 80px;
            }
            .navbar .container-fluid .navbar-link{
                display: flex;
                justify-content: center;
            }
            .navbar .container-fluid .navbar-link a{
                text-transform: uppercase;
                font-size: 20px;
                color: black;
            }
            .navbar .container-fluid .search-bar input{
                width: 60%;
            }
            .navbar .container-fluid .login-area{
                display: flex;
                justify-content: center;
            }
            .body-container{
                margin-top: 150px;
            }
            .policy-container {
                padding: 30px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.08);
                margin-bottom: 30px;
            }

            .policy-container h2 {
                color: #001b40;
                margin-bottom: 20px;
                font-weight: 600;
                border-bottom: 2px solid #007bff;
                padding-bottom: 10px;
            }

            .policy-container ul {
                padding-left: 20px;
            }

            .policy-container li {
                margin-bottom: 15px;
                position: relative;
                padding-left: 10px;
            }


            .myfooter{
                margin-top: 30px;
                width: 100%;
            }

        </style>
    </head>
    <body>


        <!-- Header -->
        <div class="wrapper">
            <div class="header-container">
                <nav class="navbar">
                    <div class="container-fluid row">
                        <div class="logo col-md-2 col-sm-12">
                            <a href="guestHomePage.jsp">
                                <img src="img/logo/logo.png" alt="logo" width="120" >
                            </a>
                        </div>
                        <div class="navbar-link col-md-2 col-sm-12">
                            <a href="guestHomePage.jsp#about">About Us</a>
                        </div>
                        <div class="navbar-link col-md-2 col-sm-12">
                            <a href="guestHomePage.jsp#contact">For Booking</a>
                        </div>  
                        <div class="navbar-link col-md-2 col-sm-12">
                            <a href="policyforguest.jsp">Policies</a>
                        </div> 
                        <div class="navbar-link col-md-2 col-sm-12">
                            <a href="feedback.jsp">FeedBack</a>
                        </div>
                        <div class="login-area col-md-2 col-sm-12">
                            <a href="login.jsp" role="button" class="btn btn-outline-primary">Login</a>
                        </div>
                    </div>
                </nav>
            </div>

            <!-- Policy Section -->
            <div class="body-container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">
                        <%
                            PolicyDAO policyDAO = new PolicyDAO();
                            List<policy> policies = policyDAO.getAllPolicies();
                            
                        %>
                        <div id="policyCarousel" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <% for (int i = 0; i < policies.size(); i++) { 
                                    policy p = policies.get(i);
                                %>
                                <div class="carousel-item <%= (i == 0) ? "active" : "" %>">
                                    <div class="policy-container">
                                        <h2><i class="fas fa-book-open"></i> <%= p.getPolicyTitle() %></h2>
                                        <p><%= p.getPolicyContext() %></p>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                        </div>



                        <!-- Contact Info (Static section) -->

                    </div>
                </div>
            </div>
            <div class="myfooter">
                <footer class="footer-14398">

                    <div class="container">
                        <div class="row mb-5">
                            <div class="col-md-3">
                                <a href="#" class="footer-site-logo">AliHotel</a>
                                <p>Welcome to AliHotel Management System, a comprehensive platform designed to streamline hotel operations.</p>
                            </div>
                            <div class="col-md-2 ml-auto">
                                <h3>Hotel</h3>
                                <ul class="list-unstyled links">
                                    <li><a href="#">Room manage</a></li>
                                    <li><a href="#">Features</a></li>
                                    <li><a href="#">Examples</a></li>
                                    <li><a href="#">Website editors</a></li>
                                    <li><a href="#">Online retail</a></li>
                                </ul>
                            </div>
                            <div class="col-md-2 ml-auto">
                                <h3>Press</h3>
                                <ul class="list-unstyled links">
                                    <li><a href="#">Events</a></li>
                                    <li><a href="#">News</a></li>
                                    <li><a href="#">Awards</a></li>
                                    <li><a href="#">Testimonials</a></li>
                                    <li><a href="#">Online retail</a></li>
                                </ul>
                            </div>
                            <div class="col-md-2 ml-auto">
                                <h3>About</h3>
                                <ul class="list-unstyled links">
                                    <li><a href="#">Contact</a></li>
                                    <li><a href="#">Services</a></li>
                                    <li><a href="#">Team</a></li>
                                    <li><a href="#">Career</a></li>
                                    <li><a href="#">Contacts</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="row mb-4">
                            <div class="col-12 pb-4">
                                <div class="line"></div>
                            </div>
                            <div class="col-md-6 text-md-left">
                                <ul class="list-unstyled link-menu nav-left">
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Terms &amp; Conditions</a></li>
                                    <li><a href="#">Code of Conduct</a></li>
                                </ul>
                            </div>
                            <div class="col-md-6 text-md-right">
                                <ul class="list-unstyled social nav-right">
                                    <li><a href="#"><span class="icon-twitter"></span></a></li>
                                    <li><a href="#"><span class="icon-instagram"></span></a></li>
                                    <li><a href="#"><span class="icon-facebook"></span></a></li>
                                    <li><a href="#"><span class="icon-pinterest"></span></a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-7">
                                <p><small></small></p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    </body>
</html>