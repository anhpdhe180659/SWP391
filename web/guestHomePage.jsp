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
        <title></title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <link
            rel="icon"
            href="assets/img/kaiadmin/favicon.ico"
            type="image/x-icon"
            />
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
                        <div class="logo col-md-3 col-sm-12">
                            <a href="#">
                                <img src="img/logo/logo.png" alt="logo" width="120" >
                            </a>
                        </div>
                        <div class="navbar-link col-md-3 col-sm-12">
                            <a href="#about">About Us</a>
                        </div>
                        <div class="navbar-link col-md-3 col-sm-12">
                            <a href="#contact">For Booking</a>
                        </div>
                        <div class="login-area col-md-3 col-sm-12">
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
                <section  id="about">
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
                            <p><b>Địa chỉ:</b> Số nhà 25, tổ dân phố 21, phường Him Lam, thành phố Điện Biên Phủ, tỉnh Điện Biên</p>
                            <p><b>VPGD:</b> Tòa nhà Mường Thanh, lô CC5 bán đảo Linh Đàm, phường Hoàng Liệt, quận Hoàng Mai, Hà Nội, Việt Nam.</p>
                            <p><b>Mã số thuế:</b> 0106011932</p>
                            <br><!-- comment -->
                            <br><!-- comment -->
                            <p><b>Email:</b> info@muongthanh.vn</p>
                            <p><b>Điện thoại:</b> +84-243-8222-333</p>
                            <p><b>Hotline: 1900 1833</b></p>
                        </div>
                        <div class="contact-img hidden col-6">
                            <img src="img/hotel/hotelcontact.jpg"width="90%" alt="hotelContact"/>
                        </div>
                    </div>
                </section>
            </div>
            <!--            <div class="footer">
            
                        </div>-->
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
    </body>
</html>
