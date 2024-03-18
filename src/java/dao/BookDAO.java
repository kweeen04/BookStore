/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Context.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Book;
import model.Genre;

/**
 *
 * @author ADMIN
 */
public class BookDAO {

    public static List<Book> getBook() {
        List<Book> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT  g.GenreName, b.BookID , b.BookName, b.BookAuthor, b.BookPrice, b.BookDescribe, b.Quantity, b.ImgURL,\n"
                    + "b.PublicationDate FROM Book b inner join Genre g ON b.GenreID = g.GenreID");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Genre g = new Genre(rs.getString(1));
                list.add(new Book(g, rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getFloat(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8),
                        rs.getDate(9)
                ));
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static void insertBook(Book book) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO Book(BookID,GenreID,BookName,BookAuthor,BookPrice,BookDescribe,Quantity,ImgURL, PublicationDate) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)");
            stmt.setString(1, book.getBook_id());
            stmt.setInt(2, book.getGenre().getGenre_id());
            stmt.setString(3, book.getBook_name());
            stmt.setString(4, book.getBook_author());
            stmt.setFloat(5, book.getBook_price());
            stmt.setString(6, book.getBook_description());
            stmt.setInt(7, book.getBook_quantity());
            stmt.setString(8, book.getImg_URL());
            stmt.setDate(9, book.getPublic_date());
            stmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static void deleteBook(String book_id) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("DELETE FROM Book WHERE BookID = ?");
            stmt.setString(1, book_id);
            stmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static void updateBook(Book book) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("UPDATE Book SET GenreID=?, BookName=?, BookAuthor=?,BookPrice=?,"
                    + " BookDescribe=?,Quantity=?,ImgURL=?,PublicationDate=? WHERE BookID=?");
            stmt.setInt(1, book.getGenre().getGenre_id());
            stmt.setString(2, book.getBook_name());
            stmt.setString(3, book.getBook_author());
            stmt.setFloat(4, book.getBook_price());
            stmt.setString(5, book.getBook_description());
            stmt.setInt(6, book.getBook_quantity());
            stmt.setString(7, book.getImg_URL());
            stmt.setDate(8, book.getPublic_date());
            stmt.setString(9, book.getBook_id());
            stmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static List<Genre> getGenre() {
        List<Genre> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Genre");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Genre(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static Genre getGenreByName(String name) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Genre WHERE GenreName = ?");
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return new Genre(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public static void insertGenre(String name) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO Genre (GenreName) VALUES(?)");
            stmt.setString(1, name);
            stmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static List<Book> getTop10Books() {
        List<Book> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT TOP 10 b.BookID, b.BookName, b.BookAuthor, b.BookPrice, b.BookDescribe, "
                    + "b.Quantity, b.ImgURL, b.PublicationDate\n"
                    + "FROM Book b ORDER BY PublicationDate DESC");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8)
                ));
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static List<Book> getTrendingBooks() {
        List<Book> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT TOP 5 b.BookID , b.BookName, b.BookAuthor, b.BookPrice, b.BookDescribe,"
                    + " b.Quantity, b.ImgURL, b.PublicationDate\n"
                    + "FROM Book b inner join Bill_Detail bd on b.BookID = bd.BookID\n"
                    + "ORDER BY bd.quantity DESC");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8)
                ));
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static List<Book> getLowCostBooks() {
        List<Book> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT g.GenreName, b.BookID, b.BookName, b.BookAuthor, b.BookPrice, b.BookDescribe, "
                    + "b.Quantity, b.ImgURL, b.PublicationDate\n"
                    + "FROM Book b inner join Genre g on b.GenreID = g.GenreID\n"
                    + "ORDER BY b.BookPrice ASC");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Genre g = new Genre(rs.getString(1));
                list.add(new Book(g, rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getDate(9)
                ));
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static List<Book> getHighCostBooks() {
        List<Book> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT g.GenreName, b.BookID, b.BookName, b.BookAuthor, b.BookPrice, b.BookDescribe, "
                    + "b.Quantity, b.ImgURL, b.PublicationDate\n"
                    + "FROM Book b inner join Genre g on b.GenreID = g.GenreID\n"
                    + "ORDER BY b.BookPrice DESC");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Genre g = new Genre(rs.getString(1));
                list.add(new Book(g, rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getDate(9)
                ));
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static List<Book> getBooksAZ() {
        List<Book> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT g.GenreName , b.BookID , b.BookName, b.BookAuthor, b.BookPrice, b.BookDescribe, "
                    + "b.Quantity, b.ImgURL, b.PublicationDate\n"
                    + "FROM Book b inner join Genre g ON b.GenreID = g.GenreID ORDER BY b.BookName");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Genre g = new Genre(rs.getString(1));
                list.add(new Book(g, rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getDate(9)
                ));
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static List<Book> getListByPage(List<Book> list, int start, int end) {
        ArrayList<Book> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public static List<Book> getBookByGenre(int genre_id) {
        List<Book> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT g.GenreName , b.BookID , b.BookName, b.BookAuthor, b.BookPrice, "
                    + "b.BookDescribe, b.Quantity, b.ImgURL, b.PublicationDate\n"
                    + "FROM Book b inner join Genre g ON b.GenreID = g.GenreID WHERE b.GenreID=?");
            stmt.setInt(1, genre_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Genre g = new Genre(rs.getString(1));
                list.add(new Book(g, rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getDate(9)));
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public static Book getBookByID(String book_id) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT g.GenreID, g.GenreName, b.BookID, b.BookName, b.BookAuthor, "
                    + "b.BookPrice, b.BookDescribe, b.Quantity, b.ImgURL, b.PublicationDate\n"
                    + "FROM Book b inner join Genre g ON b.GenreID = g.GenreID WHERE b.BookID=?");
            stmt.setString(1, book_id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Genre g = new Genre(rs.getInt(1), rs.getString(2));
                java.sql.Date publicationDate = rs.getDate(10);
                return new model.Book(g, rs.getString(3),
                        rs.getString(4), rs.getString(5),
                        rs.getFloat(6), rs.getString(7),
                        rs.getInt(8), rs.getString(9),
                        publicationDate
                );
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public static int CountBook() {
        int count = 0;
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) as 'count'  FROM Book");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return count;
    }

    public static int CountUser() {
        int count = 0;
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS 'count' FROM users WHERE isAdmin = 'False' or isAdmin = 'False' ");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return count;
    }

    public static int CountBill() {
        int count = 0;
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS 'count' FROM Bill");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return count;
    }

    public static int CountBookLow() {
        int count = 0;
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS 'count' FROM Book WHERE Quantity < 30 ");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return count;
    }

   public static List<Book> searchAll(String text) {
    List<Book> list = new ArrayList<>();
    try (Connection con = DBConnection.getConnection()) {
        PreparedStatement stmt = con.prepareStatement("SELECT DISTINCT g.GenreName, b.BookID, b.BookName, b.BookAuthor, b.BookPrice, b.BookDescribe, "
                + "b.Quantity, b.ImgURL, b.PublicationDate\n"
                + "FROM Book b INNER JOIN Genre g ON b.GenreID = g.GenreID\n"
                + "WHERE b.BookID LIKE ? OR b.BookName LIKE ? OR b.BookPrice LIKE ? OR g.GenreName LIKE ? OR b.BookAuthor LIKE ? OR b.PublicationDate LIKE ?");
        String searchText = "%" + text + "%";
        stmt.setString(1, searchText);
        stmt.setString(2, searchText);
        stmt.setString(3, searchText);
        stmt.setString(4, searchText);
        stmt.setString(5, searchText);
        stmt.setString(6, searchText);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Genre g = new Genre(rs.getString(1));
            list.add(new Book(g, rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getFloat(5),
                    rs.getString(6),
                    rs.getInt(7), 
                    rs.getString(8),
                    rs.getDate(9) 
            ));
        }
    } catch (Exception e) {
        Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    return list;
}



    public static void main(String[] args) {
    }

}
