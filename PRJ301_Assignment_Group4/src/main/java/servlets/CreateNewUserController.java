/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.UserLoginDAO;
import dtos.UserErrorObject;
import dtos.UserLoginDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguye
 */
public class CreateNewUserController extends HttpServlet {

    private static final String SUCCESS = "MainAdminPageController";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "AddNewUserController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String name = request.getParameter("userName");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");

            boolean valid = true;
            UserErrorObject errorObj = new UserErrorObject();
            if (userID.trim().isEmpty()) {
                errorObj.setIdError("User ID is not supposed to be empty");
                valid = false;
            }
             if (password.trim().isEmpty()) {
                errorObj.setPasswordError("Password is not supposed to be empty");
                valid = false;
            }
            if (name.trim().isEmpty()) {
                errorObj.setNameError("User Name is not supposed to be empty");
                valid = false;
            }
            if (!name.trim().isEmpty() && name.length() < 3) {
                errorObj.setNameError("User Name information of computer is greater than 4 characters");
                valid = false;
            }
            UserLoginDAO dao = new UserLoginDAO();
            if (dao.getUserByID(userID) != null) {
                errorObj.setIdError("This User ID is existed. Choose another one");
                valid = false;
            }
            UserLoginDTO user = new UserLoginDTO(userID, password, name, email, address, name);
            if (valid) {
                if (dao.createUserAccount(user)) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Insert failed, cannot find the User ID: " + userID + ", please go back and try again");
                }
            } else {
                url = INVALID;
                request.setAttribute("INVALID", errorObj);
            }
        } catch (Exception e) {
            log("ERROR at CreateNewUserController: " + e.getMessage());
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
            Logger.getLogger(CreateNewUserController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CreateNewUserController.class.getName()).log(Level.SEVERE, null, ex);
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
