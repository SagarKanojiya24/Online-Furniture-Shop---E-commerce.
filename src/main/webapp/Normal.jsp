<!-- this this  Protecting Normal.jsp page . No anyother user can access . Normal only  availlable to access only -->


    
<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("m1", "You are not logged in !!  Login first");
        response.sendRedirect("Login.jsp");
        return;

    } else {
        if (user.getUserType().equals("admin")) {
            session.setAttribute("m1", "You are not Normal User ! Do not Access this page");
            response.sendRedirect("Login.jsp");
            return;

        }

    }


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal Panel</title>
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
        <%@include file="Components/common_modals.jsp"%>
        <h1> This is normal user panel</h1>
    </body>
</html>
