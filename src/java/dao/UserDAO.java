/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Context.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserDAO {

    public User checkUser(String user_email, String user_pass) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Users WHERE UserEmail = ? and UserPass = ?");
            stmt.setString(1, user_email);
            stmt.setString(2, user_pass);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
                return user;
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void updateUser(int user_id, String user_name, String user_pass) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("UPDATE Users set UserName = ? , UserPass = ? where UserID = ?");
            stmt.setString(1, user_name);
            stmt.setString(2, user_pass);
            stmt.setInt(3, user_id);
            stmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public User checkAcc(String user_email) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Users where UserEmail = ?");
            stmt.setString(1, user_email);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User a = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
                return a;
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void signUp(String user_email, String user_pass) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("INSERT INTO Users VALUES(?,?,?,?)");
            stmt.setString(1, "");
            stmt.setString(2, user_email);
            stmt.setString(3, user_pass);
            stmt.setString(4, "False");
            stmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    public List<User> getUser() {
        List<User> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Users");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5)
                ));
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public void setAdmin(int user_id, String isAdmin) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("UPDATE Users SET isAdmin= ? WHERE UserID= ?");
            stmt.setInt(2, user_id);
            stmt.setString(1, isAdmin.toUpperCase());
            stmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
}
