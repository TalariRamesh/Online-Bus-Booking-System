<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}


input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}
hr {
  border: 1px solid lightgrey;
}


</style>
</head>
<body>
      <form>
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="firstname" placeholder="eg.Amit Singh">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="eg.abc@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder="eg.Meerut Uttar Pradesh">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder="eg.Noida">

                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="eg.Delhi">
           
                <label for="zip">Pin</label>
                <input type="text" id="zip" name="pin" placeholder="eg.210001">
              </div>
           

       
</body>
</html>