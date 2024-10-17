<%-- 
    Document   : Register
    Created on : Nov 9, 2023, 12:39:02 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
        <%@include file="Components/Common_CSS_JavaScript.jsp" %>
        
         <style>
        body {
            /* Set background image */
            background-image: url('Images/BIFAP.JPG'); /* Replace with the actual path to your image */
            background-size: cover; /* Adjust the background size as needed */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; /* Prevent the background image from repeating */
         background-attachment: fixed; /*    Fix the background image */
            
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

        <div class="container-fluid  ">

            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card    form_Color_background">
                        <!<!--  here including link for register message successful page -->
                        <%@include file="Components/Messages.jsp" %>

                        <div class="card-body px-5">
                            <div class=" text-center "> <img src="Images/RegisterImage.jpg" alt="register image" width="150" height="150"></div>
                            <div class="custom-bg">
                                <h3 class="text-center my-3"> Sign up here ! !</h3>
                            </div>

                            <form action="RegisterServlet" method="post" >
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter name" pattern="[a-zA-Z._%+\- ]+" minlength="3" maxlength="15" title="Please enter name only in letter and letter only between 3 to 15  " required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    
                                    <input class="form-control" name="user_email" type="email" id="email" name="email" placeholder="Enter Email like: abc11@gmail.com"  pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"    title="Please enter your Email :abc11@gmail.com" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="user_password"  type="password" class="form-control" id="password" placeholder="Enter Password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input name="user_phone" type="text" class="form-control" id="phone" placeholder="Enter Phone number" maxlength="10" pattern="[0-9]{10}" title="Please enter a 10-digit mobile number and only 'Number'" required="true">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <textarea name="user_address" style="height: 150px" class="form-control" id="address" placeholder="Enter Address" title="Please enter  address here" required ></textarea>
                                </div>
                                <a href="Login.jsp" class=" text-center d-block mb-3"> if you already registered click here for Login </a>

                                <div class="container text-center">
                                    <button class="btn btn-primary custom-bg">Register</button>
                                    <button class="btn btn-primary custom-bg">Reset</button>
                                </div>
                            </form>


                        </div>

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
