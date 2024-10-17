
// this is use  for cart add 
function add_to_card(pid, pname, price)
{
        let cart = localStorage.getItem("cart");
        if (cart == null)
        {
        //no cart yet
        let products = [];
                let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
        products.push(product);
                //" JSON.stringify() " is use to convert "array" to "String" beacuse "localStorage.setItem();" "key and value" take only String
                localStorage.setItem("cart", JSON.stringify(products));
                console.log(" Product is added for the First time");
                
                /* this is related "Toast Message" this "related file" is  "Style.css ,Script.js and Common_modals.jsp" */
                showToast("Item is added to cart")
        } else
        {
        // cart is arleady present
        let pcart = JSON.parse(cart);
                let oldProduct = pcart.find((item) => item.productId == pid)
                if (oldProduct)
        {
        //we have to create the quantity
        oldProduct.productQuantity = oldProduct.productQuantity + 1
                pcart.map((item) => {

                if (item.productId == oldProduct.productQuantity)
                {

                item.productQuantity = oldProduct.productQuantity;
                }
                })
                localStorage.setItem("cart", JSON.stringify(pcart));
                console.log("Product quantity is increased");
                
                 /* this is related "Toast Message" this "related file" is  "Style.css ,Script.js and Common_modals.jsp" */
                showToast( oldProduct.productName +" quantity is increased , Quantity=" + oldProduct.productQuantity)
        } else
        {
        //we have add the product
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
        pcart.push(product)
                localStorage.setItem("cart", JSON.stringify(pcart));
                console.log("Product is added");
                
                 /* this is related "Toast Message" this "related file" is  "Style.css ,Script.js and Common_modals.jsp" */
                showToast("Product is added to cart")
        }
        }
        
        updateCart();
}

               

        
        


//update cart
// this is use  for cart show on screen 
function updateCart()
{
let cartString = localStorage.getItem("cart");
        // here "cartString"  is converted into  "Object"  "let cart=JSON.parse(cartString);"
        let cart = JSON.parse(cartString);
        if (cart == null || cart.length == 0)
        {
            console.log("Cart is Empty");
            // this is "JQuery" for cart and this is ".cart-item" id name use  in "index.jsp"
            $(".cart-items").html("( 0 )");
            //".cart-body" "class ID"  use in ""common_modals.jsp  page for "cart"" 
            $(".cart-body").html("<h3> Cart does not have any items </h3> ");
            //".checkout-btn" "class ID"  use in ""common_modals.jsp  page for "cart"  " disabled the checkout button" 
            $(".checkout-btn").attr('disabled',true)
        }
        else
        {
            // there is show something in cart to show 
            console.log(cart);
            // this is use  for count number of cart
            $(".cart-items").html('(' + $(cart).length + ')');
          

               
            let  table = `
                <table class='table'>
                    <thead class='thead-light'>
                        <tr>
                            <th> Item Name</th>
                            <th> Price</th>
                            <th>  Quantity</th>
                            <th> Total Price</th>
                            <th> Action</th>

                        </tr>
                    </thead>
            `;

            let totalPrice =0;
            cart.map((item) => {
            table += `
                <tr> 
                    <td> ${item.productName}</td>
                    <td> ${item.productPrice}</td>
                    <td> ${item.productQuantity}</td>
                    <td> ${item.productQuantity * item.productPrice }</td>
            
                    <!-- here deleteItemFromCart({item.productId} ) use to remove cart from screen  --> 
                    <td><button onclick='deleteItemFromCart(${item.productId} )' class='btn btn-danger btn-sm'> Remove</button> </td>

                </tr>`
                totalPrice += item.productPrice * item.productQuantity;
            
            
            })
            


            table = table + `
            <tr><td colspan='5' class='text-right font-weight-bold m-5 '> Total Price: ${totalPrice} </td> </tr>
            </table>`
            
            $(".cart-body").html(table);
            // this is use "Enable Checkoutof cart"
             $(".checkout-btn").attr('disabled',false)
            
            
        }
}




// Delete/Remove item from cart  
function deleteItemFromCart(pid)
{
    let cart=JSON.parse(localStorage.getItem('cart'));
    let newcart=cart.filter((item)=>item.productId!=pid)
    localStorage.setItem('cart',JSON.stringify(newcart))
    
    // this is use for update cart after delete item
    updateCart();
    
    /* this is related "Toast Message" this "related file" is  "Style.css ,Script.js and Common_modals.jsp" */
    showToast(" Item is removed from  cart" )
    
    
}




// this is use for " when  document ready for  update card"

$(document).ready(function () {

    updateCart();
})



/* this is related "Toast Message" this "related file" is  "Style.css ,Script.js and Common_modals.jsp" */
function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(()=>{
        $("#toast").removeClass("display");
    },2000);  
}

// this is use for "checkout" in "common_modals.jsp" page
function goToCheckout(){
    window.location="Checkout.jsp"
}
        
