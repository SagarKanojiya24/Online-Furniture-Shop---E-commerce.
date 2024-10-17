<%-- 
    Document   : About
    Created on : Nov 8, 2023, 9:22:50 PM
    Author     : lenovo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>About Us</title>


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
    <body>

        <%@include file="Components/Header.jsp" %>
        <!-- this is related link for "cart icon" -->
        <%@include file="Components/common_modals.jsp"%>
       
        
<header>
        <h1>About Us</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="About.jsp">About</a></li>
                <li><a href="Contact.jsp">Contact</a></li>
            </ul>
        </nav>
    </header>

    <section>
        <h2>Our Story</h2>
        <p>Welcome to our about page! Here, This is Furniture Website.</p>
        <p> My Name is Sagar Kanojiya</p>
    </section>

    

    <footer>
        <p>&copy; 2023 Company Sagar Kanojiya. All rights reserved.</p>
    </footer>
    </body>
</html>
