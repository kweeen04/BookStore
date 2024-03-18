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
import java.util.List;
import model.Genre;

/**
 *
 * @author ADMIN
 */
public class Book extends HttpServlet {

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

        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("listAll")) {
            BookDAO dao = new BookDAO();
            List<model.Book> bookList = dao.getBook();
            List<Genre> genre = dao.getGenre();
            int page, numPerPage = 9;
            int size = bookList.size();
            int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1); //so trang
            String xPage = request.getParameter("page");

            if (xPage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xPage);
            }

            int start, end;
            start = (page - 1) * numPerPage;
            end = Math.min(page * numPerPage, size);
            List<model.Book> book = dao.getListByPage(bookList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("GenreData", genre);
            request.setAttribute("BookData", book);
            request.getRequestDispatcher("shop-genre.jsp").forward(request, response);
        }

        if (action.equalsIgnoreCase("listbygenre")) {
            String genre_id = request.getParameter("genre_id");
            int gen_id = Integer.parseInt(genre_id);
            BookDAO dao = new BookDAO();
            List<model.Book> bookList = dao.getBookByGenre(gen_id);
            List<Genre> genre = dao.getGenre();
            int page, numPerPage = 9;
            int size = bookList.size();
            int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1); //so trang
            String xPage = request.getParameter("page");

            if (xPage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xPage);
            }

            int start, end;
            start = (page - 1) * numPerPage;
            end = Math.min(page * numPerPage, size);
            List<model.Book> book = dao.getListByPage(bookList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("GenreData", genre);
            request.setAttribute("BookData", book);
            request.getRequestDispatcher("shop-genre.jsp").forward(request, response);
        }

        if (action.equalsIgnoreCase("bookdetail")) {
            String book_id = request.getParameter("book_id");
            BookDAO dao = new BookDAO();
            model.Book book = dao.getBookByID(book_id);
            int genre_id = book.getGenre().getGenre_id();
            List<model.Book> bookByGenre = dao.getBookByGenre(genre_id);
            request.setAttribute("bookData", book);
            request.setAttribute("BookByGenre", bookByGenre);
            request.getRequestDispatcher("book-details.jsp").forward(request, response);
        }

        if (action.equals("sort")) {
            String type = request.getParameter("type");

            if (type.equals("low")) {
                BookDAO dao = new BookDAO();
                List<model.Book> bookList = dao.getLowCostBooks();
                List<Genre> genre = dao.getGenre();
                int page, numPerPage = 9;
                int size = bookList.size();
                int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1); //so trang
                String xPage = request.getParameter("page");
                if (xPage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xPage);
                }
                int start, end;
                start = (page - 1) * numPerPage;
                end = Math.min(page * numPerPage, size);
                List<model.Book> book = dao.getListByPage(bookList, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("GenreData", genre);
                request.setAttribute("BookData", book);
                request.getRequestDispatcher("shop-genre.jsp").forward(request, response);
            }

            if (type.equals("high")) {
                BookDAO dao = new BookDAO();
                List<model.Book> bookList = dao.getHighCostBooks();
                List<Genre> genre = dao.getGenre();
                int page, numPerPage = 9;
                int size = bookList.size();
                int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1); //so trang
                String xPage = request.getParameter("page");
                if (xPage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xPage);
                }
                int start, end;
                start = (page - 1) * numPerPage;
                end = Math.min(page * numPerPage, size);
                List<model.Book> book = dao.getListByPage(bookList, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("GenreData", genre);
                request.setAttribute("BookData", book);
                request.getRequestDispatcher("shop-genre.jsp").forward(request, response);
            }

            if (type.equals("a-z")) {
                BookDAO dao = new BookDAO();
                List<model.Book> bookList = dao.getBooksAZ();
                List<Genre> genre = dao.getGenre();
                int page, numPerPage = 9;
                int size = bookList.size();
                int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1); //so trang
                String xPage = request.getParameter("page");
                if (xPage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xPage);
                }
                int start, end;
                start = (page - 1) * numPerPage;
                end = Math.min(page * numPerPage, size);
                List<model.Book> book = dao.getListByPage(bookList, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("GenreData", genre);
                request.setAttribute("BookData", book);
                request.getRequestDispatcher("shop-genre.jsp").forward(request, response);
            }
        }

        if (action.equals("search")) {
            String text = request.getParameter("text");
            BookDAO c = new BookDAO();
            List<model.Book> bookList = c.searchAll(text);
            List<model.Genre> genre = c.getGenre();
            int page, numperpage = 9;
            int size = bookList.size();
            int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            List<model.Book> book = c.getListByPage(bookList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("GenreData", genre);
            request.setAttribute("BookData", book);
            request.getRequestDispatcher("shop-genre.jsp").forward(request, response);
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
