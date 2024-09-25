<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Change Password</title>
        <link rel="stylesheet" type="text/css" href="CSS/changePassword.css"> 
    </head>
    <body>
        <div class="container">
            <div class="form-section">
                <h1>Change Password</h1>

                <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                </c:if>

                <c:if test="${not empty success}">
                    <div class="success">${success}</div>
                </c:if>

                <form action="changePassword" method="post">
                    <div class="form-group">
                        <label for="currentPassword">Current Password:</label>
                        <input type="password" id="currentPassword" name="currentPassword" required>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">New Password:</label>
                        <input type="password" id="newPassword" name="newPassword" required>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm New Password:</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                    </div>
                    <button type="submit">Change Password</button>
                </form>

                <c:choose>
                    <c:when test="${sessionScope.role == 1}">
                        <a href="dashboard.jsp">Back to Dashboard</a>
                    </c:when>
                    <c:when test="${sessionScope.role == 2}">
                        <a href="receptionHomePage.jsp">Back to Reception Home Page</a>
                    </c:when>
                    <c:otherwise>
                        <a href="index.jsp">Back to Home Page</a>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="info-section">
                <h2>Hotel Management</h2>
                <p>Secure your account</p>
            </div>
        </div>
    </body>
</html>
