<%-- 
    Document   : Admin
    Created on : Nov 12, 2023, 2:56:37 PM
    Author     : lenovo
--%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.onlinefurnitureshop.helper.Helper"%>
<%@page import="com.mycompany.onlinefurnitureshop.Entitys.Category"%>
<%@page import="java.util.List"%>

<%@page import="com.mycompany.onlinefurnitureshop.helper.FactoryProvider"%>
<%@page import="com.mycompany.onlinefurnitureshop.Dao.CategoryDao"%>
<!-- this this  Protecting Admin.jsp page . No anyother user can access . admin only  availlable to access only -->


<%
    User user = (User) session.getAttribute("current-user");
   

    if (user == null) {
        session.setAttribute("m1", "You are not logged in !!  Login first");
        response.sendRedirect("Login.jsp");
        return;

    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("m1", "You are not admin ! Do not Access this page");
            response.sendRedirect("Login.jsp");
            return;

        }

    }
   


%>

<!-- this is use in  here to show "size of user, categories and products"  and also use "show categories in adsmin.jsp page" -->
<%
    CategoryDao cDao2 = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list2 = cDao2.getCategories();
    

// getting count by "getCounts() method" this method is mention in "Helper.java" file . here we  are using for count " User and Product"
Map<String,Long> m=   Helper.getCounts(FactoryProvider.getFactory());

%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
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

        <div class="container admin ">
            <div class="container-fluid mt-3">
                <%@include file="Components/Messages.jsp" %>

            </div>

            <%-- this is first row 1 , diving row in 3 part using "col-md-4" class of bootstrap   --%>
            <div class="row mt-3 ">
                <div class="col-md-4">  
                    <div class="card   form_Color_background">
                        <div class="container text-center">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="Images/User_Icon.png" alt="User_icon"/>

                        </div>

                        <div class="card-body text-center  ">
                            <h1><%=m.get("userCount")  %></h1>
                            <h1 class="text-uppercase text-muted"> Users</h1>

                        </div>

                    </div>

                </div>
                <div class="col-md-4">  
                    <div class="card   form_Color_background">
                        <div class="container text-center">
                            <img style="max-width: 125px" class="img-fluid " src="Images/Categories_Icon.png" alt="User_icon"/>

                        </div>

                        <div class="card-body text-center ">
                            <!<!-- categories object created above for categories related  use s-->
                            <h1> <%= list2.size() %></h1>
                            <h1 class="text-uppercase text-muted"> Categories </h1>

                        </div>

                    </div>


                </div>
                <div class="col-md-4">  
                    <div class="card   form_Color_background">
                        <div class="container text-center">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="Images/Product_Icon.png" alt="User_icon"/>

                        </div>

                        <div class="card-body  text-center ">
                            <h1><%=m.get("productCount")  %></h1>
                            <h1 class="text-uppercase text-muted"> Products </h1>

                        </div>

                    </div>


                </div>


            </div>
            <%-- this is second row 2 , diving row in 2 part using "col-md-6" class of bootstrap   --%>
            <div class="row">
                <div class="col-md-6">  
                    <!--  adding modal for category when click some page open of category "data-toggle="modal" data-target="#add-category-modal"" --> 
                    <div class="card   form_Color_background" data-toggle="modal" data-target="#add-category-modal">
                        <div class="container text-center">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="Images/Add_Categories.png" alt="User_icon"/>

                        </div>

                        <div class="card-body text-center">
                            <p class="mt-2"> Click here to add new category</p>
                            <h1 class=" text-uppercase text-muted"> Add Category</h1>

                        </div>

                    </div>

                </div>
                <div class="col-md-6"> 
                    <!--  adding modal for product when click some page open of product "data-toggle="modal" data-target="#add-product-modal"" --> 
                    <div class="card    form_Color_background"  data-toggle="modal" data-target="#add-product-modal">
                        <div class="container text-center">
                            <img style="max-width: 125px" class="img-fluid rounded-circle" src="Images/Add_Product.png" alt="User_icon"/>

                        </div>

                        <div class="card-body text-center ">
                            <p class="mt-2"> Click here to add new Product</p>
                            <h1 class=" text-uppercase text-muted"> Add Product </h1>

                        </div>

                    </div>


                </div>



            </div>


        </div>
            
          
            

        <!-- Start add category modal -->

        <!-- Modal -->
        <!-- remember this line for addcategory  -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel"> Fill Category Detail</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    <div class="modal-body   form_Color_background">
                        <form action="AddCategoryAndProductOperationServlet" method="post" >
                            <!-- this is very imp line for "addcategory"  -->
                            <input type="hidden" name="operation" value="addcategory"/>
                            <div class=" form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />


                            </div>

                            <div class=" form-group">
                                <textarea style="height: 300px" class="form-control" name="catDescription" placeholder="Enter category description" required ></textarea>


                            </div>

                            <div class="container text-center ">
                                <button class=" btn btn-primary custom-bg "> Add Category</button>
                                <button type="button" class="btn btn-primary custom-bg" data-dismiss="modal">Close</button>

                            </div>

                        </form> 

                    </div>
                </div>
            </div>
        </div>


        <!-- End add category modal -->

        <!<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

        <!-- Start add Product modal -->

        <!-- Modal -->
        <!-- remember this line for addproduct  -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel"> Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    <div class="modal-body    form_Color_background">
                        <!-- here we use "enctype="multipart/form-data"  for i am sending (image or audio and video this is use then we use this.) in database using servlet-->
                        <form action="AddCategoryAndProductOperationServlet" method="post"  enctype="multipart/form-data">
                            <!-- this is very imp line for "addproduct"  " type="hidden" " is because we don't show input line on form-->
                            <input type="hidden" name="operation" value="addproduct"/>
                            <div class=" form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter Product title" required />


                            </div>

                            <div class=" form-group">
                                <textarea style="height: 100px" class="form-control" name="pDesc" placeholder="Enter Product description" required ></textarea>


                            </div>

                            <div class=" form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter price of Product" required />


                            </div>

                            <div class=" form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product discount" required />


                            </div>

                            <div class=" form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required />


                            </div>
                            <!-- product category . this is imp line in product form page "some details are in CategoryDao.java" used -->
                            <%
                                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cDao.getCategories();

                            %>


                            <div class=" form-group">
                                <label for="CategoryType"> Select Category type of Product</label><br>
                                <select name="catId" class="form-control" id="CategoryType">
                                    <%                                        
                                        for (Category c : list) {

                                    %>
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

                                    <%
                                        }

                                    %>



                                </select>

                            </div>
                            <!-- this image input for select image and store product in database -->
                            <div class=" form-group">
                                <label for="pPhoto"> Select Photo of Product</label><br>
                                <input type="file" class="form-control" name="pPhoto" id="pPhoto"  required />


                            </div>



                            <div class="container text-center ">
                                <button class=" btn btn-primary custom-bg "> Add Product</button>
                                <button type="button" class="btn btn-primary custom-bg" data-dismiss="modal">Close</button>

                            </div>

                        </form> 

                    </div>
                </div>
            </div>
        </div>


        <!-- End add Product modal -->




    </body>
</html>

