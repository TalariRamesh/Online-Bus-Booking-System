<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="style.viewTicket.css">
</head>
<body>

<div class="bg-img">
<%
HttpSession session3=request.getSession();

String uemail1=(String)session3.getAttribute("uemail");
%>
 


<%
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
	 PreparedStatement ps=con.prepareStatement("select * from ticket where email=?");
	 ps.setString(1,uemail1);
	 ResultSet res=ps.executeQuery();
	 while(res.next()){
 %>
 <table bgcolor="lightgray">
<tr>
<th class="b1"></th>
<th class="b2"></th>
<th class="b3"></th>
<th class="b4"></th>
<th class="b5"></th>
</tr>
<tr>
<td ><img src="image/ok.png" alt="Booked" width="80" height="80"></td>

<td ><b><%=res.getString("busNo")%>.<%=res.getString("busName")%></b></br><%=res.getString("dateofjourney")%>
</td>
<td><%=res.getString("cityFrom")%>==><%=res.getString("cityTo")%></td>
<td><form action="Ticket.jsp" method="GET">   
 <input type="hidden" name="id" value=<%=res.getString("ticket_id")%>>
 <input id="view" type="submit" value ="View Ticket"></form></td>

<td><form action="cancel" method="POST">   
 <input type="hidden" name="id" value=<%=res.getString("ticket_id")%>>
<input id="cancel" type="Submit" value ="Cancel Ticket"></form></td>

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
<%@ include file="footer.jsp" %>