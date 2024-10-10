
<%-- 
    Document   : forms
    Created on : Sep 19, 2024, 9:33:29 AM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Booking</title>
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
                    <!-- Navbar Header -->
                    <jsp:include page="navbar-header.jsp"/>
                    <!-- End Navbar -->
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title" style="font-size: 24px;">Create booking</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">

                                            <div class="col-md-6 col-lg-4">
                                                <label style="margin: 0px 81px "><b style="font-size: 24px; color: #00aaff">Guest information</b></label>
                                                
                                                <div class="form-group">
                                                    <label for="name"><i class="fas fa-address-book"></i> Name </label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="name"
                                                        name="name"
                                                        placeholder="Enter guest's full name"
                                                        />
                                                </div>
                                                <div class="form-group">
                                                    <label for="iden"><i class="fas fa-address-card"></i> Identification</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="iden"
                                                        name="identification"
                                                        placeholder="Enter identification"
                                                        />
                                                </div>
                                                <div class="form-group">
                                                    <label for="phone"><i class="fas fa-phone"></i> Phone</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="phone"
                                                        name="phone"
                                                        placeholder="Enter phone number"
                                                        />
                                                </div>
                                                <div class="form-group">
                                                    <label for="address"><i class="fas fa-map-marker-alt"></i> Address</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="address"
                                                        name="address"
                                                        placeholder="Enter address"
                                                        />
                                                </div>
                                                <div class="form-group">
                                                    <label for="nationality"><i class="fas fa-globe"></i> Nationality</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="nationality"
                                                        name="nationality"
                                                        placeholder="Enter nationality"
                                                        />
                                                </div>
                                                <div class="form-group">
                                                    <label for="dob"><i class="fas fa-birthday-cake"></i> Date of birth</label>
                                                    <input
                                                        type="date"
                                                        class="form-control"
                                                        id="dob"
                                                        name="dob"
                                                        />
                                                </div>
                                                <div class="form-group">
                                                    <label><i class="fas fa-transgender"></i> Gender</label><br />
                                                    <div class="d-flex">
                                                        <div class="form-check">
                                                            <input
                                                                class="form-check-input"
                                                                type="radio"
                                                                name="flexRadioDefault"
                                                                id="flexRadioDefault1"
                                                                />
                                                            <label
                                                                class="form-check-label"
                                                                for="flexRadioDefault1"
                                                                >
                                                                Male
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input
                                                                class="form-check-input"
                                                                type="radio"
                                                                name="flexRadioDefault"
                                                                id="flexRadioDefault2"
                                                                checked
                                                                />
                                                            <label
                                                                class="form-check-label"
                                                                for="flexRadioDefault2"
                                                                >
                                                                Female
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <div class="col-md-6 col-lg-4">
                                                <div class="form-group">
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text" id="basic-addon1"
                                                              >@</span
                                                        >
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            placeholder="Username"
                                                            aria-label="Username"
                                                            aria-describedby="basic-addon1"
                                                            />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group mb-3">
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            placeholder="Recipient's username"
                                                            aria-label="Recipient's username"
                                                            aria-describedby="basic-addon2"
                                                            />
                                                        <span class="input-group-text" id="basic-addon2"
                                                              >@example.com</span
                                                        >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="basic-url">Your vanity URL</label>
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text" id="basic-addon3"
                                                              >https://example.com/users/</span
                                                        >
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="basic-url"
                                                            aria-describedby="basic-addon3"
                                                            />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text">$</span>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            aria-label="Amount (to the nearest dollar)"
                                                            />
                                                        <span class="input-group-text">.00</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-text">With textarea</span>
                                                        <textarea
                                                            class="form-control"
                                                            aria-label="With textarea"
                                                            ></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <button
                                                            class="btn btn-black btn-border"
                                                            type="button"
                                                            >
                                                            Button
                                                        </button>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            placeholder=""
                                                            aria-label=""
                                                            aria-describedby="basic-addon1"
                                                            />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            aria-label="Text input with dropdown button"
                                                            />
                                                        <div class="input-group-append">
                                                            <button
                                                                class="btn btn-primary btn-border dropdown-toggle"
                                                                type="button"
                                                                data-bs-toggle="dropdown"
                                                                aria-haspopup="true"
                                                                aria-expanded="false"
                                                                >
                                                                Dropdown
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="#">Action</a>
                                                                <a class="dropdown-item" href="#"
                                                                   >Another action</a
                                                                >
                                                                <a class="dropdown-item" href="#"
                                                                   >Something else here</a
                                                                >
                                                                <div
                                                                    role="separator"
                                                                    class="dropdown-divider"
                                                                    ></div>
                                                                <a class="dropdown-item" href="#"
                                                                   >Separated link</a
                                                                >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-icon">
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            placeholder="Search for..."
                                                            />
                                                        <span class="input-icon-addon">
                                                            <i class="fa fa-search"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-icon">
                                                        <span class="input-icon-addon">
                                                            <i class="fa fa-user"></i>
                                                        </span>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            placeholder="Username"
                                                            />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-label">Image Check</label>
                                                    <div class="row">
                                                        <div class="col-6 col-sm-4">
                                                            <label class="imagecheck mb-4">
                                                                <input
                                                                    name="imagecheck"
                                                                    type="checkbox"
                                                                    value="1"
                                                                    class="imagecheck-input"
                                                                    />
                                                                <figure class="imagecheck-figure">
                                                                    <img
                                                                        src="assets/img/examples/product1.jpg"
                                                                        alt="title"
                                                                        class="imagecheck-image"
                                                                        />
                                                                </figure>
                                                            </label>
                                                        </div>
                                                        <div class="col-6 col-sm-4">
                                                            <label class="imagecheck mb-4">
                                                                <input
                                                                    name="imagecheck"
                                                                    type="checkbox"
                                                                    value="2"
                                                                    class="imagecheck-input"
                                                                    checked=""
                                                                    />
                                                                <figure class="imagecheck-figure">
                                                                    <img
                                                                        src="assets/img/examples/product4.jpg"
                                                                        alt="title"
                                                                        class="imagecheck-image"
                                                                        />
                                                                </figure>
                                                            </label>
                                                        </div>
                                                        <div class="col-6 col-sm-4">
                                                            <label class="imagecheck mb-4">
                                                                <input
                                                                    name="imagecheck"
                                                                    type="checkbox"
                                                                    value="3"
                                                                    class="imagecheck-input"
                                                                    />
                                                                <figure class="imagecheck-figure">
                                                                    <img
                                                                        src="assets/img/examples/product3.jpg"
                                                                        alt="title"
                                                                        class="imagecheck-image"
                                                                        />
                                                                </figure>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-label">Color Input</label>
                                                    <div class="row gutters-xs">
                                                        <div class="col-auto">
                                                            <label class="colorinput">
                                                                <input
                                                                    name="color"
                                                                    type="checkbox"
                                                                    value="dark"
                                                                    class="colorinput-input"
                                                                    />
                                                                <span class="colorinput-color bg-black"></span>
                                                            </label>
                                                        </div>
                                                        <div class="col-auto">
                                                            <label class="colorinput">
                                                                <input
                                                                    name="color"
                                                                    type="checkbox"
                                                                    value="primary"
                                                                    class="colorinput-input"
                                                                    />
                                                                <span
                                                                    class="colorinput-color bg-primary"
                                                                    ></span>
                                                            </label>
                                                        </div>
                                                        <div class="col-auto">
                                                            <label class="colorinput">
                                                                <input
                                                                    name="color"
                                                                    type="checkbox"
                                                                    value="secondary"
                                                                    class="colorinput-input"
                                                                    />
                                                                <span
                                                                    class="colorinput-color bg-secondary"
                                                                    ></span>
                                                            </label>
                                                        </div>
                                                        <div class="col-auto">
                                                            <label class="colorinput">
                                                                <input
                                                                    name="color"
                                                                    type="checkbox"
                                                                    value="info"
                                                                    class="colorinput-input"
                                                                    />
                                                                <span class="colorinput-color bg-info"></span>
                                                            </label>
                                                        </div>
                                                        <div class="col-auto">
                                                            <label class="colorinput">
                                                                <input
                                                                    name="color"
                                                                    type="checkbox"
                                                                    value="success"
                                                                    class="colorinput-input"
                                                                    />
                                                                <span
                                                                    class="colorinput-color bg-success"
                                                                    ></span>
                                                            </label>
                                                        </div>
                                                        <div class="col-auto">
                                                            <label class="colorinput">
                                                                <input
                                                                    name="color"
                                                                    type="checkbox"
                                                                    value="danger"
                                                                    class="colorinput-input"
                                                                    />
                                                                <span class="colorinput-color bg-danger"></span>
                                                            </label>
                                                        </div>
                                                        <div class="col-auto">
                                                            <label class="colorinput">
                                                                <input
                                                                    name="color"
                                                                    type="checkbox"
                                                                    value="warning"
                                                                    class="colorinput-input"
                                                                    />
                                                                <span
                                                                    class="colorinput-color bg-warning"
                                                                    ></span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-label">Size</label>
                                                    <div class="selectgroup w-100">
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="value"
                                                                value="50"
                                                                class="selectgroup-input"
                                                                checked=""
                                                                />
                                                            <span class="selectgroup-button">S</span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="value"
                                                                value="100"
                                                                class="selectgroup-input"
                                                                />
                                                            <span class="selectgroup-button">M</span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="value"
                                                                value="150"
                                                                class="selectgroup-input"
                                                                />
                                                            <span class="selectgroup-button">L</span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="value"
                                                                value="200"
                                                                class="selectgroup-input"
                                                                />
                                                            <span class="selectgroup-button">XL</span>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-label">Icons input</label>
                                                    <div class="selectgroup w-100">
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="transportation"
                                                                value="2"
                                                                class="selectgroup-input"
                                                                />
                                                            <span
                                                                class="selectgroup-button selectgroup-button-icon"
                                                                ><i class="icon-screen-smartphone"></i
                                                                ></span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="transportation"
                                                                value="1"
                                                                class="selectgroup-input"
                                                                checked=""
                                                                />
                                                            <span
                                                                class="selectgroup-button selectgroup-button-icon"
                                                                ><i class="icon-screen-tablet"></i
                                                                ></span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="transportation"
                                                                value="6"
                                                                class="selectgroup-input"
                                                                />
                                                            <span
                                                                class="selectgroup-button selectgroup-button-icon"
                                                                ><i class="icon-screen-desktop"></i
                                                                ></span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="transportation"
                                                                value="6"
                                                                class="selectgroup-input"
                                                                />
                                                            <span
                                                                class="selectgroup-button selectgroup-button-icon"
                                                                ><i class="fa fa-times"></i
                                                                ></span>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-label d-block">Icon input</label>
                                                    <div
                                                        class="selectgroup selectgroup-secondary selectgroup-pills"
                                                        >
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="icon-input"
                                                                value="1"
                                                                class="selectgroup-input"
                                                                checked=""
                                                                />
                                                            <span
                                                                class="selectgroup-button selectgroup-button-icon"
                                                                ><i class="fa fa-sun"></i
                                                                ></span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="icon-input"
                                                                value="2"
                                                                class="selectgroup-input"
                                                                />
                                                            <span
                                                                class="selectgroup-button selectgroup-button-icon"
                                                                ><i class="fa fa-moon"></i
                                                                ></span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="icon-input"
                                                                value="3"
                                                                class="selectgroup-input"
                                                                />
                                                            <span
                                                                class="selectgroup-button selectgroup-button-icon"
                                                                ><i class="fa fa-tint"></i
                                                                ></span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="radio"
                                                                name="icon-input"
                                                                value="4"
                                                                class="selectgroup-input"
                                                                />
                                                            <span
                                                                class="selectgroup-button selectgroup-button-icon"
                                                                ><i class="fa fa-cloud"></i
                                                                ></span>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-label">Your skills</label>
                                                    <div class="selectgroup selectgroup-pills">
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="checkbox"
                                                                name="value"
                                                                value="HTML"
                                                                class="selectgroup-input"
                                                                checked=""
                                                                />
                                                            <span class="selectgroup-button">HTML</span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="checkbox"
                                                                name="value"
                                                                value="CSS"
                                                                class="selectgroup-input"
                                                                />
                                                            <span class="selectgroup-button">CSS</span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="checkbox"
                                                                name="value"
                                                                value="PHP"
                                                                class="selectgroup-input"
                                                                />
                                                            <span class="selectgroup-button">PHP</span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="checkbox"
                                                                name="value"
                                                                value="JavaScript"
                                                                class="selectgroup-input"
                                                                />
                                                            <span class="selectgroup-button">JavaScript</span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="checkbox"
                                                                name="value"
                                                                value="Ruby"
                                                                class="selectgroup-input"
                                                                />
                                                            <span class="selectgroup-button">Ruby</span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="checkbox"
                                                                name="value"
                                                                value="Ruby"
                                                                class="selectgroup-input"
                                                                />
                                                            <span class="selectgroup-button">Ruby</span>
                                                        </label>
                                                        <label class="selectgroup-item">
                                                            <input
                                                                type="checkbox"
                                                                name="value"
                                                                value="C++"
                                                                class="selectgroup-input"
                                                                />
                                                            <span class="selectgroup-button">C++</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-4">
                                                <label class="mb-3"><b>Form Group Default</b></label>
                                                <div class="form-group form-group-default">
                                                    <label>Input</label>
                                                    <input
                                                        id="Name"
                                                        type="text"
                                                        class="form-control"
                                                        placeholder="Fill Name"
                                                        />
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Select</label>
                                                    <select
                                                        class="form-select"
                                                        id="formGroupDefaultSelect"
                                                        >
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                </div>
                                                <label class="mt-3 mb-3"
                                                       ><b>Form Floating Label</b></label
                                                >
                                                <div class="form-floating form-floating-custom mb-3">
                                                    <input
                                                        type="email"
                                                        class="form-control"
                                                        id="floatingInput"
                                                        placeholder="name@example.com"
                                                        />
                                                    <label for="floatingInput">Email address</label>
                                                </div>
                                                <div class="form-floating form-floating-custom mb-3">
                                                    <select
                                                        class="form-select"
                                                        id="selectFloatingLabel"
                                                        required
                                                        >
                                                        <option selected>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                    <label for="selectFloatingLabel">Select</label>
                                                </div>

                                                <div class="form-group">
                                                    <label for="largeInput">Large Input</label>
                                                    <input
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        id="largeInput"
                                                        placeholder="Large Input"
                                                        />
                                                </div>
                                                <div class="form-group">
                                                    <label for="largeInput">Default Input</label>
                                                    <input
                                                        type="text"
                                                        class="form-control form-control"
                                                        id="defaultInput"
                                                        placeholder="Default Input"
                                                        />
                                                </div>
                                                <div class="form-group">
                                                    <label for="smallInput">Small Input</label>
                                                    <input
                                                        type="text"
                                                        class="form-control form-control-sm"
                                                        id="smallInput"
                                                        placeholder="Small Input"
                                                        />
                                                </div>
                                                <div class="form-group">
                                                    <label for="largeSelect">Large Select</label>
                                                    <select
                                                        class="form-select form-control-lg"
                                                        id="largeSelect"
                                                        >
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="defaultSelect">Default Select</label>
                                                    <select
                                                        class="form-select form-control"
                                                        id="defaultSelect"
                                                        >
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="smallSelect">Small Select</label>
                                                    <select
                                                        class="form-select form-control-sm"
                                                        id="smallSelect"
                                                        >
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-action">
                                        <button class="btn btn-success">Submit</button>
                                        <button class="btn btn-danger">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <footer class="footer">
                    <div class="container-fluid d-flex justify-content-between">
                        <nav class="pull-left">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="http://www.themekita.com">
                                        ThemeKita
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#"> Help </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#"> Licenses </a>
                                </li>
                            </ul>
                        </nav>
                        <div class="copyright">
                            2024, made with <i class="fa fa-heart heart text-danger"></i> by
                            <a href="http://www.themekita.com">ThemeKita</a>
                        </div>
                        <div>
                            Distributed by
                            <a target="_blank" href="https://themewagon.com/">ThemeWagon</a>.
                        </div>
                    </div>
                </footer>
            </div>

            <!-- Custom template | don't include it in your project! -->
            <div class="custom-template">
                <div class="title">Settings</div>
                <div class="custom-content">
                    <div class="switcher">
                        <div class="switch-block">
                            <h4>Logo Header</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="selected changeLogoHeaderColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="selected changeLogoHeaderColor"
                                    data-color="blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="purple"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="light-blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="green"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="orange"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="red"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="white"
                                    ></button>
                                <br />
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="dark2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="purple2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="light-blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="green2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="orange2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="red2"
                                    ></button>
                            </div>
                        </div>
                        <div class="switch-block">
                            <h4>Navbar Header</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="purple"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="light-blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="green"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="orange"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="red"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="white"
                                    ></button>
                                <br />
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="dark2"
                                    ></button>
                                <button
                                    type="button"
                                    class="selected changeTopBarColor"
                                    data-color="blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="purple2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="light-blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="green2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="orange2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="red2"
                                    ></button>
                            </div>
                        </div>
                        <div class="switch-block">
                            <h4>Sidebar</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="selected changeSideBarColor"
                                    data-color="white"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeSideBarColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeSideBarColor"
                                    data-color="dark2"
                                    ></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="custom-toggle">
                    <i class="icon-settings"></i>
                </div>
            </div>
            <!-- End Custom template -->
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

        <!-- Google Maps Plugin -->
        <script src="assets/js/plugin/gmaps/gmaps.js"></script>

        <!-- Sweet Alert -->
        <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>

        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo2.js"></script>
    </body>
</html>

