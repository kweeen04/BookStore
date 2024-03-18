/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package paypal;

import Email.EmailSender;
import dao.BillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Bill;

/**
 *
 * @author Pc
 */
@WebServlet(name = "PaypalMail", urlPatterns = {"/paypalmail"})
public class PaypalMail extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PaypalMail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaypalMail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        BillDAO dao = new BillDAO();
        Bill bill = dao.getBill();
        String email = "minh2982004@gmail.com";
        String name = "minh";

        float total = Math.round(bill.getTotal()) / 24616.0f;
        float finalTotal = total + 1.2f + 1 / 24616.0f;
        float finaltotal = Math.round(finalTotal * 10) / 10.0f;
        float finalt = finaltotal + 1 ;
        String to = email; // Địa chỉ email của người nhận
        String subject = "Spencer Shop to Mr/Mrs." + name; // Tiêu đề email
        String body = "Dear Mr/Mrs." + name + "\n\n"
                + "Thank you for choosing Spencer for your recent purchase! We sincerely appreciate the opportunity to serve you. Your order has been successfully placed and is currently being processed with care by our team.\n\n"
                + "We understand the importance of your purchase, and we want to assure you that we are committed to providing you with the highest quality products and services. Your satisfaction is our top priority.\n\n"
                + "The total value of your order is " + finalt + " $. Please review the details below:\n\n"
                + "- Product Price: " + total + "$\n"
                + "- Shipping Fee: 1.2 $\n"
                + "- Tax Fee: 1 $\n"
                + "- Total: " + finalt + "$\n\n"
                + "If you have any questions about your order or need further assistance, please feel free to reach out to our customer service team at 0789013530 or spencer1234@gmail.com. We are here to help!\n\n"
                + "Once again, thank you for choosing Spencer. We value your business and look forward to serving you again in the future.\n\n"
                + "Warm regards,\n\n"
                + "Spencar\n";

        // Gọi phương thức gửi email từ lớp EmailSender
        EmailSender.sendEmail(to, subject, body);

        response.sendRedirect("order_confirmation.jsp");
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
