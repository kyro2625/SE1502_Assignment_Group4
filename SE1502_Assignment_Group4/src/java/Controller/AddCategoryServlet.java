/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CategoryDAO;
import Entities.Category;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nguye
 */
@WebServlet(name = "AddCategoryServlet", urlPatterns = {"/Add"
        + "CategoryServlet"})
public class AddCategoryServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            String welcome = (String) request.getAttribute("name");
            String controllerServlet = "UserServlet?action=mainPage";

                if (action.equals("createCategory")) { // Hiển thị form để tạo mới sản phẩm
                HttpSession session = request.getSession(false);
                if (session != null) {

                    ArrayList<Category> listCate = new ArrayList<>();
                    CategoryDAO dao = new CategoryDAO();

                    Category category = new Category();//Tạo đ/t product chưa có thong tin
                    request.setAttribute("cObject", category);
                    request.setAttribute("msg", "Add new Category");
                    request.setAttribute("action", "addNewCategory");
                    RequestDispatcher rd = request.getRequestDispatcher("addCategory.jsp");
                    rd.forward(request, response);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("userLoginPage.jsp");

                    rd.forward(request, response);
                }
            } else if (action.equals("addNewCategory")) {
                HttpSession session = request.getSession(false);
                if (session != null) {

                    try {

                        CategoryDAO dao = new CategoryDAO();

                        String id = request.getParameter("id");
                        String name = request.getParameter("name");
                        String description = request.getParameter("description");

                        Category c = new Category(id, name, description);
                        dao.addCategory(c);

                        response.sendRedirect(controllerServlet);

                    } catch (Exception e) {
                        request.setAttribute("msg", "Please enter the right format");
                        RequestDispatcher rd = request.getRequestDispatcher("AddCategoryServlet?action=addNewCategory");
                        rd.forward(request, response);
                    }
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
            protected void doGet
            (HttpServletRequest request, HttpServletResponse response)
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
            protected void doPost
            (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                processRequest(request, response);
            }

            /**
             * Returns a short description of the servlet.
             *
             * @return a String containing servlet description
             */
            @Override
            public String getServletInfo
                
                
            
                () {
        return "Short description";
            }// </editor-fold>

        }
