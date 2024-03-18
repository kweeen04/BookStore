/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Home;

import dao.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Book;
import model.Item;

/**
 *
 * @author ADMIN
 */
public class Cart extends HttpServlet {

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
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if (action == null) {
            model.Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (model.Cart) o;
            } else {
                cart = new model.Cart();
            }

            String Squantity = request.getParameter("quantity");
            String book_id = request.getParameter("book_id");

            try {
                int quantity = Integer.parseInt(Squantity);
                BookDAO dao = new BookDAO();
                Book book = dao.getBookByID(book_id);
                Item item = new Item(book, quantity);
                cart.addItem(item);
            } catch (Exception e) {
            }

            List<Item> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalMoney());
            session.setAttribute("size", list.size());
            request.getRequestDispatcher("book?action=bookdetail&book_id=" + book_id).forward(request, response);
        }

        if (action.equalsIgnoreCase("showcart")) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }

        if (action.equals("deletecart")) {
            model.Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (model.Cart) o;
            } else {
                cart = new model.Cart();
            }

            String book_id = request.getParameter("book_id");
            cart.removeItem(book_id);
            List<Item> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("total", cart.getTotalMoney());
            session.setAttribute("size", list.size());
            response.sendRedirect("cart.jsp");
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
