<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
*{
margin:0;
padding:0;
box-sizing:border-box;
}
.label{
color:black;
}
#abc{
  border-radius: 5px;
  width: 250px;
  height: 40px;
  font-size:16px;  
}
input[type=submit]:hover {
  background-color: #094A04;
}
input[type=submit] {
  width: 50%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin:0 8px;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  font-size:18px;
  }


 
.bg-img {
width: 100%;
  height: 90.5vh;
  border: 1px solid black;
  /* The image used */
  background-image: url("image/busbg86.jpeg");
  min-height:630px;
  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size:cover;
}

/* Add styles to the form container */
.contain {
  display:flex;
  justify-content:center;
  align-items:center;
  height:90vh;
}
[type="date"] {
  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
}
[type="date"]::-webkit-inner-spin-button {
  display: none;
}
[type="date"]::-webkit-calendar-picker-indicator {
  opacity: 0;
}
h2{
padding:20px;
background-color:lightyellow;
border-radius:10px;
}
</Style>
</head>
<body>
<div class="bg-img">
 <form action="BusList.jsp" class="contain">
<h2><lable class="label">From</lable><br><select id="abc" name=cityFrom required="required">

<option>Select city</option>
<option>Bengalore</option>
<option>Kurnool</option>
<option>Hyderabad</option>
<option>Vijayawada</option>
<option>Kadapa</option>
<option>Guntur</option>
<option>Nandyal</option>

</select><br>
<label class="label">To</label><br>
<select id="abc" name=cityTo required="required">

<option>Select city</option>
<option>Bengalore</option>
<option>Kurnool</option>
<option>Hyderabad</option>
<option>Vijayawada</option>
<option>Kadapa</option>
<option>Guntur</option>
<option>Nandyal</option>

</select><br>
<label for="dateofjourney" class="label">Date   of Journey</label><br>
<input type="date" id="abc" name=dateofjourney id="dateofjourney" required="required"><br>
  <lable class="label">Bus Type</lable><br>
  <input class="w3-radio" type="radio" name="type" value="luxury" >Luxury
  <input class="w3-radio" type="radio" name="type" value="ac">AC
  <input class="w3-radio" type="radio" name="type" value="non ac">Non AC
<br></br>
<input type="submit"value="Search Bus"></h2></form></div>

</body>
</html>
 <%@ include file="footer.jsp" %>