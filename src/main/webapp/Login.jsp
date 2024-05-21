<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
    }
    .bg-img {
        margin: 0;
        background-image: url(image/busbg51.jpg);
        background-size: cover;
        background-position: center;
        min-height: 630px;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
    }
    .login-form {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
    }
    .login-form h3 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
        text-decoration: underline;
    }
    .login-form .form-group {
        margin-bottom: 20px;
    }
    .login-form label {
        font-weight: bold;
    }
    .login-form input[type="text"],
    .login-form input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .login-form input[type="submit"] {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: #007bff;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .login-form input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .login-form .error {
        color: #dc3545;
    }
    .login-form p {
        text-align: center;
        margin-top: 10px;
        font-size: 14px;
    }
    .error {
            color: red;
            font-size: 14px;
            margin-top: 5px; /* Add some space above the error message */
        }
    </style>
</head>
<body>
    <div class="bg-img">
        <div class="login-form">
            <form action="Login" method="post" onsubmit="return validation()">
                <h3>USER LOGIN</h3>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="error"><%= request.getAttribute("errorMessage") %></div>
                <% } %>
                <div class="form-group">
                    <label for="email"><i class="fa fa-user"></i> Email:</label>
                    <input id="email" type="text" name="uemail" placeholder="Enter Your Email">
                    <span id="uemail" class="error"></span>
                </div>
                <div class="form-group">
                    <label for="pass"><i class="fa fa-key"></i> Password:</label>
                    <input id="pass" type="password" name="upass" placeholder="Enter your Password">
                    <span id="upass" class="error"></span>
                </div>
                <input type="submit" value="Login">
                <p><a href="RegForm.jsp">New User? Sign up here!</a></p>
                <p><a href="forgot.jsp">Forgot Password?</a></p>
            </form>
        </div>
    </div>

    <script type="text/javascript">
        function validation() {
            var email = document.getElementById('email').value;
            var pass = document.getElementById('pass').value;

            if (email.trim() === "") {
                document.getElementById('uemail').innerHTML = "* Email cannot be empty";
                return false;
            }
            if (email.indexOf('@') <= 0) {
                document.getElementById('uemail').innerHTML = "* Invalid '@' position";
                return false;
            }
            if ((email.charAt(email.length - 4) !== '.') && (email.charAt(email.length - 3) !== '.')) {
                document.getElementById('uemail').innerHTML = "* Invalid '.' position";
                return false;
            }
            if (pass.trim() === "") {
                document.getElementById('upass').innerHTML = "* Password cannot be empty";
                return false;
            }
            if ((pass.length <= 4) || (pass.length > 15)) {
                document.getElementById('upass').innerHTML = "* Password must be 5 to 15 characters long";
                return false;
            }
        }
    </script>
</body>
</html>
<%@ include file="footer.jsp" %>
