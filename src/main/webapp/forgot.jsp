<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta charset="ISO-8859-1">

<style>
/* Styles for background image */
.bg-img {
  width: 100%;
  background-image: url("image/busbg86.jpeg");
  min-height: 530px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover; /* Ensure the background image covers the entire container */
}

/* Center the form container horizontally */
.col-lg-8 {
  width: 40%; /* Adjust width as needed */
  margin: 0 auto;
}

/* Styles for the form container */
.contain-1 {
  color: white;
  padding: 26px;
  background: rgba(0, 0, 0, 0.7);
  border-radius: 10px;
}

/* Styles for form inputs and labels */
.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 5px;
}

input[type="text"],
input[type="password"] {
  border-radius: 10px;
  padding: 10px;
  width: 100%;
  background-color: #C1D1D1;
  border: none;
  box-sizing: border-box;
}

input[type="submit"] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 15px;
  cursor: pointer;
}

/* Styles for error messages */
.text-danger {
  color: red;
  font-weight: bold;
}
</style>

<script>
// Check if the successMessage attribute is present and display an alert
window.onload = function() {
    <% if (request.getAttribute("successMessage") != null) { %>
        alert("<%= request.getAttribute("successMessage") %>");
    <% } else if(request.getAttribute("errorMessage") != null){%>
    alert("<%= request.getAttribute("errorMessage") %>");
    <%}%>
    
};
</script>

</head>
<body>

<div class="bg-img">
  <div class="col-lg-8 m-auto">
    <form action="Forgot" method="post" class="contain-1" onsubmit="return validation()">
      <h2>Change Password</h2><br>

      <div class="form-group">
        <label for="email"><i class="fa fa-user"></i> Email:</label>
        <input id="email" type="text" name="uemail" placeholder="Enter Your Email">
        <span id="uemail" class="text-danger"></span>
      </div>

      <div class="form-group">
        <label for="pass"><i class="fa fa-key"></i> New Password:</label>
        <input id="pass" type="password" name="upass" placeholder="New Password">
        <span id="upass" class="text-danger"></span>
      </div>

      <div class="form-group">
        <label for="cpass"><i class="fa fa-key"></i> Confirm Password:</label>
        <input id="cpass" type="password" name="cpass" placeholder="Confirm Password">
        <span id="ucpass" class="text-danger"></span>
      </div>

      <input type="submit" value="Submit">
    </form>
  </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
