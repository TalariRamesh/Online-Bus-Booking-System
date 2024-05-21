<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
*{    
margin:0;
padding:0;
box-sizing:border-box;
font-family: 'Josefin Sans', sans-serif;
 background-position: center;
  background-repeat: no-repeat;
  background-size: 100%;
  
  }

header{
width:100%;
height:100vh;
  min-height: 630px;
}
nav{
width:100%;
height:10vh;
background:orange;
color:white;
display:flex;
justify-content:space-between;
align-items:center;


}
nav .logo{
width:25%;
text-align:center;

}
nav .logo h1 a{
text-decoration:none;
}
nav .logo h1 a:hover{
text-decoration:underline;
}
nav .menu{
width:40%;
display:flex;
justify-content:space-around;
}
nav .menu a{
width: 25%;
text-decoration:none;
color: white;
font-weight:bold;
text-align:center;
margin:5px;
padding:15px;
border-radius:8px;
border:1px solid;
}
nav .menu a:hover{
background-Color:black;
}
main{
width: 100%;
height:90vh;
display: flex;
justify-content:center;
align-items:center;
text-align:center;
color:white;
}
section{

}
section h3{
font-size:35px;
font-weight:200;
letter-spacing:3px;
text-shadow:1px 1px 2px black;
}
section h1{
margin:30px 0 20px 0;
font-size: 55px;
font-weight:700;
text-shadow: 2px 1px 5px black;



}
section p{
font-size:25px;
word-spacing:2px;
margin-bottom:25px;
text-shadow:1px 1px 1px black;


}
section a{
padding:12px 30px;
border-radius:4px;
outline:none;
text-transform:uppercase;
font-size:13px;
font-weight:500;
text-decoration:none;
letter-spacing:1px;
}
section .btnone{
background:#fff;
color:#000;

}
.btnone:hover{
background: #00b894;
color: white
}

section .btntwo{
background: #00b894;
color: white
}
.btntwo:hover{
background:#fff;
color:#000;

}
.change_content:after{
content: '';
animation: changetext 10s infinite linear;
color:#04FAB4;

}
@keyframes changetext{
   0%{content:"Bangalore";}
 20%{content:"Hyderabad";}
 35%{content:"Kurnool";}
 60%{content:"Guntor";}
}
.crossfade > figure {

  animation: imageAnimation 30s linear infinite 0s;

  backface-visibility: hidden;

  background-size: cover;

  background-position: center center;

  color: transparent;

  height: 100%;

  left: 0px;

  opacity: 0;

  position: absolute;

  top: 0px;

  width: 100%;

  z-index: -1;

}
.crossfade > figure:nth-child(1) { background-image: url('image/busbg51.jpg');
  min-height:630px; }

 

.crossfade > figure:nth-child(2) {

  animation-delay: 6s;

  background-image: url('image/busbg61.jpg');
    min-height:630px;

}

.crossfade > figure:nth-child(3) {

  animation-delay: 12s;

  background-image: url('image/busbg63.jpg');
    min-height:630px;

}
.crossfade > figure:nth-child(4) {

  animation-delay: 18s;
  background-image: url('image/busbg65.jpg');
    min-height:630px;

}
.crossfade > figure:nth-child(5) {

  animation-delay: 24s;

  background-image: url('image/busbg84.jpg');
    min-height:630px;

}

@keyframes

imageAnimation {  0% {

 animation-timing-function: ease-in;

 opacity: 0;

}
 8% {

 animation-timing-function: ease-out;

 opacity: 1;

}

 17% {

 opacity: 1

}
 25% {
 opacity: 0
}
 100% {
 opacity: 0
}
}
</style>
</head>
<body>
<div class="crossfade">

  <figure></figure>

  <figure></figure>

  <figure></figure>

  <figure></figure>

  <figure></figure>


<header>
<nav>
     <div class="logo">
     <h1 class="animated">
      <a href="Welcome.jsp">RV Bus Services</a>
     </h1> 
     </div>
         <div class="menu">
          <a href="AdminLogin.jsp" target=""><i class="fa fa-user-secret"></i> Admin</a>
     </div>
</nav>
<main>
   <section>
       <h3>Welcome to RV Bus Services</h3>
       <h1>Make Trip & Visit <span class="change_content"></span></h1>
       <p>Book Your Ticket Now</p>
       <a href="Login.jsp"  target="" class="btnone"><i class="fa fa-sign-in"></i> Signin</a>
       <a href="RegForm.jsp" target="" class="btntwo"><i class="fa fa-user-plus"></i> Signup Here</a>
   </section>
</main>
</div>
</header>
</body>
</html>
<%@ include file="footer.jsp" %>