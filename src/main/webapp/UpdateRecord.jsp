<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Record</title>
</head>
<body>
    <%
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company", "root", "root");

            // Retrieve form data
            
            String busNo = request.getParameter("busNo");
            String busName = request.getParameter("busName");
            String cityFrom = request.getParameter("cityFrom");
            String cityTo = request.getParameter("cityTo");
            String timeFrom = request.getParameter("timeFrom");
            String timeTo = request.getParameter("timeTo");
            double fare = Double.parseDouble(request.getParameter("fare"));
            String type = request.getParameter("type");

            // Update the record in the database
            String query = "UPDATE buslist SET busName=?, cityFrom=?, cityTo=?, timeFrom=?, timeTo=?, fare=?, type=? WHERE busNo=?";
            ps = con.prepareStatement(query);
           
            ps.setString(1, busName);
            ps.setString(2, cityFrom);
            ps.setString(3, cityTo);
            ps.setString(4, timeFrom);
            ps.setString(5, timeTo);
            ps.setDouble(6, fare);
            ps.setString(7, type);
            ps.setString(8, busNo);
            
            int rowsAffected = ps.executeUpdate();

            // Redirect to ManageBus.jsp after update
            if (rowsAffected > 0) {
    %>
    <script>
        alert("Bus Details updated successfully!");
        window.location.href = "ManageBus.jsp";
    </script>
    <%
            } else {
                out.println("Failed to update Bus Details!");
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
</body>
</html>
