<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

#email,#pass{
  border-radius: 10px;
  padding: 15px; 
  width: 250px;
  height: 40px; 
      background-color: #C1D1D1; 
}
input[type=submit]:hover {
  background-color: #094A04;
}
input[type=submit] {
  width: 90%;
  background-color: #4CAF50;
  color: white;
  padding: 7px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 15px;
  cursor: pointer;}

.bg-img{
 width: 100%;
 border: 1px solid black;
  background-image: url("image/busbg84.jpg");
  min-height: 630px;
  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size:cover;
}

/* Add styles to the form container */
form{
color:white;
  margin: 20px;
  max-width: 310px;
  padding: 26px;
  background: rgba(0, 0, 0, 0.7);
  border:1px solid orange;
  border-radius:10px;
}
.box{
display:flex;
justify-content:center;
align-items:center;
height:500px;
}
label{
font-size:15px;
}
.error {
            color: red;
            font-size: 14px;
            margin-top: 5px; /* Add some space above the error message */
        }

</Style>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
<div class="bg-img">
<div  class="box">
 <form action="AdminLogin" method="post" class="contain" onsubmit="return validation()">
 <h3><center>ADMIN LOGIN</center></h3>
<% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="error"><%= request.getAttribute("errorMessage") %></div>
                <% } %>
<h5>
<div class="form-group">
<label for="fname"><i class="fa fa-user"></i> Email:</label>
<input id="email" type="text" name="uemail" placeholder="Enter Your Email"><br></br>
<span id="uemail" class="text-danger font-weight-bold"></span>
</div>
<div class="form-group">
<label for="fname"><i class="fa fa-key"></i> Password:</label>
<input id="pass" type="password" name="upass" placeholder="Enter your Password"><br></br>
<span id="upass" class="text-danger"></span>
</div>
</h5>
<h5><input id="abc1" type="submit"value="Login"><br></h5>
</form></div>
</div>
  <script type="text/javascript">
            function validation(){
	var email =document.getElementById('email').value;
	var pass=document.getElementById('pass').value;
            
	if(email==""){
		document.getElementById('uemail').innerHTML="**Email id can not be empty";
		return false;
	}
	if(email.indexOf('@')<=0){
		document.getElementById('uemail').innerHTML="*invalid '@' position";
		return false;
	}
	if((email.charAt(email.length-4)!='.')&&(email.charAt(email.length-3)!='.')){
		document.getElementById('uemail').innerHTML="*invalid '.' position";
		return false;
	}
	if(pass==""){
		document.getElementById('upass').innerHTML="**Password can not be empty";
		return false;
	}
	if((pass.length<=4)||(pass.length>15)){
		document.getElementById('upass').innerHTML="*Password must be 5 to 15 Letter";
		return false;
	}
}
</script>
</body>
</html>
 <%@ include file="footer.jsp" %>