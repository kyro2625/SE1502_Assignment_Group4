/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/logout")

//@WebServlet(name = "UserLogoutServlet", urlPatterns = {"/logout"})
public class UserLogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public UserLogoutServlet() {
        super();
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("user");
             
            RequestDispatcher dispatcher = request.getRequestDispatcher("userLoginPage.jsp");
            dispatcher.forward(request, response);
        }
//        if (session != null) {
//            session.removeAttribute("user"); //remove session
//        }
//        response.sendRedirect(request.getContextPath() + "/login");
//    }
}
