package com.mycompany.onlinefurnitureshop.Servlets;

import com.mycompany.onlinefurnitureshop.Dao.CategoryDao;
import com.mycompany.onlinefurnitureshop.Dao.ProductDao;
import com.mycompany.onlinefurnitureshop.Entitys.Category;
import com.mycompany.onlinefurnitureshop.Entitys.Product;
import com.mycompany.onlinefurnitureshop.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author lenovo
 */
//@MultipartConfig this is use for taking input audio,video and image then we use from form  
@MultipartConfig
public class AddCategoryAndProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // this is servlet for add product and category both form
            //add product
            // add category
            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {
                //add category
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                //category database save using hibernate
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                // "saveCategory(category) method" coming from "CategoryDao.java"
                int catId = categoryDao.saveCategory(category);
                //out.println("Category Saved");
                // here creating httpsession for display  on top for your data is saved
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("m1", "Category Added Successfuly" + catId);
                response.sendRedirect("Admin.jsp");
                return;

            } else if (op.trim().equals("addproduct")) {
                // add product
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                // this is for photo . this is use for file fatching using "Part type"
                Part part = request.getPart("pPhoto");
                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
             

                // get category by Id of particular Id all  detyails
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                //  catId coming from int catId= Integer.parseInt(  request.getParameter("catId"))
                Category category = cdao.getCategoryById(catId);
                p.setCategory(category);
             

                //product saves.. this is mention in "ProductDao.class"
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                
                 //photo upload
                 // find out the  path to upload photo and "pPhoto.getSubmittedFileName()" this cxome from Part type object
                 String path=request.getRealPath("Images") + File.separator + "Products" + File.separator + part.getSubmittedFileName();
                 
                 try {
                    
                   
                 
                 // uploading code  and it is use for save photo in "ProductImage" file
                 FileOutputStream fos=new  FileOutputStream (path);
                 
                 // read data  using "part .it is object above mention"
                 InputStream is = part.getInputStream();
                 
                 // reading data
                 byte[]data=new byte[is.available()];
                 is.read(data);
                 
                 
                 
                 // writing the data
                 fos.write(data);
                 fos.close();
                 } catch (Exception e) {
                     e.printStackTrace();
                     
                }
                  
               
                 
                         
                 
                 
                 
                
                out.println("Product save Successful");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("m1", "Product Added Successfuly");
                response.sendRedirect("Admin.jsp");
                return;

            }

        }

    }

    public AddCategoryAndProductOperationServlet() {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
