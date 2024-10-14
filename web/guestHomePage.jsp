<%-- 
    Document   : guestHomePage
    Created on : Sep 22, 2024, 8:01:02 PM
    Author     : phand
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>AliHotel</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <link
            rel="icon"
            href="img/logo/favicon.png"
            type="image/x-icon"
            />
        <link rel="stylesheet" href="CSS/footer.css">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <script defer src="JS/guestHomePage.js"></script>

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
        <link rel="stylesheet" href="CSS/guestHomePage.css"
              <!-- CSS Just for demo purpose, don't include it in your project -->
        <!--<link rel="stylesheet" href="assets/css/demo.css" />-->
    </head>
    <body>
        <div class="wrapper">
            <div class="header-container">
                <nav class="navbar">
                    <div class="container-fluid row">
                        <div class="logo col-md-2 col-sm-12">
                            <a href="#">
                                <img src="img/logo/logo.png" alt="logo" width="120" >
                            </a>
                        </div>
                        <div class="navbar-link col-md-2 col-sm-12">
                            <a href="#about">About Us</a>
                        </div>
                        <div class="navbar-link col-md-2 col-sm-12">
                            <a href="#contact">For Booking</a>
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
            <div class="body-container">
                <section class="hidden">
                    <div class="image-banner">
                        <img src="img/hotel/banner.svg" alt="image-hotel">
                    </div>
                </section>
                <section  id="about" class="hidden">
                    <div class="image-hotel row">
                        <div class="description col-3 hidden">
                            <div class="intro">
                                <p>Perfect</p>
                            </div>
                            <div class="image-intro">
                                <img src="img/hotel/How To Stay In A Decent Cheap Hotel In Tokyo (Review) - The Real Japan.jpg">
                                <div class="overlay-text"><p>Feel comfortable like your home</p></div>   
                            </div>
                        </div>
                        <div class="description col-3 hidden">
                            <div class="intro">
                                <p>Elegance</p>
                            </div>
                            <div class="image-intro">
                                <img src="img/hotel/PS HOUSE _ Jacobsen Arquitetura.jpg">
                                <div class="overlay-text"><p>Feel comfortable like your home</p></div>  
                            </div>
                        </div>
                        <div class="description col-3 hidden">
                            <div class="intro">
                                <p>Luxury</p>
                            </div>
                            <div class="image-intro">
                                <img src="img/hotel/Perfect Color Palettes for a Japandi Bedroom.jpg">
                                <div class="overlay-text"><p>Luxury room make you more luxurier</p></div>  
                            </div>
                        </div>
                        <div class="description col-3 hidden">
                            <div class="intro">
                                <p>Comfortable</p>
                            </div>
                            <div class="image-intro">
                                <img src="img/hotel/Sjöparken - a tranquil Swedish retreat with minimalist design & natural influences _ These Four Wall.jpg">
                                <div class="overlay-text">
                                    <p>Feel comfortable like your home</p>
                                </div>  
                            </div>
                        </div>
                    </div>
                </section>
                <section id="contact" class="hidden">
                    <div class="contact hidden row">
                        <div class="title-contact hidden col-12">
                            <p>Contact Us</p>
                        </div>
                        <div class="hotel-infor hidden col-6">
                            <h3 style="font-size: 40px">ALIHOTEL</h3>
                            <br><!-- comment -->
                            <p><b>Địa chỉ:</b> Tòa nhà Beta, Đại học FPT Hà Nội - toạ lạc tại khu công nghệ cao Hoà Lạc, Thạch Thất, Hà Nội.</p>
                            <p><b>VPGD:</b> Tòa nhà Beta, Đại học FPT Hà Nội - toạ lạc tại khu công nghệ cao Hoà Lạc, Thạch Thất, Hà Nội.</p>
                            <p><b>Mã số thuế:</b> 0106011932</p>
                            <br><!-- comment -->
                            <br><!-- comment -->
                            <p><b>Email:</b> info@alihotel.vn</p>
                            <p><b>Điện thoại:</b> +84-243-8222-333</p>
                            <p><b>Hotline: 1900 1833</b></p>
                        </div>
                        <div class="contact-img hidden col-6">
                            <img src="img/hotel/hotelcontact.jpg"width="90%" alt="hotelContact"/>
                        </div>
                    </div>
                </section>
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

            </div>
        </footer>
    </div>
</div>
<br>

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

<!-- Bootstrap Notify -->
<script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

<!-- jQuery Vector Maps -->
<script src="assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
<script src="assets/js/plugin/jsvectormap/world.js"></script>
<script>
            $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
                type: "line",
                height: "70",
                width: "100%",
                lineWidth: "2",
                lineColor: "#177dff",
                fillColor: "rgba(23, 125, 255, 0.14)",
            });

            $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
                type: "line",
                height: "70",
                width: "100%",
                lineWidth: "2",
                lineColor: "#f3545d",
                fillColor: "rgba(243, 84, 93, .14)",
            });

            $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
                type: "line",
                height: "70",
                width: "100%",
                lineWidth: "2",
                lineColor: "#ffa534",
                fillColor: "rgba(255, 165, 52, .14)",
            });
</script>
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
  intent="WELCOME"
  chat-title="AliHotel"
  agent-id="c077f1bd-3bd4-4aa6-adca-b44871671084"
  language-code="en"
></df-messenger>
</body>
</html>