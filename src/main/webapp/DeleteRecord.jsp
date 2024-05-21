<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Record</title>
</head>
<body>
    <%
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company", "root", "root");

            // Get the record ID from the URL parameter
           String id=request.getParameter("id");

            // Delete the record from the database based on the ID
            String query = "DELETE FROM buslist WHERE busNo = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            int rowsAffected = ps.executeUpdate();

            // Display message after deletion
            if (rowsAffected > 0) {
    %>
     <script>
        alert("Bus deleted successfully!");
        window.location.href = "ManageBus.jsp";
    </script>
    <%
            } else {
                out.println("Failed to delete record!");
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
