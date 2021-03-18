/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.ProductDAO;
import dtos.ProductDTO;
import dtos.ProductErrorObject;
import dtos.CategoryDTO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class CreateNewProductController extends HttpServlet {

    private static final long SerialVersionUID = 1L;
    private static final String UPLOAD_DIR = "images";

    private static final String SUCCESS = "MainAdminPageController";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "AddNewProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String id = request.getParameter("txtID");
            String name = request.getParameter("txtName");
            String brand = request.getParameter("txtBrand");
            String description = request.getParameter("txtDescription");
            String status = request.getParameter("txtStatus");
            String price = request.getParameter("txtPrice");
            String imageURL = "1";
//            String imageURL = uploadFile(request);
            String category = request.getParameter("cboCategory");
            boolean valid = true;
            ProductErrorObject errorObj = new ProductErrorObject();
            if (id.trim().isEmpty()) {
                errorObj.setIdError("Product ID is not supposed to be empty");
                valid = false;
            }
            if (!id.trim().isEmpty() && !id.matches("[0-9]{4}")) {
                errorObj.setIdError("Product ID must be numberical, 4 digits");
                valid = false;
            }
            if (name.trim().isEmpty()) {
                errorObj.setNameError("Product Name is not supposed to be empty");
                valid = false;
            }
            if (!name.trim().isEmpty() && name.length() < 4) {
                errorObj.setNameError("Product Name is greater than 4 characters");
                valid = false;
            }
            if (brand.trim().isEmpty()) {
                errorObj.setBrandError("Product Brand is not supposed to be empty");
                valid = false;
            }
            if (description.trim().isEmpty()) {
                errorObj.setDescriptionError("Description is not supposed to be empty");
                valid = false;
            }
            if (status.trim().isEmpty()) {
                errorObj.setStatusError("Product Status must be number and in range: 1900-2099");
                valid = false;
            }
            if (price.trim().isEmpty()) {
                errorObj.setPriceError("Product Price is not supposed to be empty");
                valid = false;
            }
//            if (imageURL.trim().isEmpty()) {
//                errorObj.setStatusError("Image of product is not supposed to be empty");
//                valid = false;
//            }
            ProductDAO dao = new ProductDAO();
            if (dao.getProductByID(id) != null) {
                errorObj.setIdError("This Product ID is existed. Choose another one");
                valid = false;
            }
            CategoryDTO categoryToDB = new CategoryDTO(category.split("-")[0].trim(), category.split("-")[1].trim(), "");

            if (valid) {
                ProductDTO product = new ProductDTO(Integer.parseInt(id), name, brand, description, status, Float.parseFloat(price), imageURL, categoryToDB);

                if (dao.insert(product)) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Insert failed, cannot find the Product ID: " + id + ", please go back and try again");
                }
            } else {
                url = INVALID;
                request.setAttribute("INVALID", errorObj);
            }
        } catch (Exception e) {
            log("ERROR at CreateController: " + e.getMessage());
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        try {
            Part filePart = request.getPart("imageURL");
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CreateNewProductController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CreateNewProductController.class.getName()).log(Level.SEVERE, null, ex);
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
