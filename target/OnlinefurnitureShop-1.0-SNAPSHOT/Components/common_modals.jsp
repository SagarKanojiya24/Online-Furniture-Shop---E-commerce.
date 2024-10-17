<%-- 
    Document   : common_modals
    Created on : Nov 26, 2023, 12:32:39?AM
    Author     : lenovo
--%>



                <!-- Modal -->
                <!-- id="cart" this is use by "cart icon"  -->
                <div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header  custom-bg">
                                <h5 class="modal-title" id="exampleModalLabel"> Your Cart</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body   form_Color_background">
                                <div class="cart-body">


                                </div>

                            </div>
                            <div class="modal-footer   form_Color_background">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <!-- "checkout-btn" class in style.css use for  -->
                                <!<!--  "onclick= "goToCheckout()" this coiming from "Script.js" file  -->
                                <button type="button" class="btn btn-primary   checkout-btn" onclick= "goToCheckout()"> Checkout</a></button>
                            </div>
                        </div>
                    </div>
                </div>

           


                    <!-- this is related "Toast Message" this "related file" is  "Style.css ,Script.js and Common_modals.jsp"  -->
                    <div id="toast">THis is our custom Toast text </div>