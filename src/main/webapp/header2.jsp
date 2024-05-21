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
<link rel="stylesheet" type="text/css" href="style.header2.css">

<style>
 *{
 margin:0;
 padding:0;
 }
 header{
 justify-content:space-around;

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
	 PreparedStatement ps=con.prepareStatement("select * from adminlogin where email=?");
	 ps.setString(1,uemail);
	 ResultSet res=ps.executeQuery();
	 while(res.next()){
		 
	 
 %>
<header>
<span><img src="image/BusLogo.png";

height="60"width="auto"alt="logo"style="float:left;">

</span>
<ul>
<li><a title="Home Page" href="UpdateBusList.jsp"><button class="btn"><i class="fa fa-home"></i> Home</button></a></li>
<li><a title="Manage Bus List" href="ManageBus.jsp" target="ifr"><button class="btn"><i class="fa fa-bus"></i>Manage Bus List</button></a></li>
<li><a title="About Developer" href="https://www.linkedin.com/in/ramesht1/" target="ifr"><button class="btn"><i class="fa fa-info-circle"></i>About_us</button></a></li>
<li><div class="dropdown">
    <button class="dropbtn"><i class="fa fa-user icon"></i> <%=res.getString("name")%>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="AdminProfile.jsp"><i class="fa fa-user icon"></i>Profile</a>
     <a href="Logout.jsp"><i class="fa fa-sign-out"></i>Logout</a>
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