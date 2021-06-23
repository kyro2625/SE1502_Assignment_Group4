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
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguye
 */
public class UpdateUserController extends HttpServlet {

    private static final String SUCCESS = "MainAdminPageController";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "LoadUserByIDController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String idURL = "?id=" + request.getParameter("userID");

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
                errorObj.setNameError("User Name is greater than 4 characters");
                valid = false;
            }
            UserLoginDAO dao = new UserLoginDAO();
//            if (dao.getUserByID(userID) != null) {
//                errorObj.setIdError("This User ID is existed. Choose another one");
//                valid = false;
//            }
            UserLoginDTO user = new UserLoginDTO(userID, password, name, email, address, name);
            if (valid) {
                if (dao.update(user)) {
                    url = SUCCESS;
                    idURL = "";

                } else {
                    request.setAttribute("ERROR", "Update failed, cannot find the User ID: " + userID + ", please go back and try again");
                }
            } else {
                url = INVALID + "?id=" + userID;
                request.setAttribute("INVALID", errorObj);
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (Exception e) {
            log("ERROR at UpdateUserController: " + e.getMessage());
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url + idURL).forward(request, response);
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
