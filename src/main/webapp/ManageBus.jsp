<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@include file="header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Buses</title>

<style>
    table {
    margin-top:70px;
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #f5f5f5;
    }
</style>

</head>
<body>

<table border="1">
<tr>
  <th>Bus Number</th>
  <th>Bus Name</th>
  <th>City From</th>
  <th>City To</th>
  <th>Time From</th>
  <th>Time To</th>
  <th>Fare</th>
  <th>Type</th>
  <th>Actions</th>
</tr>
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet res = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company", "root", "root");
    ps = con.prepareStatement("SELECT * FROM buslist");
    res = ps.executeQuery();

    while(res.next()) { 
%> 
<tr>
  <td><%=res.getString("busNo") %></td>
  <td><%=res.getString("busName") %></td>
  <td><%=res.getString("cityFrom") %></td>
  <td><%=res.getString("cityTo") %></td>
  <td><%=res.getString("timeFrom") %></td>
  <td><%=res.getString("timeTo") %></td>
  <td><%=res.getString("fare") %></td>
  <td><%=res.getString("type") %></td>
  <td>
 <a href="EditRecord.jsp?id=<%=res.getString("busNo")%>">Edit</a>
 <a href="DeleteRecord.jsp?id=<%=res.getString("busNo")%>">Delete</a>
  </td>
</tr>
<% 
    }
} catch(Exception e) {
    e.printStackTrace();
} finally {
    // Close resources in finally block
    try {
        if (res != null) res.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
</table>

</body>
</html>
<%@include file="footer.jsp"%>