/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import Entities.Category;
import Entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nguye
 */
public class UserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            boolean checkCreateUserExist = false;
            String action = request.getParameter("action");
            String welcome = (String) request.getAttribute("name");
            String displayView = "mainUserPage.jsp";
            String controllerServlet = "UserServlet?action=mainPage";

            ///go to mainPage for User
            if (action.equalsIgnoreCase("mainPage")) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    ArrayList<Category> listCate = new ArrayList<>();

                    UserDAO dao = new UserDAO();

                    request.setAttribute("data2", listCate);
                    request.setAttribute("hello", welcome);

                    RequestDispatcher rd = request.getRequestDispatcher(displayView);
                    rd.forward(request, response);

                } else {
//                    RequestDispatcher rd = request.getRequestDispatcher("userLoginPage.jsp");
                    response.sendRedirect("userLoginPage.jsp");
//                    rd.forward(request, response);
                }

                //go to the registrationUserPage    
            } else if (action.equalsIgnoreCase("registerUser")) {
                User u = new User();
                request.setAttribute("pObject", u);
                request.setAttribute("msg", "Register a user");
                request.setAttribute("action", "createUser");

                RequestDispatcher rd = request.getRequestDispatcher("registrationUserPage.jsp");
                rd.forward(request, response);

                //create an account for user to login     
            } else if (action.endsWith("createUser")) {
                String name = request.getParameter("userName");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String userID = request.getParameter("userID");
                String password = request.getParameter("password");
                UserDAO dao = new UserDAO();
                User user = new User(userID, password, name, email, address);

                //check if create user success or not
                boolean createUserAccount = dao.createUserAccount(user);
                if (createUserAccount) {
                    response.sendRedirect("userLoginPage.jsp");
                } else if (!createUserAccount) {
                    out.println("Already exist");
                    checkCreateUserExist = true;
                    response.sendRedirect("UserServlet?action=registerUser&error=true");

                }

                //rollback to the userLoginPage when the user already have an account    
            } else if (action.equals("rollback")) {
                response.sendRedirect("userLoginPage.jsp");

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
