/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import Entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nguye
 */
@WebServlet(name = "UserLoginServlet", urlPatterns = {"/UserLoginServlet"})
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public UserLoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String userPassword = request.getParameter("password");

        UserDAO userDao = new UserDAO();

        try {
            User user = userDao.checkUserLogin(userID, userPassword);
            String destPage = "userLoginPage.jsp";

            if (user != null) {
                HttpSession oldSession = request.getSession(false);
                if (oldSession != null) {
                    oldSession.invalidate();
                }
                HttpSession session = request.getSession();
                String names = user.getUserName();
                String userIDcookie = user.getUserID().trim();
                session.setAttribute("names", names);
                //setting session to expiry in 30 mins
                session.setMaxInactiveInterval(30 * 60);
                Cookie userName = new Cookie("user", userID);
                userName.setMaxAge(30 * 60);
                response.addCookie(userName);
                response.sendRedirect("mainUserPage.jsp");
            } else {
                String message = "Invalid User ID or Password, please try again";
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);

                dispatcher.forward(request, response);
            }

//            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
//            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            Logger.getLogger(UserLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
