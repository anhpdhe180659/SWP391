<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Guest</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .modal-body {
            padding: 20px;
        }
        .form-group-default {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="card-header">
            <div class="d-flex align-items-center">
                <h4 class="card-title">Add Guest</h4>
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
                        <form action="addGuest" method="POST" onsubmit="return validate()">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group form-group-default">
                                            <label>Full Name</label>
                                            <input name="name" type="text" maxlength="100" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group form-group-default">
                                            <label>Address</label>
                                            <input name="address" type="text" maxlength="200" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group form-group-default">
                                            <label>Phone</label>
                                            <input id="phone" name="phone" type="text" maxlength="50" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group form-group-default">
                                            <label>Identification</label>
                                            <input id="identification" name="identification" type="text" maxlength="20" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group form-group-default">
                                            <label>Sex</label>
                                            <select name="sex" class="form-control">
                                                <option value="1">Male</option>
                                                <option value="0">Female</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group form-group-default">
                                            <label>Date of Birth</label>
                                            <input type="date" name="dateOfBirth" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group form-group-default">
                                            <label>Email</label>
                                            <input id="email" name="email" type="text" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group form-group-default">
                                            <label>Status</label>
                                            <select name="status" class="form-control">
                                                <option value="1">Active</option>
                                                <option value="0">Inactive</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer border-0">
                                <button type="submit" class="btn btn-primary">ADD</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function BackToList() {
            window.history.back(); // Adjust this to navigate to your guest list page
        }

        function validate() {
            // Add your validation logic here if needed
            return true; // Allow form submission
        }
    </script>
</body>
</html>
