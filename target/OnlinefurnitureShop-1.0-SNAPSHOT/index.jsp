<%-- 
    Document   : index
    Created on : Nov 8, 2023, 10:24:03 PM
    Author     : lenovo
--%>

<%@page import="com.mycompany.onlinefurnitureshop.helper.Helper"%>
<%@page import="com.mycompany.onlinefurnitureshop.Entitys.Category"%>
<%@page import="com.mycompany.onlinefurnitureshop.Dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.onlinefurnitureshop.Entitys.Product"%>
<%@page import="com.mycompany.onlinefurnitureshop.Dao.ProductDao"%>
<%@page import="com.mycompany.onlinefurnitureshop.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
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

        <div class="container-fluid">
            <div class="row mt-3 mx-2">


                <!-- this is from "ProductDao.java" for call  this method"getAllProducts()" -->
                <!-- this is from "CatogoryDao.java" for call  this method"getCategories()" -->
                <%                    // this is coming from index.jsp?category matlab "category" 
                    //<a href="index.jsp?category from below (c.getCategoryId()) " from here "category is coming"
                    String cat = request.getParameter("c1");
                    //out.println(cat);

                    //  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    // List<Category> clist = cdao.getCategories();
                    //ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    //List<Product> plist = pdao.getAllProducts();
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> plist = null;
                    if (cat == null) {
                        plist = pdao.getAllProducts();
                    } else if (cat.trim().equals("all")) {
                        plist = pdao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        //"getAllProductsById(cid) method" come from "CategoryDao.java"
                        plist = pdao.getAllProductsById(cid);
                    }


                %>


                <!-- Show Categories -->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <!-- 
                        this vimp line  and this line is use above " here  Sif(cat.trim().equals("all"))
                    {
                        plist = pdao.getAllProducts();
                    
                    }" 
                        -->
                        <a href="index.jsp?c1=all" class="list-group-item list-group-item-action active">
                            ALL Products
                        </a>
                        <!-- here adding category  -->
                    </div>
                    <%                        for (Category c : clist) {

                    %>
                    <!-- this vimp line  and this line is use above " here  String cat=request.getParameter("category");" -->
                    <a href="index.jsp?c1=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action  btn btn-outline-primary">  <%=c.getCategoryTitle()%> </a>


                    <%

                        }
                    %>

                </div>

                <!-- show products   -->
                <div class="col-md-10">

                    <div class=" row mt-4">
                        <div class="col-md-12">
                            <!-- travessing products  -->
                            <div class="card-columns">
                                <%
                                    for (Product p : plist) {

                                %>
                                <!-- Product cards and "product-card " class of css coming from "Style.css"  -->
                                <div class="card  product-card">
                                    <div class="container text-center">
                                        <!--  here we take photo .where photo is stored path -->
                                        <img src="Images/Products/<%=p.getpPhoto()%>"  style="max-height: 200px;max-width: 100%; width: auto;" class="card-img-top m-2" alt=" product_image">
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title"><%=p.getpName()%> </h5>
                                        <p class="card-text">
                                            <!-- here i am using "Helper class ka get10Words method for short description " -->
                                            <%=Helper.get10Words(p.getpDesc())%>
                                        </p>

                                    </div>
                                    <div class="footer text-center">
                                        <button class="btn text-white custom-bg" onclick="add_to_card(<%= p.getpId()%>, '<%=p.getpName()%>', <%=p.getPriceAfterApplyDiscount()%>)" > Add to Cart</button>
                                        <!-- here style css "discount-label" create in style.css .
                                         "p.getPriceAfterApplyDiscount()" this coming from "Product.java"
                                        
                                        -->
                                        <button class="btn  btn-outline-primary  ">&#8377; <%= p.getPriceAfterApplyDiscount()%> /- <span class=" text-secondary discount-label"> &#8377; <%=p.getpPrice()%> , <%=p.getpDiscount()%> % off</span> </button>


                                    </div>


                                </div>

                                <%}
                                    // this is use when 
                                    if (plist.size() == 0) {
                                        out.println(" No data found");
                                    }

                                %>

                            </div>


                        </div>
                    </div>




                </div>
            </div>
        </div>

        <%--
         // this is  for footer page   
        
        <div class="row">
            <div class="col-12"> 
                
            
            </div>                  
        </div>
        --%>

        <!-- Creating Session factory Object -->

        <%            // out.println(FactoryProvider.getFactory());
%>





    </body>
</html>
