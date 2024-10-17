<%-- 
    Document   : Contact
    Created on : Dec 2, 2023, 10:21:51 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <!-- include Components/Common_CSS_javaScript.jsp or css and javascript bootstrap CDN file for bootstrap_ -->
        <%@include file="Components/Common_CSS_JavaScript.jsp" %>
        
         <style>
        body {
            /* Set background image */
            background-image: url('Images/BIFAP.JPG'); /* Replace with the actual path to your image */
            background-size: cover; /* Adjust the background size as needed */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; /* Prevent the background image from repeating */
            background-attachment: fixed; /* Fix the background image */
            
            /* Additional styles */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
            height: 100vh; /* Set the height to 100% of the viewport height */
            font-family: 'Arial', sans-serif; /* Set a default font family */
        }
        </style>

    </head>
    <body >
         <%@include file="Components/Header.jsp" %>
        <!-- this is related link for "cart icon" -->
        <%@include file="Components/common_modals.jsp"%>
        
       
  <div class="contact-info   form_Color_background">
    <h2>Contact Us</h2>
    <p>Email: <a href="mailto:kanojiyas049@gmail.com">contact@example.com</a></p>
    <p>Phone: <a href="tel:8356089694">8356089694</a></p>
    <p>Address: Lalji pada  kandivali (West)  Opposite: Hanuman Mandir,  Street Name: link Road,   City: Mumbai,    Country: India 
        State: Maharashtra Pin:400064 </p>
  </div>
        
    </body>
</html>
