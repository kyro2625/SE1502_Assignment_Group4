/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import entities.User;
import utils.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author nguye
 */
public class UserDAO {

    public boolean createUserAccount(User u) throws NamingException, SQLException, Exception {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "INSERT INTO tblUser(UserID,UserPassword,UserName,UserEmail,UserAddress)"
                + "VALUES (?, ?, ?, ?, ?)";

        try {
            con = DBConnect.getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, u.getUserID());
                pstm.setString(2, u.getUserPassword());
                pstm.setString(3, u.getUserName());
                pstm.setString(4, u.getUserEmail());
                pstm.setString(5, u.getUserAddress());
                pstm.executeUpdate();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public User checkUserLogin(String userID, String password) throws NamingException, SQLException, Exception {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        User user = new User();

        String sql = "SELECT * FROM tblUser WHERE UserID=? AND UserPassword=?";
        try {
            con = DBConnect.getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, userID);
                pstm.setString(2, password);
                rs = pstm.executeQuery();

                if (rs.next()) {
                    String UserID = rs.getString("UserID");
                    String UserPassword = rs.getString("UserPassword");
                    String UserName = rs.getString("UserName");
                    String UserEmail = rs.getString("UserEmail");
                    String UserAddress = rs.getString("UserAddress");

                    user.setUserID(UserID);
                    user.setUserName(UserName);
                    user.setUserPassword(UserPassword);
                    user.setUserEmail(UserEmail);
                    user.setUserAddress(UserAddress);
//                    User u = new User(UserID, UserPassword, UserName, UserEmail, UserAddress);
                    return user;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
}
