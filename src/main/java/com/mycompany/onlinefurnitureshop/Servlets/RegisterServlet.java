package com.mycompany.onlinefurnitureshop.Servlets;

import com.mycompany.onlinefurnitureshop.Entitys.User;
import com.mycompany.onlinefurnitureshop.helper.FactoryProvider;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author lenovo
 */
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            try {

                String userName = request.getParameter("user_name");
                String userEmaail = request.getParameter("user_email");
                String userPasssword = request.getParameter("user_password");
                String userPhone = request.getParameter("user_phone");
                String userAddress = request.getParameter("user_address");

                //validation for values
                if (userName.isEmpty()) {
                    out.println("Name is Empty");
                    return;
                }

                // creating User.java  object to store data
                User user = new User(userName, userEmaail, userPasssword, userPhone, "default.jpg", userAddress, "normal");
                Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction tx = hibernateSession.beginTransaction();

                int userId = (int) hibernateSession.save(user);
                tx.commit();
                hibernateSession.close();

                // HttpSession is use for message store for sometime(kuchh der ke liye) when you are not remove
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("m1", " Registration Successful !!<br/> User Name is " + userName + "<br/> User Id is " + userId);
                // this is use for send you to some page after registration index.jsp, Login.jsp, register.jsp here i am sending to registration.jsp Again
                response.sendRedirect("Register.jsp");
                return;

            } catch (Exception e) {
                // print error on console
                e.printStackTrace();
            }

        }
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
