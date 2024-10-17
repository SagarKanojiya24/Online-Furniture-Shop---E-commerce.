<%-- 
    Document   : Login
    Created on : Nov 9, 2023, 12:39:15 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login </title>
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
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white text-center">

                            <h3> Login Here </h3>
                        </div>
                        <div class="card-body">
                            <!--   this include for message unique on top -->
                            <%@include file="Components/Messages.jsp" %>
                            <form action="LoginServlet" method="post" class="form_Color_background">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="Email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"  placeholder="Enter Email like: abc11@gmail.com"  pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"    title="Please enter your Email :abc11@gmail.com" required>

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="Password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                                </div>
                                <!-- here text-center and d-block use for center link -->
                                <a href="Register.jsp" class=" text-center d-block mb-3"> if not registered click here </a>
                                <div class="container text-center" >
                                    <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                                    <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
                                </div>


                            </form>


                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>  

</body>
</html>
