<%-- 
    Document   : Checkout
    Created on : Nov 30, 2023, 10:12:34 PM
    Author     : lenovo
--%>
<!-- this is use for "login first before chechout " without login you aare not availble to access "checkout page" -->
<%
    User user = (User) session.getAttribute("current-user");
   

    if (user == null) {
        session.setAttribute("m1", "You are not logged in !!  Login first to checkout pages");
        response.sendRedirect("Login.jsp");
        return;

    }

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Checkout</title>
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

    <%@include file="Components/Header.jsp" %>
    <!-- this is related link for "cart icon" -->
    <%@include file="Components/common_modals.jsp"%>

    <div class="container" >
        <div class="row">
            <div class="col-md-6">
                <!--  card -->
                <div class="card   form_Color_background">
                    <div class="card-body">
                        <!--  "cart-body" use in " common_modals.jsp" page to "set cart"
                        here this "cart-body" is use for get cart from " common_modals.jsp" page
                        -->
                        <h2 class="text-center mb-3 custom-bg"> Your selected items</h2>
                        <div class="cart-body">

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-6">
                <!--  form details -->
                <div class="card     form_Color_background">
                    <div class="card-body">
                        <!--  "cart-body" use in " common_modals.jsp" page to "set cart"
                        here this "cart-body" is use for get cart from " common_modals.jsp" page
                        -->
                        <h2 class="text-center mb-3  custom-bg"> Your details for order</h2>
                        <form>
                            <div class="form-group">
                                <label for="exampleInputEmail1"  >Email address</label>
                                <input placeholder=" Enter Email" value="<%=user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                            </div>
                            <div class="form-group">
                                <label for="name" > Your Name</label>
                                <input placeholder="Enter Name" value="<%=user.getUserName() %>" type="text" class="form-control" id="name" ">

                            </div>
                                
                                <div class="form-group">
                                <label for="name" > Your Contact</label>
                                <input placeholder=" Enter Contact Number" value="<%=user.getUserPhone() %>" type="text" class="form-control" id="name" ">

                            </div>
                                
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1"> Your shiping address</label>
                                <textarea value="<%=user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1"  placeholder=" Enter your address" rows="3"></textarea>
                            </div>
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-primary"> Order Now</button>
                                <button class="btn btn-outline-primary">     <a href="index.jsp">Continue Shopping </a> </button>
                                
                            </div>
                                


                        </form>

                    </div>

                </div>
            </div>

        </div>
    </div>



</html>
