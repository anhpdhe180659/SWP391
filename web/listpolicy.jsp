<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Policy List</title>  
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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                    <jsp:include page="navbar-header.jsp"/>
                </div>
<div class="container">
    <div class="page-inner">
        <div class="page-header">
            <h3 class="fw-bold mb-3">Manage Policies</h3>
        </div>

        <div class="col-md-12">
            <div class="card">
              <div class="card-header">
    <div class="d-flex align-items-center">
        <h4 class="card-title">Add Policy</h4>
        <button
            class="btn btn-primary btn-round ms-auto"
            data-toggle="modal"
            data-target="#addPolicyModal"
        >
            <i class="fa fa-plus"></i>
            Add Policy
        </button>
    </div>
</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="add-policy" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th style="width: 10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="policy" items="${policies}">
                                    <tr>
                                        <td>${policy.policyId}</td>
                                        <td>${policy.policyTitle}</td>
                                        <td>
                                            <div class="form-button-action">
                                                <button type="button" class="btn btn-link btn-primary btn-lg" 
                                                    onclick="viewPolicy(${policy.policyId}, '${policy.policyTitle}', '${policy.policyContext}')">
                                                    <i class="fa fa-eye"></i>
                                                </button>
                                                <button type="button" class="btn btn-link btn-primary btn-lg"
                                                    onclick="editPolicy(${policy.policyId}, '${policy.policyTitle}', '${policy.policyContext}')">
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                                <button type="button" class="btn btn-link btn-danger"
                                                    onclick="confirmDelete(${policy.policyId})">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
            </div>
<!-- Add Policy Modal -->
<div class="modal fade" id="addPolicyModal" tabindex="-1" role="dialog" aria-labelledby="addPolicyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form method="post" action="${pageContext.request.contextPath}/policy">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addPolicyModalLabel">Add Policy</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Title</label>
                        <input type="text" name="title" class="form-control" required>
                    </div>
                    <div class="form-group">
    <label>Context</label>
    <textarea name="context" class="form-control" rows="10" 
        style="white-space: pre-wrap;" required></textarea>
</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Edit Policy Modal -->
<div class="modal fade" id="editPolicyModal" tabindex="-1" aria-labelledby="editPolicyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form method="post" action="${pageContext.request.contextPath}/policy/update">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editPolicyModalLabel">Edit Policy</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="editPolicyId">
                    <div class="form-group">
                        <label>Title</label>
                        <input type="text" name="title" id="editPolicyTitle" class="form-control" required>
                    </div>
                   <div class="form-group">
    <label>Context</label>
    <textarea name="context" id="editPolicyContext" class="form-control" 
        rows="10" style="white-space: pre-wrap;" required></textarea>
</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deletePolicyModal" tabindex="-1" aria-labelledby="deletePolicyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deletePolicyModalLabel">Delete Policy</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this policy?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <a id="deletePolicyLink" class="btn btn-danger">Delete</a>
            </div>
        </div>
    </div>
</div> 
<!-- View Policy Modal -->
<div class="modal fade" id="viewPolicyModal" tabindex="-1" aria-labelledby="viewPolicyModalLabel" aria-hidden="true">
    <div class="modal-dialog"> 
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewPolicyModalLabel">View Policy</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="viewPolicyId">
                <div class="form-group">
                    <label>Title</label>
                    <p id="viewPolicyTitle" class="form-control"></p>
                </div>
                <div class="form-group">
                    <label>Context</label>
                    <div id="viewPolicyContext" class="form-control" 
                        style="white-space: pre-wrap; min-height: 200px; overflow-y: auto; background-color: white;"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<script>
   function viewPolicy(id, title, context) {
    // Decode HTML entities and unescape special characters
    title = $('<div/>').html(title).text();
    context = $('<div/>').html(context).text();
    
    $('#viewPolicyTitle').text(title);
    // Use .html() instead of .text() to preserve line breaks
    $('#viewPolicyContext').html(context.replace(/\n/g, '<br>'));
    $('#viewPolicyModal').modal('show');
}

function editPolicy(id, title, context) {
    // Decode HTML entities and unescape special characters
    title = $('<div/>').html(title).text();
    context = $('<div/>').html(context).text();
    
    $('#editPolicyId').val(id);
    $('#editPolicyTitle').val(title);
    $('#editPolicyContext').val(context);
    $('#editPolicyModal').modal('show');
}

    function confirmDelete(id) {
        if (confirm('Are you sure you want to delete this policy?')) {
            window.location.href = '${pageContext.request.contextPath}/policy/delete?id=' + id;
        }
    }

    // Show error messages in bootstrap alerts
    $(document).ready(function() {
        // Auto-hide alerts after 5 seconds
        setTimeout(function() {
            $('.alert').fadeOut('slow');
        }, 5000);
        
        // Initialize any tooltips
        $('[data-toggle="tooltip"]').tooltip();
    }); 
    
    $(document).ready(function () {
        $("#add-policy").DataTable({
            pageLength: 5,
        });
    });
</script>

</body>
</html>
