/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.CategoryDAO;
import daos.ProductDAO;
import dtos.ProductDTO;
import dtos.ProductErrorObject;
import dtos.CategoryDTO;
import dtos.CategoryErrorObject;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author nguye
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class UpdateCategoryController extends HttpServlet {

    private static final long SerialVersionUID = 1L;
    private static final String UPLOAD_DIR = "images";

    private static final String SUCCESS = "MainAdminPageController";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "LoadCategoryByIDController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String idURL = "?id=" + request.getParameter("txtID");
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
//            if (dao.getCategoryByID(id) != null) {
//                errorObj.setIdError("This Category ID is existed. Choose another one");
//                valid = false;
//            }
//            CategoryDTO categoryToDB = new CategoryDTO(category.split("-")[0].trim(), category.split("-")[1].trim(), "");
//            ProductDTO product = new ProductDTO(id, name, brand, description, status, price, imageURL, categoryToDB);
            CategoryDTO category = new CategoryDTO(id, name, description);
            if (valid) {
                if (dao.update(category)) {
                    url = SUCCESS;
                    idURL ="";
                } else {
                    request.setAttribute("ERROR", "Update failed, please go back and try again");
                }
            } else {
                url = INVALID + "?id=" + id;
                request.setAttribute("INVALID", errorObj);
                request.getRequestDispatcher(url).forward(request, response);

            }
        } catch (Exception e) {
            log("ERROR at CreateController: " + e.getMessage());
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url + idURL).forward(request, response);
        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        try {
            Part filePart = request.getPart("photo");
            fileName = (String) getFileName(filePart);
            String applicationPath = request.getServletContext().getRealPath("");
            int end = applicationPath.lastIndexOf("build");
            String truePath = applicationPath.substring(0, end) + "web";
            String basePath = truePath + File.separator + UPLOAD_DIR + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {
                e.printStackTrace();
                fileName = "";
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }

        } catch (Exception e) {
            fileName = "";
        }
        return fileName;
    }

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        System.out.println("*****partHeader :" + partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }

        return null;
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
