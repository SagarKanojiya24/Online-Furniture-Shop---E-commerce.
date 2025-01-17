package com.mycompany.onlinefurnitureshop.Servlets;

import com.mycompany.onlinefurnitureshop.Dao.UserDao;
import com.mycompany.onlinefurnitureshop.Entitys.User;
import com.mycompany.onlinefurnitureshop.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String email = request.getParameter("Email");
            String password = request.getParameter("Password");

            //authenticating user
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(email, password);
            // this is use for console return value
            // System.out.println(user);
            HttpSession httpSession = request.getSession();

            if (user == null) {

                httpSession.setAttribute("m1", "Invalid Deatils !!  Try with another one");
                response.sendRedirect("Login.jsp");
                return;

            } else {
                out.println("<h1> Welcome  " + user.getUserName() + "</h1>");

                // login 
                httpSession.setAttribute("current-user", user);
                if (user.getUserType().equals("admin")) {
                    //admin : admin.jsp
                    response.sendRedirect("Admin.jsp");

                } else if (user.getUserType().equals("normal")) {
                    // normal : Normal.jsp
                    response.sendRedirect("Normal.jsp");

                } else {
                    out.println("We have not Identified user type");

                }

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
