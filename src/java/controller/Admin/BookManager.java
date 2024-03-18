
package controller.Admin;

import dao.BookDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Book;
import model.Genre;
import model.User;


public class BookManager extends HttpServlet {

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
        String action = request.getParameter("action");

        try {
            HttpSession session = request.getSession();
            model.User user = (User) session.getAttribute("user");

            if (user.getIsAdmin().equalsIgnoreCase("true")) {
                if (action.equalsIgnoreCase("list")) {
                    BookDAO dao = new BookDAO();
                    List<Book> book = dao.getBook();
                    List<Genre> genre = dao.getGenre();
                    request.setAttribute("GenreData", genre);
                    request.setAttribute("BookData", book);
                    request.getRequestDispatcher("/admin/book.jsp").forward(request, response);
                }

                if (action.equalsIgnoreCase("insert")) {
                    BookDAO dao = new BookDAO();
                    List<Genre> genre = dao.getGenre();
                    request.setAttribute("GenreData", genre);
                    request.getRequestDispatcher("/admin/bookinsert.jsp").forward(request, response);
                }

                if (action.equalsIgnoreCase("insertgenre")) {
                    String name = request.getParameter("name");
                    BookDAO dao = new BookDAO();
                    model.Genre g = dao.getGenreByName(name);
                    if (g != null) {
                        request.setAttribute("error", name + "already");
                        request.getRequestDispatcher("admin/bookinsert.jsp").forward(request, response);
                    } else {
                        dao.insertGenre(name);
                        request.getRequestDispatcher("bookmanager?action=insert").forward(request, response);
                    }
                }

                if (action.equalsIgnoreCase("insertbook")) {
                    String book_id = request.getParameter("book_id");
                    String genre_id = request.getParameter("genre_id");
                    String book_name = request.getParameter("book_name");
                    String book_author = request.getParameter("book_author");
                    String book_price = request.getParameter("price");
                    String book_quantity = request.getParameter("quantity");
                    String img_URL = request.getParameter("img_url");
                    String book_description = request.getParameter("description");

                    Date public_date = null;
                    String public_date_str = request.getParameter("public_date");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    if (public_date_str != null) {
                        try {
                            java.util.Date parsedDate = sdf.parse(public_date_str);
                            public_date = new Date(parsedDate.getTime());
                        } catch (ParseException e) {
                            Logger.getLogger(BookManager.class.getName()).log(Level.SEVERE, null, e);
                        }
                    }

                    int quantity = 0;
                    if (book_quantity != null && !book_quantity.isEmpty()) {
                        try {
                            quantity = Integer.parseInt(book_quantity);
                        } catch (NumberFormatException e) {
                            Logger.getLogger(BookManager.class.getName()).log(Level.SEVERE, null, e);
                        }
                    }

                    Float price = null;
                    if (book_price != null && !book_price.isEmpty()) {
                        try {
                            price = Float.valueOf(book_price);
                        } catch (NumberFormatException e) {
                            Logger.getLogger(BookManager.class.getName()).log(Level.SEVERE, "Error parsing price", e);
                        }
                    }
                    if (price == null) {
                        price = 0.0f;
                    }

                    int gid = 0;
                    if (genre_id != null && !genre_id.isEmpty()) {
                        gid = Integer.parseInt(genre_id);
                    }

                    BookDAO dao = new BookDAO();
                    Genre gen = new Genre(gid);
                    Book book = new Book();
                    book.setBook_id(book_id);
                    book.setGenre(gen);
                    book.setBook_name(book_name);
                    book.setBook_author(book_author);
                    book.setBook_price(price);
                    book.setBook_description(book_description);
                    book.setBook_quantity(quantity);
                    book.setImg_URL(img_URL);
                    book.setPublic_date(public_date);
                    System.out.println("Book ID: " + book_id);
                    
                    dao.insertBook(book);
                    response.sendRedirect("bookmanager?action=insert");
                }

                if (action.equalsIgnoreCase("deletebook")) {
                    String book_id = request.getParameter("book_id");
                    BookDAO dao = new BookDAO();
                    dao.deleteBook(book_id);
                    response.sendRedirect("bookmanager?action=list");
                }

                if (action.equalsIgnoreCase("updatebook")) {
                    String book_id = request.getParameter("book_id");
                    String genre_id = request.getParameter("genre_id");
                    String book_name = request.getParameter("book_name");
                    String book_author = request.getParameter("book_author");
                    String book_price = request.getParameter("price");
                    String book_quantity = request.getParameter("quantity");
                    String img_URL = request.getParameter("img_url");
                    String book_description = request.getParameter("description");

                    Date public_date = null;
                    String public_date_str = request.getParameter("public_date");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    if (public_date_str != null) {
                        try {
                            java.util.Date parsedDate = sdf.parse(public_date_str);
                            public_date = new Date(parsedDate.getTime());
                        } catch (ParseException e) {
                            Logger.getLogger(BookManager.class.getName()).log(Level.SEVERE, null, e);
                        }
                    }

                    int quantity = 0;
                    if (book_quantity != null && !book_quantity.isEmpty()) {
                        try {
                            quantity = Integer.parseInt(book_quantity);
                        } catch (NumberFormatException e) {
                            Logger.getLogger(BookManager.class.getName()).log(Level.SEVERE, null, e);
                        }
                    }

                    Float price = null;
                    if (book_price != null && !book_price.isEmpty()) {
                        try {
                            price = Float.valueOf(book_price);
                        } catch (NumberFormatException e) {
                            Logger.getLogger(BookManager.class.getName()).log(Level.SEVERE, "Error parsing price", e);
                        }
                    }
                    if (price == null) {
                        price = 0.0f;
                    }

                    int gid = 0;
                    if (genre_id != null && !genre_id.isEmpty()) {
                        gid = Integer.parseInt(genre_id);
                    }
                    
                    BookDAO dao = new BookDAO();
                    Genre gen = new Genre(gid);
                    Book book = new Book();
                    book.setBook_id(book_id);
                    book.setGenre(gen);
                    book.setBook_name(book_name);
                    book.setBook_author(book_author);
                    book.setBook_price(price);
                    book.setBook_description(book_description);
                    book.setBook_quantity(quantity);
                    book.setImg_URL(img_URL);
                    book.setPublic_date(public_date);
                    System.out.println("Book ID: " + book_id);
                    dao.updateBook(book);
                    response.sendRedirect("bookmanager?action=list");
                }
            } else {
                response.sendRedirect("user?action=login");
            }

        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error occurred: " + e.getMessage());
            request.setAttribute("stackTrace", e.getStackTrace());
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
