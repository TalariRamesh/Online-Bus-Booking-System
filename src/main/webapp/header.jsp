<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
.btn {
  background-color: black;
  border: none;
  color: white;
  padding: 12px 10px;
  font-size: 20px;
  cursor: pointer;
  border-radius:10px;
}

/* Darker background on mouse-over */
.btn:hover {
  background-color: red;
}
header{
height: 70px;
background-color:orange;
display:flex;
justify-content:space-around;
padding:5px;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Add box shadow */
   
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display:flex;
}

li{
border-radius:10px;
padding:9px;
font-size: 25px;
color: white;
}

li a{
text-decoration:none;
color:white;
}
 .dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 20px;  
  border: none;
  outline: none;
  color: white;
  padding: 12px 10px;
  background-color: black;
  font-family: inherit;
  margin: 0;
  border-radius:10px;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
   color: black;
  background-color: #f9f9f9;
  min-width: 190px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-store,no-cache,must-revalidate");
if(session.getAttribute("uemail")==null)
	response.sendRedirect("Welcome.jsp");
%>
<%HttpSession session2=request.getSession();
 String uemail=(String)session2.getAttribute("uemail");
%>
  <%
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
	 PreparedStatement ps=con.prepareStatement("select * from login where uemail=?");
	 ps.setString(1,uemail);
	 ResultSet res=ps.executeQuery();
	 while(res.next()){
 %>
<header>
<span><img src="image/BusLogo.png";

height="60"width="auto"alt="logo"style="float:left;">

</span>
<ul>
<li><a title="Home Page" href="StationList.jsp"><button class="btn"><i class="fa fa-home"></i> Home</button></a></li>
<li><a title="about our team" href="ViewTicket.jsp" target="ifr"><button class="btn"><i class="fa fa-ticket"></i> View Ticket</button></a></li>
<li><a title="contact us" href="help/mainhelp.jsp" target="ifr"><button class="btn"><i class="fa fa-question-circle"></i> Help</button></a></li>
<li><a title="about admin" href="https://www.linkedin.com/in/ramesht1/" target="ifr"><button class="btn"><i class="fa fa-info-circle"></i> About us</button></a></li>
<li>  <div class="dropdown">
    <button class="dropbtn "><i class="fa fa-user icon"></i> <%=res.getString("uname")%>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="Profile.jsp"><i class="fa fa-user icon"></i> Profile</a>
      <a href="ViewTicket.jsp"><i class="fa fa-ticket"></i>My Ticket</a>
      <a href="Logout.jsp"><i class="fa fa-sign-out"></i> Logout</a>
    </div>
  </div> </li>
</ul>
</header>

<%
    }}
catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>