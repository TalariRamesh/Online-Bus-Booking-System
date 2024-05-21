<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 

<style>

.col-50 {
  padding: 0 40px;
}
input[type=text] {
  width: 100px;
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
          <div class="col-50" >
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label><br>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label><br>
            <input type="text"  name="cardname" placeholder="eg.Amit singh"required="required">
          <br>  <label for="ccnum">Credit card number</label><br>
            <input type="text"  name="cardnumber" placeholder="eg.1111-2222-3333-4444"required="required">
           <br> <label for="expmonth">Exp Month</label><br>
            <input type="text"  name="expmonth" placeholder="eg.September"required="required">

                <label for="expyear">Exp Year</label><br>
                <input type="text" name="expyear" placeholder="eg.2022"required="required">
            
                <label for="cvv">CVV</label><br>
                <input type="text" name="cvv" placeholder="eg.352"required="required">
          </div>        
       </body>
</html>