/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dao.BillDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Bill;
import model.BillDetail;
import model.User;

/**
 *
 * @author ADMIN
 */
public class OrderManager extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String action =request.getParameter("action");
            BillDAO dao = new BillDAO();
            
            if (user.getIsAdmin().equalsIgnoreCase("true")) {
                if (action.equalsIgnoreCase("list")) {
                    List<Bill> bill = dao.getBillInfo();
                    request.setAttribute("bill", bill);
                    request.getRequestDispatcher("admin/order.jsp").forward(request, response);
                }
                
                if (action.equalsIgnoreCase("showdetail")) {
                    String bill_id = request.getParameter("bill_id");
                    int id = Integer.parseInt(bill_id);
                    List<BillDetail> detail = dao.getDetail(id);
                    request.setAttribute("detail", detail);
                    request.getRequestDispatcher("admin/orderdetail.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("user?action=login");
            }
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
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
