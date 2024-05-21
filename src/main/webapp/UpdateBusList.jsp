<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Bus Lists</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .bg-img-ub{
        padding-top:70px;
        }
        .container-form{
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            display:flex;
        }

        label {
            
            font-weight: bold;
            width:30%;
        }

        input[type="text"],
        select {
            width: 70%;
            padding:10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
 </head>
<body>
 <% if (request.getAttribute("successMessage") != null) { %>
        <script>
            alert("<%= request.getAttribute("successMessage") %>");
        </script>
    <% } %>
    <section class="bg-img-ub">
        <form action="UpdateBusList" method="post" class="container-form">
            <h2>Update Bus Lists</h2>
            <div class="form-group">
                <label for="busNo">Bus Number:</label>
                <input type="text" id="busNo" name="busNo" placeholder="Enter Bus Number" required="required">
            </div>

            <div class="form-group">
                <label for="busName">Bus Name:</label>
                <input type="text" id="busName" name="busName" placeholder="Enter Bus Name" required="required">
            </div>

            <div class="form-group">
                <label for="cityFrom">Source City:</label>
                <select id="cityFrom" name="cityFrom" required="required">
                    <option value="">Select Source City</option>
                    <option value="Bengalore">Bengalore</option>
                    <option value="Kurnool">Kurnool</option>
                    <option value="Hyderabad">Hyderabad</option>
                    <option value="Vijayawada">Vijayawada</option>
                    <option value="Kadapa">Kadapa</option>
                    <option value="Guntur">Guntur</option>
                    <option value="Nandyal">Nandyal</option>
                </select>
            </div>

            <div class="form-group">
                <label for="cityTo">Destination City:</label>
                <select id="cityTo" name="cityTo" required="required">
                    <option value="">Select Destination City</option>
                    <option value="Bengalore">Bengalore</option>
                    <option value="Kurnool">Kurnool</option>
                    <option value="Hyderabad">Hyderabad</option>
                    <option value="Vijayawada">Vijayawada</option>
                    <option value="Kadapa">Kadapa</option>
                    <option value="Guntur">Guntur</option>
                    <option value="Nandyal">Nandyal</option>
                </select>
            </div>

            <div class="form-group">
                <label for="timeFrom">Reporting Time:</label>
                <input type="text" id="timeFrom" name="timeFrom" required="required" placeholder="hh:mm AM/PM" pattern="^(0[1-9]|1[0-2]):[0-5][0-9] (AM|PM)$">
            </div>

            <div class="form-group">
                <label for="timeTo">Departure Time:</label>
                <input type="text" id="timeTo" name="timeTo" required="required" placeholder="hh:mm AM/PM" pattern="^(0[1-9]|1[0-2]):[0-5][0-9] (AM|PM)$">
            </div>

            <div class="form-group">
                <label for="fare">Fare:</label>
                <input type="text" id="fare" name="fare" placeholder="Enter fare" required="required">
            </div>

            <div class="form-group">
                <label for="type">Type of Bus:</label>
                <select id="type" name="type" required="required">
                    <option value="">Select Bus Type</option>
                    <option value="Luxury">Luxury</option>
                    <option value="Ac">Ac</option>
                    <option value="Non AC">Non AC</option>
                </select>
            </div>

            <div class="form-group">
                <input type="submit" value="Update">
            </div>
        </form>
    </section>
</body>
</html>
<%@ include file="footer.jsp" %>
