package Controller;

import DAO.ProductDAO;
import Entities.CartItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Baby Bear
 */
public class CartServlet extends HttpServlet {

    public CartServlet() {
        super();
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
        String action = request.getParameter("action");
        if (action == null) {
            displayCart(request, response);
        } else {
            if (action.equalsIgnoreCase("buy")) {
                buyItem(request, response);
            } else if (action.equalsIgnoreCase("remove")) {
                removeItem(request, response);
            }
        }
    }

    protected void displayCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    protected void removeItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        int index = isExisting(Integer.parseInt(request.getParameter("id")), cart);
        cart.remove(index);
        session.setAttribute("cart", cart);

        response.sendRedirect("CartServlet");
    }

    protected void buyItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO prod = new ProductDAO();

        HttpSession session = request.getSession();

        if (session.getAttribute("cart") == null) {
            List<CartItem> cart = new ArrayList<CartItem>();
            
            cart.add(new CartItem(prod.find(Integer.parseInt(request.getParameter("id"))), 1));
            session.setAttribute("cart", cart);
        } else {
           

            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            int index = isExisting(Integer.parseInt(request.getParameter("id")), cart);
            if (index < 0) {
                cart.add(new CartItem(prod.find(Integer.parseInt(request.getParameter("id"))), 1));
            } else {
                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", cart);
        }
        response.sendRedirect("CartServlet");
    }

    private int isExisting(int id, List<CartItem> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getProduct().getProductID()==id) {
                return i;
            }
        }
        return -1;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
