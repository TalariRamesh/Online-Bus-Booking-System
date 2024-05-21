<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html> 
  <head> 
    <style>
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
      }

      #iframe-container {
        width: 100%;
        height: 100vh; /* Adjust as needed */
        background-color: lightblue;
      }

      iframe {
        width: 100%;
        height: 100%;
        border: none;
      }
    </style>
  </head>

  <body>
    <div id="iframe-container">
      <div>
        <iframe src="helf2.html"></iframe>
      </div>
    </div>
  </body>
</html>
