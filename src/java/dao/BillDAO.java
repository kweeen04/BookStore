/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Context.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Bill;
import model.BillDetail;
import model.Book;
import model.Cart;
import model.Item;
import model.User;

/**
 *
 * @author ADMIN
 */
public class BillDAO {

    public void addOrder(User u, Cart cart, String payment, String address, int phone) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO Bill VALUES(?,?,?,?,?,?)");
            stmt.setInt(1, u.getUser_id());
            stmt.setDouble(2, cart.getTotalMoney());
            stmt.setString(3, payment);
            stmt.setString(4, address);
            stmt.setString(5, date);
            stmt.setInt(6, phone);
            stmt.executeUpdate();

            PreparedStatement stmt1 = con.prepareStatement("SELECT TOP 1 BillID from Bill ORDER BY BillID DESC");
            ResultSet rs = stmt1.executeQuery();
            if (rs.next()) {
                int bill_id = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    PreparedStatement stmt2 = con.prepareStatement("INSERT INTO Bill_Detail VALUES(?,?,?,?)");
                    double total = i.getQuantity() * i.getBook().getBook_price();
                    stmt2.setInt(1, bill_id);
                    stmt2.setString(2, i.getBook().getBook_id());
                    stmt2.setInt(3, i.getQuantity());
                    stmt2.setDouble(4, total);
                    stmt2.executeUpdate();
                }
            }
            PreparedStatement stmt3 = con.prepareStatement("UPDATE Book set Quantity = Quantity - ? WHERE BookID = ?");
            for (Item i : cart.getItems()) {
                stmt3.setInt(1, i.getQuantity());
                stmt3.setString(2, i.getBook().getBook_id());
                stmt3.executeUpdate();
            }
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<Bill> getBillInfo() {
        List<Bill> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT b.BillID, u.UserName,b.phone,b.address,b.date,b.total,b.payment \n"
                    + "from Bill b inner join Users u on b.UserID = u.UserID");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString(2));
                list.add(new Bill(rs.getInt(1), u, rs.getFloat(6), rs.getString(7), rs.getString(4),
                        rs.getDate(5), rs.getInt(3)
                ));
            }
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public Bill getBill() {
        List<Bill> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT TOP 1 BillID, total, date from Bill order by BillID desc");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return (new Bill(rs.getInt(1), rs.getFloat(2), rs.getDate(3)));
            }
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

public List<BillDetail> getDetail(int bill_id) {
        List<BillDetail> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT bd.DetailID, b.BookID, b.BookName, b.BookAuthor, b.ImgURL, bd.Quantity, bd.Price\n" +
"FROM Bill_Detail bd inner join Book b ON bd.BookID = b.BookID\n" +
"WHERE bd.BillID = ?");
            stmt.setInt(1, bill_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Book b = new Book(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(new BillDetail(rs.getInt(1), b, rs.getInt(6), rs.getFloat(7)));
            }
        } catch (Exception e) {
        Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
}


    public void updatePayment(String payment, int bill_id) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("UPDATE Bill SET payment= ? WHERE BillID = ?");
            stmt.setInt(2, bill_id);
            stmt.setString(1, payment);
            stmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<Bill> getBillByID(int user_id) {
        List<Bill> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT b.BillID, b.Date, b.total, b.payment, b.Address, b.phone FROM bill b WHERE UserID = ?");
            stmt.setInt(1, user_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1), rs.getFloat(3),
                        rs.getString(4), rs.getString(5),
                        rs.getDate(2), rs.getInt(6)
                ));
            }
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Bill> getBillByDay() {
        List<Bill> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT b.BillID, u.UserName,b.phone,b.address,b.date,b.total,b.payment \n"
                    + "FROM bill b inner join Users u on b.UserID = u.UserID where date = cast(getdate() as Date)");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString(2));
                list.add(new Bill(rs.getInt(1), u, rs.getFloat(6), rs.getString(7),
                        rs.getString(4), rs.getDate(5), rs.getInt(3)));
            }
        } catch (Exception e) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        BillDAO dao = new BillDAO();
        List<BillDetail> list = dao.getDetail(2);
        for (BillDetail b : list) {
            System.out.println(b);
        }
    }
}
