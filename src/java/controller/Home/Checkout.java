/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Home;

import Email.EmailSender;
import dao.BillDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.User;
import model.Bill;

/**
 *
 * @author ADMIN
 */
public class Checkout extends HttpServlet {

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
        response.setContentType("text/html; charset=UTF-8");

        try {
            HttpSession session = request.getSession(true);
            Cart cart = null;
            String payment = null;
            BillDAO dao = new BillDAO();
            String payment_method = request.getParameter("payment_method");

            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }

            User acc = null;
            Object u = session.getAttribute("user");
            if (o != null) {
                if (u != null) {
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String name = request.getParameter("name");
                    
                    if (payment_method.equals("momo")) {
                        payment = "MOMO";
                    }
                    if (payment_method.equals("vnpay")) {
                        payment = "VNPAY";
                    }
                    if (payment_method.equals("cod")) {
                        payment = "COD";
                    }
                    if (payment_method.equals("paypal")) {
                        payment = "PAYPAL";
                    }

                    int phoneNumber = Integer.parseInt(phone);
                    acc = (User) u;
                    dao.addOrder(acc, cart, payment, address, phoneNumber);
                    session.removeAttribute("cart");
                    session.setAttribute("size", 0);
                    if (payment_method.equals("cod")) {
                        Bill bill = dao.getBill();
                        int total = Math.round(bill.getTotal());
                        int finaltotal = total + 30000; 
                        String to = email; // Địa chỉ email của người nhận
                        String subject = "Spencer Shop to Mr/Mrs." + name; // Tiêu đề email
                        String body ="Dear Mr/Mrs." + name + "\n\n" +
                      "Thank you for choosing Spencer for your recent purchase! We sincerely appreciate the opportunity to serve you. Your order has been successfully placed and is currently being processed with care by our team.\n\n" +
                      "We understand the importance of your purchase, and we want to assure you that we are committed to providing you with the highest quality products and services. Your satisfaction is our top priority.\n\n" +
                      "The total value of your order is " + finaltotal + " VND. Please review the details below:\n\n" +
                      "- Product Price: " +total+ "VND\n" +
                      "- Shipping Fee: 30000 VND\n" +
                      "- Total: " +finaltotal+ "VND\n\n" +
                      "If you have any questions about your order or need further assistance, please feel free to reach out to our customer service team at 0789013530 or spencer1234@gmail.com. We are here to help!\n\n" +
                      "Once again, thank you for choosing Spencer. We value your business and look forward to serving you again in the future.\n\n" +
                      "Warm regards,\n\n" +
                      "Spencar\n";

                        // Gọi phương thức gửi email từ lớp EmailSender
                        EmailSender.sendEmail(to, subject, body);
                        
                        response.sendRedirect("home");
                    }
                    if (payment_method.equals("momo")) {
                        Bill bill = dao.getBill();
                        int total = Math.round(bill.getTotal());
                        request.setAttribute("total", total);
                        request.setAttribute("bill", bill);
                        request.getRequestDispatcher("qrcode2.jsp").forward(request, response);
                    }
                    if (payment_method.equals("vnpay")) {
                        Bill bill = dao.getBill();
                        int total = Math.round(bill.getTotal());
                        request.setAttribute("total", total);
                        request.setAttribute("bill", bill);
                        request.getRequestDispatcher("qrcode.jsp").forward(request, response);
                    }
                    if (payment_method.equals("paypal")) {
                        
                        request.getRequestDispatcher("checkoutpaypal.jsp").forward(request, response);
                    }
                } else {
                    response.sendRedirect("user?action=login");
                }
            }
        } catch (Exception e) {
            request.getRequestDispatcher("404.jsp").forward(request, response);
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
        HttpSession session = request.getSession(true);
        Object u = session.getAttribute("user");
        if (u != null) {
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            response.sendRedirect("user?action=login");
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
