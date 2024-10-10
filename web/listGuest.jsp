<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>List Guest</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="img/logo/logo.png" type="image/x-icon" />
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
            <jsp:include page="sidebarReceptionist.jsp"/>
            <div class="main-panel">
                <div class="main-header">
                    <jsp:include page="navbar-header.jsp"/>
                </div>
                <div class="container">
                    <div class="page-inner">
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">Manage Guests</h3>
                        </div>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="display table table-striped table-hover">
                                            <thead>
                                                <tr style="text-align: center">
                                                    <th>Name</th>
                                                    <th>Date Of Birth</th>
                                                    <th>Sex</th>
                                                    <th>Address</th>
                                                    <th>Phone</th>
                                                    <th>Identification</th>
                                                    <th>Nationality</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listGuest}" var="g">
                                                    <tr>
                                                        <td>${g.name}</td>
                                                        <td><fmt:formatDate value="${g.dateOfBirth}" pattern="yyyy-MM-dd" /></td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${g.sex == 1}">
                                                                    <img src="assets/img/male-icon.png" alt="Male" />
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img src="assets/img/female-icon.png" alt="Female" />
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>${g.address}</td>
                                                        <td>${g.phone}</td>
                                                        <td>${g.identification}</td>
                                                        <td>${g.nationality}</td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${listGuest == null || listGuest.isEmpty()}">
                                                    <tr>
                                                        <td colspan="7" class="text-center">No Guests Found</td>
                                                    </tr>
                                                </c:if>
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
    </body>
</html>
