<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@include file="header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Record</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 70px auto 20px; /* Center align the container */
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            height:auto;
        }
        h2 {
            margin-top: 0;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"] {
            width: 100%; /* Adjusted width */
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a.button {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-radius: 4px;
            cursor: pointer;
        }
        a.button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            Connection con = null;
            PreparedStatement ps = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company", "root", "root");

                // Get the record ID from the URL parameter
                String id=request.getParameter("id");

                // Retrieve the record from the database based on the ID
                String query = "SELECT * FROM buslist WHERE busNo = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery();

                // Display form to edit the record
                if (rs.next()) {
        %>
        <h2>Edit Record</h2>
        <form action="UpdateRecord.jsp" method="post">
            <!-- Include input fields to edit the record -->
            <input type="hidden" id="busNo" name="busNo" value="<%= rs.getString("busNo") %>"><br>
            
            <label for="busName">Bus Name:</label>
            <input type="text" id="busName" name="busName" value="<%= rs.getString("busName") %>"><br>
            
            <label for="cityFrom">City From:</label>
            <input type="text" id="cityFrom" name="cityFrom" value="<%= rs.getString("cityFrom") %>"><br>
            
            <label for="cityTo">City To:</label>
            <input type="text" id="cityTo" name="cityTo" value="<%= rs.getString("cityTo") %>"><br>
            
            <label for="timeFrom">Time From:</label>
            <input type="text" id="timeFrom" name="timeFrom" value="<%= rs.getString("timeFrom") %>"><br>
            
            <label for="timeTo">Time To:</label>
            <input type="text" id="timeTo" name="timeTo" value="<%= rs.getString("timeTo") %>"><br>
            
            <label for="fare">Fare:</label>
            <input type="text" id="fare" name="fare" value="<%= rs.getString("fare") %>"><br>
            
            <label for="type">Type:</label>
            <input type="text" id="type" name="type" value="<%= rs.getString("type") %>"><br>
            
            
            <input type="submit" value="Update">
        </form>
        <%
                } else {
                    out.println("Record not found!");
                }
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources
                try {
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</body>
</html>
