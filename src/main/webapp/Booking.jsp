<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
<style>
.col-50 {
  padding: 0 40px;
 
}
input[type=text] {
  width: 100px;
  margin-bottom: 40px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}
hr {
  border: 1px solid lightgrey;
}
.bg-img {
  /* The image used */
  background-image: url("image/BUSIMAGE5.jpg");

  min-height: 730px;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  display:flex;
  justify-content:center;
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
  width:370px;
  }
  #abc{
  border-radius: 45px;
   text-align:center;
  width: 100px;
  height: 40px;  
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
input[type=text] {
  width: 50%;
  padding: 14px 20px;
  margin: 8px 0;
  border-radius: 45px;
}

</style>
<title> Insert title here</title>
</head>
<body><div class="bg-img" >
</br></br>
<h6></h6>

<% 
  String busNo=request.getParameter("busNo");

%>
 <%
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
	 PreparedStatement ps=con.prepareStatement("select * from buslist where busNo=?");
	 ps.setString(1,busNo);
	 ResultSet res=ps.executeQuery();
	 while(res.next()){
 %>
  <table bgcolor="lightblue">
<tr>
    <th name="busName" align="left" class="a1"><h3><%=res.getString("busNo")%>.<%=res.getString("busName")%></h3></th>
    <th name="cityFrom" class="a2"><%=res.getString("cityFrom")%></th>
    <th class="a3">==></th>
    <th name="cityTo" class="a4"><%=res.getString("cityTo")%></th>
    <th name="fare" class="a5"> </th>
  </tr>
  <tr>
    <td name="type" align="center"><b><%=res.getString("type")%></b></td>
    <td name="timeFrom" align="center"><%=res.getString("timeFrom")%></td>
    <td align="center">==></td>
    <td name="timeTo" align="center"><%=res.getString("timeTo")%></td>
    <td align="">Choose the Number of passenger:-<br><b>
    
    <form action="Booking" method="post" oninput="x.value=parseInt(<%=res.getString("fare")%>)*parseInt(abc.value)" required="required">
Rs <%=res.getString("fare")%>*
    <select id="abc" name="y">
<option>0</option>
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>6</option>
<option>7</option>

</select>
Total Fare: Rs <output name="x" for="a b" required="required"></output>

</b>
</td></tr>
<tr>
<td colspan="2">
          <div class="col-50" >
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label><br>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card*</label><br>
            <input type="text"  name="cardname" placeholder="eg.rakesh"required="required">
          <br>  <label for="ccnum">Credit card number*</label><br>
            <input type="text"  name="cardnumber" placeholder="eg.1111-2222-3333-4444"required="required">
           <br> <label for="expmonth">Exp Month*</label><br>
            <input type="text"  name="expmonth" placeholder="eg.September"required="required">

              </br>  <label for="expyear">Exp Year*</label></br>
                <input type="text" name="expyear" placeholder="eg.2022"required="required">
            
              </br>  <label for="cvv">CVV*</label></br>
                <input type="text" name="cvv" placeholder="eg.352"required="required">
          </div>
</td>
 <td colspan="3">
<div class="col-50">
            <h3>Passenger Details</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name*</label></br>
            <input type="text" id="fname" name="firstname" placeholder="eg.talari ramesh" required="required"></br>
            <label for="email"><i class="fa fa-envelope"></i> Email*</label></br>
            <input type="text" id="email" name="email" placeholder="eg.abc@example.com" required="required"></br>
            <label for="adr"><i class="fa fa-address-card-o"></i> Phone No.*</label></br>
            <input type="text" id="adr" name="phone" placeholder="eg.1234567890" required="required"></br>
            <label for="city"><i class="fa fa-institution"></i> City</label></br>
            <input type="text" id="city" name="city" placeholder="eg.bangalore" required="required"></br>
         </div>
</td>
    <tr>
    <td colspan="5" align="center">
   
    <input type="hidden" name="busNo" value=<%=res.getString("busNo")%>>
    <input type="hidden" name="busName" value=<%=res.getString("busName")%>>
    <input type="hidden" name="cityFrom" value=<%=res.getString("cityFrom")%>>
    <input type="hidden" name="cityTo" value=<%=res.getString("cityTo")%>>
    <input type="hidden" name="timeFrom" value=<%=res.getString("timeTo")%>>
    <input type="hidden" name="fare" value=<%=res.getString("fare")%>>
    <input type="hidden" name="type" value=<%=res.getString("type")%>>
    
    <input type="submit" value ="BOOK">
</td>
    </tr></table></form>
        <%
        
        
}}
catch(Exception e){
	e.printStackTrace();
}

%>
 
</div>
</body>
</html>
 <%@ include file="footer.jsp" %>