<%-- 
    Document   : editUser
    Created on : Sep 22, 2024, 1:29:17 PM
    Author     : nhatk
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Add user</title><!--  page only for manager  -->
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
                    <!-- Navbar Header -->
                    <jsp:include page="navbar-header.jsp"/>
                </div>

                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Manage User</h3>
                        </div>



                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center">
                                        <h4 class="card-title">Add User</h4>
                                        <button class="btn btn-primary btn-round ms-auto" onclick="BackToList()">
                                            <i class="fas fa-angle-left"></i>
                                            Back to list
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Modal -->
                                    <div>
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <form action="addUser"  method="POST"  onsubmit="return validate()">
                                                    <div class="modal-body">
                                                        <c:set value="${requestScope.user}" var="u"/>
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="form-group form-group-default">
                                                                    <label>Full Name</label>
                                                                    <input
                                                                        name="name"
                                                                        id="name"
                                                                        value="${u.name}"
                                                                        type="text"
                                                                        maxlength="100"
                                                                        minlength="4"
                                                                        pattern="^[A-Za-zÀ-ÿ\s'-]{1,100}$"
                                                                        title="Name contains only character, length should more than 4 and less than 100"
                                                                        class="form-control"
                                                                        required
                                                                        placeholder="Enter user's fullname"
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group form-group-default">
                                                                    <label>Address</label>
                                                                    <input
                                                                        value="${u.address}"
                                                                        name="address"
                                                                        id="address"
                                                                        type="text"
                                                                        class="form-control"
                                                                        maxlength="200"
                                                                        minlength="4"
                                                                        pattern="^[\p{L}\p{N}\s,.'-]+$"
                                                                        title="Address can contain letters, numbers, spaces, commas, periods, apostrophes, and hyphens."
                                                                        required
                                                                        placeholder="Enter address"
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Phone</label>
                                                                    <input
                                                                        value="${u.phone}"
                                                                        id="phone"
                                                                        name="phone"
                                                                        type="text"
                                                                        maxlength="50"
                                                                        class="form-control"
                                                                        placeholder="Enter phone number"
                                                                        pattern="^\d{10}$"
                                                                        title="Valid phone number must be 10 digits long"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Identification</label>
                                                                    <input
                                                                        value="${u.identification}"
                                                                        id="identification"
                                                                        name="identification"
                                                                        type="text"
                                                                        maxlength="20"
                                                                        class="form-control"
                                                                        required
                                                                        placeholder="Enter Identification"
                                                                        pattern="^[A-Z]{1}[0-9]{7}|[0-9]{9}|[0-9]{12}$"
                                                                        title="Valid ID contains 1 uppercase letters and 7 digits, 9 or 12 digits"
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Sex</label>
                                                                    <select name="sex" class="form-control">
                                                                        <option value="1" <c:if test="${u.sex == 1}">
                                                                                selected
                                                                            </c:if> />Male</option>
                                                                        <option value="0" <c:if test="${u.sex == 0}">
                                                                                selected
                                                                            </c:if> />Female</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4" >
                                                                <div class="form-group form-group-default" style="line-height: 23px">
                                                                    <label>Date of Birth</label>
                                                                    <input 
                                                                        value="${u.dateOfBirth}"
                                                                        id="birthday"
                                                                        type="date" name="birthday" required
                                                                        style="width: 100%; border: none; "/>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4" >
                                                                <div class="form-group form-group-default" style="line-height: 23px">
                                                                    <label>Salary</label>
                                                                    <input type="number" name="salary"
                                                                           value="${u.salary}"
                                                                           id="salary"
                                                                           min="0" max="2000000000" required
                                                                           placeholder="Enter salary"
                                                                           style="width: 100%; border: none; "/>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4" >
                                                                <div class="form-group form-group-default" style="line-height: 23px">
                                                                    <label>Start Date</label>
                                                                    <input type="date" name="startdate" 
                                                                           id="startdate"
                                                                           value="${u.startDate}" required
                                                                           style="width: 100%; border: none; "/>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group form-group-default">
                                                                    <label>Username</label>
                                                                    <input
                                                                        value="${u.username}"
                                                                        id="username"
                                                                        name="username"
                                                                        type="text"
                                                                        placeholder="Enter username"
                                                                        pattern="[a-zA-Z0-9]{4,12}$" title="length should be 4-12, no spaces, unsigned"
                                                                        class="form-control"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group form-group-default">
                                                                    <label>Password</label>
                                                                    <input
                                                                        name="password"
                                                                        id="password"
                                                                         value="${u.password}"
                                                                        type="text" pattern="[a-zA-Z0-9]{3,18}$" title="length should be 3-18, no spaces, unsigned"
                                                                        class="form-control"
                                                                        style="width: 50%"
                                                                        placeholder="Enter password"
                                                                        required
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Email</label>
                                                                    <input
                                                                        id="email"
                                                                        name="email"
                                                                        type="text"
                                                                        value="${u.email}"
                                                                        class="form-control"
                                                                        placeholder="Enter email"
                                                                        required
                                                                        pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                                                        title="Invalid email address"
                                                                        />
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Role</label>                  
                                                                    <select name="role" class="form-control">
                                                                        <option value="2"
                                                                                <c:if test="${u.role == 2}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Receptionist</option>
                                                                        <option value="3"
                                                                                <c:if test="${u.role == 3}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Housekeeper</option>
                                                                        <option value="1"
                                                                                <c:if test="${u.role == 1}">
                                                                                    selected
                                                                                </c:if>
                                                                                >Admin</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group form-group-default">
                                                                    <label>Status</label>
                                                                    <select name="status" class="form-control">
                                                                        <option value="1"
                                                                                <c:if test="${u.status == 1}">
                                                                                    selected
                                                                                </c:if>
                                                                                style="color: green;font-weight: bold" >active</option>
                                                                        <option value="0"
                                                                                <c:if test="${u.status == 0}">
                                                                                    selected
                                                                                </c:if>
                                                                                style="color: red;font-weight: bold">inactive</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="text" name="userid" value="${u.userID}" hidden="">
                                                    <div class="modal-footer border-0">
                                                        <c:set value="${requestScope.noti}" var="noti"/>
                                                        ${noti}
                                                        <button
                                                            type="submit"
                                                            class="btn btn-primary">
                                                            ADD
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
            window.location = "listUser";
        }
    </script>

    <script>
        document.getElementById("address").addEventListener("blur", function () {
            const address = this.value.trim();
            const pattern = /^[\p{L}\p{N}\s,.'-]+$/u; // Supports letters, numbers, and common punctuation
            if (address !== "") {
                if (!pattern.test(address)) {
                    alert("Invalid address. Please use only letters, numbers, spaces, commas, periods, apostrophes, and hyphens.");
                    this.value = "";
                }
            }
        });
        document.getElementById("email").addEventListener("blur", function () {
            const email = this.value.trim();
            const regexEmail = /^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$/;
            if (email !== "") {
                if (!regexEmail.test(email)) {
                    alert("Please enter a valid Email address (example@gmail.com)");
                    this.value = "";
                }
            }
        });
    </script>
    <script>
        function validate() {

            var option = confirm("Are you sure to add new user?");
            if (option === true) {
                return true;
            }
            return false;
        }
    </script>
    <script>
        const startDateInput = document.getElementById("startdate");

        // Set today's date as the minimum date (can't be in the past)
        const today = new Date();
        const minDate = today.toISOString().split('T')[0];
        startDateInput.setAttribute("min", minDate);

        // Set the max date to 30 days in the future
        const maxFutureDate = new Date(today);
        maxFutureDate.setDate(maxFutureDate.getDate() + 30); // 30 days from today
        const maxDate = maxFutureDate.toISOString().split('T')[0];
        startDateInput.setAttribute("max", maxDate);
    </script>
    <script>
        const today2 = new Date();
        // Set the max attribute for the birthday input to today's date
        const minAgeDate = new Date(today2.getFullYear() - 18, today2.getMonth(), today2.getDate());
        // Set the max attribute for the birthday input to the date 18 years ago
        document.getElementById("birthday").setAttribute("max", minAgeDate.toISOString().split('T')[0]);
    </script>
    <script>
        document.getElementById("name").addEventListener("blur", function () {
            const nameInput1 = document.getElementById("name").value;
            // Check if the input contains only spaces
            if (nameInput1 !== "" && nameInput1.trim() === "") {
                alert("The name field cannot contain only spaces.");
                // Optionally, you can clear the field or take any other action
                document.getElementById("name").value = ""; // Clear the field
            }
        });
        document.getElementById("email").addEventListener("blur", function () {
            const nameInput2 = document.getElementById("email").value;
            // Check if the input contains only spaces
            if (nameInput2 !== "" && nameInput2.trim() === "") {
                alert("The email field cannot contain only spaces.");
                // Optionally, you can clear the field or take any other action
                document.getElementById("email").value = ""; // Clear the field
            }
        });
        document.getElementById("identification").addEventListener("blur", function () {
            const nameInput3 = document.getElementById("identification").value;
            // Check if the input contains only spaces
            if (nameInput3 !== "" && nameInput3.trim() === "") {
                alert("The identification field cannot contain only spaces.");
                // Optionally, you can clear the field or take any other action
                document.getElementById("identification").value = ""; // Clear the field
            }
        });
        document.getElementById("phone").addEventListener("blur", function () {
            const nameInput4 = document.getElementById("phone").value;
            // Check if the input contains only spaces
            if (nameInput4 !== "" && nameInput4.trim() === "") {
                alert("The phone field cannot contain only spaces.");
                // Optionally, you can clear the field or take any other action
                document.getElementById("phone").value = ""; // Clear the field
            }
        });
        document.getElementById("address").addEventListener("blur", function () {
            const nameInput5 = document.getElementById("address").value;
            // Check if the input contains only spaces
            if (nameInput5 !== "" && nameInput5.trim() === "") {
                alert("The address field cannot contain only spaces.");
                // Optionally, you can clear the field or take any other action
                document.getElementById("address").value = ""; // Clear the field
            }
        });
        document.getElementById("username").addEventListener("blur", function () {
            const nameInput7 = document.getElementById("username").value;
            // Check if the input contains only spaces
            if (nameInput7 !== "" && nameInput7.trim() === "") {
                alert("The username field cannot contain only spaces.");
                // Optionally, you can clear the field or take any other action
                document.getElementById("username").value = ""; // Clear the field
            }
        });
        document.getElementById("password").addEventListener("blur", function () {
            const nameInput8 = document.getElementById("password").value;
            // Check if the input contains only spaces
            if (nameInput8 !== "" && nameInput8.trim() === "") {
                alert("The password field cannot contain only spaces.");
                // Optionally, you can clear the field or take any other action
                document.getElementById("password").value = ""; // Clear the field
            }
        });
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

            // edit Row
            $("#edit-user").DataTable({
                pageLength: 5,
            });

            var action =
                    '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

            $("#editUserButton").click(function () {
                $("#edit-user")
                        .dataTable()
                        .fneditData([
                            $("#editName").val(),
                            $("#editPosition").val(),
                            $("#editOffice").val(),
                            action,
                        ]);
                $("#editUserModal").modal("hide");
            });
        });
    </script>

</body>
</html>