<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Form</title>
<style>
   *{
    margin:0;
    paddng:0;
    box-sizing:border-box;
   }
  .bg-img{
    background-image: url("image/busbg63.jpg");
    background-size: cover;
    background-position: center;
    min-height:90vh;
    display: flex;
    justify-content: center;
    align-items: center;
    width:100%;
  }
  .btn{
   padding:5px 10px;;
   margin:5px 0;
   color:black;
   text-decoration:none;
  }
  .btn:hover{
   color:blue;
   text-decoration:underline;
  }
  .contain {
    min-width: 400px;
    padding: 20px;
    background:lightyellow;
    border-radius: 10px;
  }
  .form-group {
    margin-bottom: 20px;
  }

  input[type="text"],
  input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  input[type="submit"] {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #4CAF50;
    color: white;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #45a049;
  }

  .text-danger {
    color: #ff0000;
  }
  .text-center{
  padding:0 0 10px 0;
  text-align:center;
  }
</style>
</head>
<body>
<div class="bg-img">
  <div class="contain">
    <h2 class="text-center">Registration Form</h2>
    <form action="Register" method="post" onsubmit="return validation()">
      <div class="form-group">
        <input type="text" id="name" name="uname" placeholder="Enter Full Name">
        <span id="uname" class="text-danger"></span>
      </div>
      <div class="form-group">
        <input type="text" id="email" name="uemail" placeholder="Enter Your Email">
        <span id="uemail" class="text-danger"></span>
      </div>
      <div class="form-group">
        <input type="password" id="pass" name="upass" placeholder="Enter New Password">
        <span id="upass" class="text-danger"></span>
      </div>
      <div class="form-group">
        <input type="password" id="cpass" name="cpass" placeholder="Confirm Password">
        <span id="ucpass" class="text-danger"></span>
      </div>
      <div class="form-group">
        <input type="text" id="phone" name="uphone" placeholder="Enter Mobile Number">
        <span id="uphone" class="text-danger"></span>
      </div>
      <input type="submit" id="submit" value="Submit">
    </form>
    <a href="Login.jsp" class="btn">Existing User? SignIn here! </a>
  </div>
</div>

<script type="text/javascript">
function validation() {
  var name = document.getElementById('name').value;
  var email = document.getElementById('email').value;
  var pass = document.getElementById('pass').value;
  var cpass = document.getElementById('cpass').value;
  var phone = document.getElementById('phone').value;

  if (name.trim() === "") {
    document.getElementById('uname').innerHTML = "* Name cannot be empty";
    return false;
  }
  if (email.trim() === "") {
    document.getElementById('uemail').innerHTML = "* Email cannot be empty";
    return false;
  }
  if (email.indexOf('@') <= 0) {
    document.getElementById('uemail').innerHTML = "* Invalid email";
    return false;
  }
  if ((email.charAt(email.length - 4) !== '.') && (email.charAt(email.length - 3) !== '.')) {
    document.getElementById('uemail').innerHTML = "* Invalid email";
    return false;
  }
  if (pass.trim() === "") {
    document.getElementById('upass').innerHTML = "* Password cannot be empty";
    return false;
  }
  if (pass.length < 5 || pass.length > 15) {
    document.getElementById('upass').innerHTML = "* Password must be between 5 and 15 characters";
    return false;
  }
  if (pass !== cpass) {
    document.getElementById('ucpass').innerHTML = "* Passwords do not match";
    return false;
  }
  if (phone.trim() === "") {
    document.getElementById('uphone').innerHTML = "* Phone number cannot be empty";
    return false;
  }
  if (isNaN(phone)) {
    document.getElementById('uphone').innerHTML = "* Phone number must be a number";
    return false;
  }
  if (phone.length !== 10) {
    document.getElementById('uphone').innerHTML = "* Phone number must be 10 digits";
    return false;
  }
}
</script>

</body>
</html>
<%@ include file="footer.jsp" %>
  