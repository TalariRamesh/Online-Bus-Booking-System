<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
*{
margin:0;
padding:0;
box-sizing:border-box;
}
header{
height:70px;
background-color:orange;
padding:5px;
display:flex;
justify-content:space-around;
}
ul{
 display:flex;
 align-items:center;
 list-style-type:none;
 margin:0 ;
 padding:0;
}
li{
padding:9px;
}
ul li .a{
background-color:black;
display:block;
padding:12px 10px;
color:white;
text-decoration:none;
border-radius:8px;
font-size: 23px;

}
ul li .a:hover{
background-color:pink;
color:black;
}
.logo{
width:auto;
height:60px;
margin-left:10px;
}
</style>
</head>
<body>

<header>
  <img class="logo" src="image/BusLogo.png" alt="logo"> <!-- Added class and adjusted styling -->
  <ul>
    <li><a class="a" title="Home Page" href="Welcome.jsp"><i class="fa fa-home"></i> Home</a></li>
    <li><a class="a" title="Login for Admin" href="AdminLogin.jsp" target="ifr"><i class="fa fa-user"></i> Admin</a></li>
    <li><a class="a" title="New User Register" href="RegForm.jsp" target="ifr"><i class="fa fa-user-plus"></i> Register</a></li>
    <li><a class="a" title="About our team" href="AboutUs.jsp" target="ifr"><i class="fa fa-info-circle"></i> Aboutus</a></li>
    <li><a class="a" title="Contact us" href="help/mainhelp.jsp" target="ifr"><i class="fa fa-question-circle"></i> Help</a></li>
  </ul>
</header>
</body>
</html>
