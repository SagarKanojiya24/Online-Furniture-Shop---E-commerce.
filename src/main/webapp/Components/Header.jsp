<%-- 
    Document   : Header
    Created on : Nov 5, 2023, 3:29:07?PM
    Author     : lenovo
--%>
<%@page import="com.mycompany.onlinefurnitureshop.Entitys.User"%>
<%-- "User User1" because i am already use "User user " in Admin.jsp page . beacuse  header.jsp  include in admin page --%>
<%

    User user1 = (User) session.getAttribute("current-user");


%>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div  class="container">
        <a class="navbar-brand" href="index.jsp">Online Furniture Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="About.jsp"> About <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="Contact.jsp"> Contact <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </li>





            </ul>
            <ul class="navbar-nav ml-auto">
                <%-- --%>
                <%    
                    if (user1 == null) {
                %>
                <li class="nav-item active">
                    <!-- this is for cart  this related cdn of bootstrap added  -->
                    <!-- here  " data-toggle="modal" data-target="#cart" this is use for "show page" after click -->
                    <!--  "cart-item" class  use in "Scripts.js"  for cart-->
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"> <i class="bi bi-cart4 " style="font-size: 20px;"></i> <span class="ml-0  cart-items" style="font-size: 15px;" > (0)</span> </a>
                </li>

                <%
                } else {
                    if (user1.getUserType().equals("normal")) {
                %>
                <li class="nav-item active">
                    <!-- this is for cart  this related cdn of bootstrap added  -->
                    <!-- here  " data-toggle="modal" data-target="#cart" this is use for "show page" after click -->
                    <!--  "cart-item" class  use in "Scripts.js"  for cart-->
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"> <i class="bi bi-cart4 " style="font-size: 20px;"></i> <span class="ml-0  cart-items" style="font-size: 15px;" > (0)</span> </a>
                </li>
                <%
                        }

                    }


                %>




                <%                    
                    if (user1 == null) {

                %>

                <li class="nav-item active">
                    <a class="nav-link" href="Login.jsp">Login </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="Register.jsp">Register</a>
                </li>

                <%                
                    } else {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href=" <%=user1.getUserType().equals("admin") ? "Admin.jsp" : "Normal.jsp"%>"><%= user1.getUserName()%> </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>

                <%

                    }
                %>




            </ul>
        </div>
    </div>
</nav>