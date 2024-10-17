<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Feedback" %>
<%@ page import="dal.FeedbackDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Feedback Form with Star Rating</title>
        <style>
            body {
                 font-family: Arial, sans-serif;
    background-image: url('https://acihome.vn/uploads/15/thiet-ke-khach-san-ven-bien-dang-cap-nghi-duong-5-sao-tien-nghi-hien-dai-3.jpg');
    background-size: cover;
    background-position: center;
    margin: 0;
    padding: 0;
            }
            .header-container {
                background-color: #333;
                padding: 10px 0;
                margin-bottom: 20px;
            }
            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                max-width: 1200px;
                margin: 0 auto;
            }
            .navbar a {
                color: white;
                text-decoration: none;
                padding: 14px 20px;
                display: block;
            }
            .navbar a:hover {
                background-color: #575757;
            }
            .logo img {
                width: 120px;
            }
            .navbar-link {
                display: flex;
            }
            .navbar-link a {
                margin-left: 20px;
            }
            .container {
                width: 50%;
                margin: auto;
                background-color: white;
                padding: 20px;
                box-shadow: 0px 0px 10px 0px #aaa;
                margin-top: 20px;
            }
            h2 {
                text-align: center;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                font-weight: bold;
            }
            input, textarea {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
            .feedback-list {
                margin-bottom: 30px;
            }
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
    </head>
    <body>
        <div class="header-container">
            <nav class="navbar">
                <div class="logo">
                    <a href="#">
                        <img src="img/logo/logo.png" alt="logo">
                    </a>
                </div>
                <div class="navbar-link">
                    <a href="#about">About Us</a>
                    <a href="#contact">For Booking</a>
                    <a href="#feedback">Feedback</a>
                </div>
            </nav>
        </div>

        <!-- Phần hiển thị feedback đã có -->
        <div class="container">
            <h2>Previous Feedback</h2>
            <div class="feedback-list">
                <% 
                    FeedbackDAO feedbackDAO = new FeedbackDAO();
                    List<Feedback> feedbackList = feedbackDAO.getAllFeedback(); // Lấy tất cả phản hồi từ database
                    for (Feedback feedback : feedbackList) {
                %>
                <div class="feedback-item">
                    <p class="author"><%= feedback.getName() %></p>
                    <p>"<%= feedback.getFeedback() %>"</p>
                    <p>Rating: <%= "⭐".repeat(feedback.getRating()) + "☆".repeat(5 - feedback.getRating()) %></p> 
                     
                    
                   </div>
                <% } %>
            </div>
        </div>  
            
             

        <!-- Form Feedback -->
        <div class="container">
            <h2>Feedback Form</h2>
            <form action="submitFeedback" method="post"> <!-- Sửa action để chỉ đến servlet -->
                <div class="form-group">
                    <label for="name">Your Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="guestid">Your GuestID:</label>
                    <input type="text" id="guestid" name="guestid" required> <!-- Sửa input type thành text -->
                </div>
                <div class="form-group">
                    <label for="feedback">Your Feedback:</label>
                    <textarea id="feedback" name="feedback" rows="5" required></textarea>
                </div>

                <div class="form-group">
                    <label>Your Rating:</label>
                    <div class="rating">
                        <input type="radio" id="star5" name="rating" value="5" required><label for="star5">★</label>
                        <input type="radio" id="star4" name="rating" value="4"><label for="star4">★</label>
                        <input type="radio" id="star3" name="rating" value="3"><label for="star3">★</label>
                        <input type="radio" id="star2" name="rating" value="2"><label for="star2">★</label>
                        <input type="radio" id="star1" name="rating" value="1"><label for="star1">★</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit">Submit Feedback</button>
                </div>
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

                <% 
        String notification = (String) request.getAttribute("noti");
        if (notification != null) {
                %>
                <script>
                    const notiMessage = "<%= notification %>";
                    console.log(notiMessage)
                    if (notiMessage !== "") {
                        swal({
                            icon: notiMessage.includes("Thank") ? 'success' : 'error', // Kiểm tra thông báo thành công hay lỗi
                            title: notiMessage.includes("Thank") ? 'Success' : 'Error',
                            text: notiMessage,
                        });
                    }
                </script>
                <% } %>

            </form>
        </div>
        <!-- Thêm SweetAlert từ CDN -->

    </body>
</html>
