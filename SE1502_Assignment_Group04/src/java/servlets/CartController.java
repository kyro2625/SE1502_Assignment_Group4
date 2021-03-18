/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.ProductDAO;
import dtos.CartItem;
import java.io.IOException;
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
public class CartController extends HttpServlet {

    public CartController() {
        super();
    }

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

        response.sendRedirect("Cart");
    }

    protected void buyItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO product = new ProductDAO();

        HttpSession session = request.getSession();

        if (session.getAttribute("cart") == null) {
            List<CartItem> cart = new ArrayList<CartItem>();
            
            cart.add(new CartItem(product.find(Integer.parseInt(request.getParameter("id"))), 1));
            session.setAttribute("cart", cart);
        } else {
           

            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            int index = isExisting(Integer.parseInt(request.getParameter("id")), cart);
            if (index < 0) {
                cart.add(new CartItem(product.find(Integer.parseInt(request.getParameter("id"))), 1));
            } else {
                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", cart);
        }
        // Bu :)
        displayCart(request, response);
    }
    

    private int isExisting(int id, List<CartItem> cart) {
        int proid = id;
        Integer productID = new Integer(proid);
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getProduct().getId() ==id) {
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
