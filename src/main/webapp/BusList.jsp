<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.bg-img {
  background-image: url("image/BUSIMAGE5.jpg");

  min-height: 730px;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;  
  
  display:flex;
  justify-content:center;
  flex-direction:column;
  padding-top:0;
  margin-top:0;
}
table{
border-style: inset;
   }
 th {
  border: 0px solid black;
  height:50px;
}
 td {

  height:70px;
  border-style: outset;
}
.b1 {
  height:3px;
  border-style: outset;
}
.a1{
  width:410px;
  }
  .a2{
  width:120px;
  }
  .a3{
  width:20px;
  }
  .a4{
  width:120px;
  }
  .a5{
  width:375px;
  }
  #abc{
  border-radius: 45px;
  padding: 15px; 
  width: 250px;
  height: 10px;  
}
input[type=submit] {
  width: 50%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 45px;
  cursor: pointer;}
  input[type=submit]:hover {
  background-color: #094A04;
}
</style>
<title>Insert title here</title>
</head>
<body><div class="bg-img">
<h6></h6>
<%!
Connection con;
Statement stmt;
ResultSet res;
%>
<%
String cityTo=request.getParameter("cityTo");
String cityFrom=request.getParameter("cityFrom");
String type=request.getParameter("type");
String dateofjourney=request.getParameter("dateofjourney");
session.setAttribute("dateofjourney", dateofjourney); 

%>
<%
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
PreparedStatement ps=con.prepareStatement("select * from buslist where cityTo=? and cityFrom=? and type=?");
ps.setString(1,cityTo);
ps.setString(2,cityFrom);
ps.setString(3,type);
ResultSet res=ps.executeQuery();


int i=0;
while(res.next()){ 
i++;
%> 
<table bgcolor="lightgray">
<tr>
    <th name="busName" align="left" class="a1"><h3>BusNo:- <%=res.getString("busNo")%> ; Bus Name:-<%=res.getString("busName")%></h3></th>
    <th name="cityFrom" class="a2"><%=res.getString("cityFrom")%></th>
    <th class="a3">==></th>
    <th name="cityTo" class="a4"><%=res.getString("cityTo")%></th>
    <th name="fare" class="a5">Fare: Rs <%=res.getString("fare")%></th>
  </tr>
  <tr>
    <td name="type" align="center"><b><%=res.getString("type")%></b></td>
    <td name="timeFrom" align="center"><%=res.getString("timeFrom")%></td>
    <td align="center">==></td>
    <td name="timeTo" align="center"><%=res.getString("timeTo")%></td>
    <td align="center">
    
<form action="Booking.jsp" method="GET">
    <input type="hidden" name="busNo" value=<%=res.getString("busNo")%>>
    <input type="submit" value ="BOOK">
</form></td>
  
  </tr>
  <tr>
    <td class="b1" colspan="5" bgcolor="black" ></td>
  </tr>


<%
}

if(i>0){
	
}
else{%><center>
<table bgcolor="lightgray"><tr><td align="center">SORRY!!! Currently On This Route Bus Service Is Not Available.</td></tr>
<tr><td><form action="StationList.jsp" method="GET">
    <input type="submit" value ="Search Another Bus">
</form>

</table></center>



<% 
}



}

catch(Exception e){
	e.printStackTrace();
}

%>

</table>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>