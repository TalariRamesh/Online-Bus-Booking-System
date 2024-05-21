<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>
<style>
.img{
length:200px;
width:200px;
}
.bgimg {
  /* The image used */
  background-image: url("image/buswall2.jpg");

  height: 85vh;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  display:flex;
  justify-content:center;
  flex-direction:column;`		
  
}
</style>
</head>
<body><div class="bgimg" align="center">
<%HttpSession session3=request.getSession();

 String email=(String)session3.getAttribute("uemail");
 %>
 <%
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
	 PreparedStatement ps=con.prepareStatement("select * from login where uemail=?");
	 ps.setString(1,email);
	 ResultSet res=ps.executeQuery();
	 while(res.next()){
		 
	 
 %>
  <div class="box">
    <style>
        .box {
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            width: 300px;
            margin: 0 auto;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 10px;
        }

        h3 {
            color: #666;
            font-size: 18px;
            margin-bottom: 5px;
        }
    </style>

    <h1><%=res.getString("uname")%></h1>
    <h3>Email: <%=uemail %></h3>
    <h3>Mobile: <%=res.getString("uphone")%></h3>
</div>

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