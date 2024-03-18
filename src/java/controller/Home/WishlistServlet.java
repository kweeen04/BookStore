package controller.Home;

import dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Book;
import model.Item;
import model.Wishlist;
import java.io.IOException;
import java.util.List;

public class WishlistServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if (action == null) {
            Wishlist wishlist = (Wishlist) session.getAttribute("wishlist");
            if (wishlist == null) {
                wishlist = new Wishlist();
            }

            String Squantity = request.getParameter("quantity");
            String book_id = request.getParameter("book_id");

            try {
                int quantity = Integer.parseInt(Squantity);
                BookDAO dao = new BookDAO();
                Book book = dao.getBookByID(book_id);
                Item item = new Item(book, quantity);
                wishlist.addItem(item);
            } catch (Exception e) {
                e.printStackTrace(); // Handle exception appropriately
            }

            session.setAttribute("wishlist", wishlist);
            List<Item> list = wishlist.getItems();
            session.setAttribute("size", list.size());
            response.sendRedirect("book?action=bookdetail&book_id=" + book_id);
        }

        if (action.equalsIgnoreCase("showwishlist")) {
            request.getRequestDispatcher("wishlist.jsp").forward(request, response);
        }

        if (action.equals("addtowishlist")) {
    String book_id = request.getParameter("book_id");
    
    try {
        BookDAO dao = new BookDAO();
        Book book = dao.getBookByID(book_id);
        if (book != null) {
            Wishlist wishlist = (Wishlist) session.getAttribute("wishlist");
            if (wishlist == null) {
                wishlist = new Wishlist();
                session.setAttribute("wishlist", wishlist);
            }

            // Check if the book is already in the wishlist
            boolean alreadyInWishlist = wishlist.containsBook(book_id);
            if (alreadyInWishlist) {
                request.setAttribute("alreadyInWishlist", true);
            } else {
                Item item = new Item(book, 1); // Default quantity is 1
                wishlist.addItem(item);
                session.setAttribute("wishlist", wishlist);
                request.setAttribute("addToWishlistSuccess", true);
            }
            
            // Redirect to book-details.jsp
            request.getRequestDispatcher("wishlist.jsp").forward(request, response);
        } else {
            // Redirect to error.jsp if book is not found
            response.sendRedirect("404.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace(); // Handle exception appropriately
        // Redirect to error.jsp if an exception occurs
        response.sendRedirect("404.jsp");
    }
}


        if (action.equals("deletewishlist")) {
            Wishlist wishlist = (Wishlist) session.getAttribute("wishlist");
            if (wishlist == null) {
                wishlist = new Wishlist();
            }

            String book_id = request.getParameter("book_id");
            wishlist.removeItem(book_id);
            session.setAttribute("wishlist", wishlist);

            List<Item> list = wishlist.getItems();
            session.setAttribute("size", list.size());

            response.sendRedirect("wishlist.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
