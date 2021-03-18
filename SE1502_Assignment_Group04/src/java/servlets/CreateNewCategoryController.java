/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.CategoryDAO;
import daos.ProductDAO;
import dtos.CategoryDTO;
import dtos.CategoryErrorObject;
import dtos.ProductDTO;
import dtos.ProductErrorObject;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguye
 */
public class CreateNewCategoryController extends HttpServlet {

    private static final String SUCCESS = "MainAdminPageController";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "AddNewCategoryController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String url = ERROR;
        try {
            String id = request.getParameter("txtID");
            String name = request.getParameter("txtName");
            String description = request.getParameter("txtDescription");
           
            boolean valid = true;
            CategoryErrorObject errorObj = new CategoryErrorObject();
            if (id.trim().isEmpty()) {
                errorObj.setIdError("Category ID is not supposed to be empty");
                valid = false;
            }
            if (!id.trim().isEmpty() && !id.matches("[0-9]{3}")) {
                errorObj.setIdError("Category ID must be numberical, 4 digits");
                valid = false;
            }
            if (name.trim().isEmpty()) {
                errorObj.setNameError("Category Name is not supposed to be empty");
                valid = false;
            }
            if (!name.trim().isEmpty() && name.length() < 4) {
                errorObj.setNameError("Category Name information of computer is greater than 4 characters");
                valid = false;
            }
            CategoryDAO dao = new CategoryDAO();
            if (dao.getCategoryByID(id) != null) {
                errorObj.setIdError("This Category ID is existed. Choose another one");
                valid = false;
            }
//            CategoryDTO categoryToDB = new CategoryDTO(category.split("-")[0].trim(), category.split("-")[1].trim(), "");
//            ProductDTO product = new ProductDTO(id, name, brand, description, status, price, imageURL, categoryToDB);
            CategoryDTO category = new CategoryDTO(id, name, description);
            if (valid) {
                if (dao.insert(category)) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Insert failed, cannot find the Product ID: " + id + ", please go back and try again");
                }
            } else {
                url = INVALID;
                request.setAttribute("INVALID", errorObj);
            }
        } catch (Exception e) {
            log("ERROR at CreateNewCategoryController: " + e.getMessage());
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
