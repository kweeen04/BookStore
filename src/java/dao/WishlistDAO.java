package dao;

import Context.DBConnection;
import model.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class WishlistDAO {

    public static void addToWishlist(String book_id) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO Wishlist(BookID) VALUES(?)");
            stmt.setString(1, book_id);
            stmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static List<Book> getWishlist() {
        List<Book> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Wishlist");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Book book = BookDAO.getBookByID(rs.getString("BookID"));
                list.add(book);
            }
        } catch (Exception e) {
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static List<Book> getWishlistByGenre(int genre_id) {
        List<Book> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT b.* FROM Wishlist w JOIN Book b ON w.BookID = b.BookID WHERE b.GenreID = ?");
            stmt.setInt(1, genre_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Book book = BookDAO.getBookByID(rs.getString("BookID"));
                list.add(book);
            }
        } catch (Exception e) {
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static void insertWishlist(String book_id) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO Wishlist(BookID) VALUES(?)");
            stmt.setString(1, book_id);
            stmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static void deleteWishlist(String book_id) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("DELETE FROM Wishlist WHERE BookID = ?");
            stmt.setString(1, book_id);
            stmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    public static boolean bookExistsInWishlist(String book_id) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Wishlist WHERE BookID = ?");
            stmt.setString(1, book_id);
            ResultSet rs = stmt.executeQuery();
            return rs.next(); // If any row is returned, the book exists in the wishlist
        } catch (Exception e) {
            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, e);
            return false; // Return false in case of any exception
        }
    }
}
