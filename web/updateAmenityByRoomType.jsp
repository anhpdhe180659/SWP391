<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Update Amenity by Room Type</title>
</head>
<body>
<h2>Update Amenity Quantity</h2>
<form action="UpdateAmenByRoomtype" method="post">
    <label for="typeId">Room Type ID:</label>
    <input type="number" id="typeId" name="typeId" required><br><br>
    
    <label for="amenID">Amenity ID:</label>
    <input type="number" id="amenID" name="amenID" required><br><br>
    
    <label for="quantity">New Quantity:</label>
    <input type="number" id="quantity" name="quantity" required><br><br>
    
    <input type="submit" value="Update">
</form>

<% 
    String message = (String) request.getAttribute("message");
    if (message != null) { 
%>
    <p><%= message %></p>
<% } %>
</body>
</html>
