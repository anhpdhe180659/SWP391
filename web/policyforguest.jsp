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
    
    <!-- Fonts and icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
         <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Open+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">

    
    <style>
        body { 
             font-family: 'Open Sans', sans-serif;
             background-image: url('https://monozy.net/wp-content/uploads/2019/04/khach-san-chup-anh-dep-o-ha-noi-4.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }
        
        .main-header { 
            
            background: #001b40;
            color: white;
            padding: 40px 20px;
            text-align: center;
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .back-link a {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        
        .back-link a:hover {
            color: #0056b3;
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
        
        .contact-info {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
        }
        
       
        .contact-info i {
            color: #007bff;
            margin-right: 10px;
        }

    </style>
</head>
<body>

  
    <!-- Header -->
    <div class="main-header">
        <h1 class="display-4">CHÍNH SÁCH VÀ QUY ĐỊNH ĐẶT PHÒNG</h1>
    </div>
    
    <!-- Back Link -->
    <div class="back-link">
        <a href="javascript:history.back()"><i class="fas fa-chevron-left"></i> Quay Lại</a>
    </div>

    <!-- Policy Section -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <%
                    PolicyDAO policyDAO = new PolicyDAO();
                    List<policy> policies = policyDAO.getAllPolicies();
                    for (policy p : policies) {
                %>
                <div class="policy-container">
                    <h2><i class="fas fa-book-open"></i> <%= p.getPolicyTitle() %></h2>
                    <%= p.getPolicyContext() %>
                </div>
                <%
                    }
                %>
                
                <!-- Contact Info (Static section) -->
                <div class="policy-container">
                    <div class="contact-info">
                        <p><i class="fas fa-phone"></i> Điện thoại: +84-243-8222-333</p>
                        <p><i class="fab fa-facebook-messenger"></i> Zalo: 0911 909 797</p>
                        <p><i class="fas fa-envelope"></i> Email:  info@alihotel.vn</p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>