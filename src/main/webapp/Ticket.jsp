<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- <%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%> --%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function printPage() {
  window.print();
}
</script>
<style>
.bg-img {
  /* The image used */
  background-image: url("image/BUSIMAGE5.jpg");

  min-height: 100vh;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: 100%;
}
table{
align:centre;
width:610px;
border-style: outset;
}

.b1 {
  background-color:rgb(48, 113, 162);
  border-style: outset;
}
.b2 {
  background-color:rgb(164, 194, 148);
  border-style: outset;
}
input[type=button] {
  width: 100%;
  background-color: #C80B20;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 45px;
  cursor: pointer;}
  input[type=button]:hover {
  background-color: #094A04;
}
input[type=text] {
  width: 50%;
  padding: 14px 20px;
  margin: 8px 0;
  border-radius: 45px;
}

</style>
</head>
<body><div class="bg-img">
<% 
  String id=request.getParameter("id");
%>
 <%
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
	 PreparedStatement ps=con.prepareStatement("select * from ticket where ticket_id=?");
	 ps.setString(1,id);
	 ResultSet res=ps.executeQuery();
	 while(res.next()){
		 
 %>
 

 
<table bgcolor="lightgray" align="center">


<tr><td class="b1" colspan="3" ><h2><img src="image/ticketbus.png" alt="barcode" width="80" height="50" style="float:left;"> <center>RV bus service</center></h2></td></tr>
<tr>
    <td colspan="2" name="type" ><b><%=res.getString("busNo")%>.<%=res.getString("busName")%></b></td>
    <td name="timeFrom" align="center"><%=res.getString("cityFrom")%>==><%=res.getString("cityTo")%><br><h2></h2></td>
</tr>
<tr>
<td>Name:</td><td><%=res.getString("firstname")%></td>

</tr> 
<tr>
<td>Email:</td><td> <%=res.getString("email")%></td>
</tr>
<tr>
<td>Phone No.:</td> <td> <%=res.getString("phone")%></td>
<tr>
<tr>
<td>Reporting Time:</td><td> <%=res.getString("timeFrom")%></td>
<td rowspan="5" align="center"><img src="image/barcode.png" alt="barcode" width="130" height="130"></td>

</tr>
<tr>
<td>Date:</td><td> <%=res.getString("dateofjourney")%></td>
</tr>
<td>No. of Passenger:</td>
<td><%=res.getString("number")%></td>
</tr>
<tr>
<td>Total Fare:<h6>*18% GST Included</h6><br></td>
<td>Rs: <%=res.getString("add_amount")%></td>
</tr>

<%--
<tr>
 <td>Seat No.:</td><td>
<%
int num1 = Integer.parseInt(res.getString("pnumber"));
%>
<%

for(int i=1;i<=num1;i++)
	out.print("{A"+i+"}");
	%></td>
</tr>
 <tr>--%>
 
 
<td class="b2" colspan="3">Thanks For Booking...... Happy Journey!!!!!!</td>
</tr>
<tr>
 <td class="print"><input type="button" value ="print" onclick="printPage()" /></td>
 
 </tr>
</table> 
 <%        
}}
catch(Exception e){
	e.printStackTrace();
}

%>
</div>
</body>
</html>