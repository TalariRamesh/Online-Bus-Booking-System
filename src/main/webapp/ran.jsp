<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%
Random rand = new Random();
int n = rand.nextInt(9000) + 1000;
System.out.println(n);
%>
<html>
    <body>
        ORDER NO  <input type="text" name="order" value="<%=n%>">
    </body>
</html>