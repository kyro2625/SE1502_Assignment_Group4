/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.UserLoginDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBContext;

public class UserLoginDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public UserLoginDAO() {
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (conn != null) {
            conn.close();
        }
        if (preStm != null) {
            preStm.close();
        }
    }

    public List<UserLoginDTO> getAllAccount() throws Exception {
        List<UserLoginDTO> result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM tblUser\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("UserID");
                String password = rs.getString("UserPassword");
                String name = rs.getString("UserName");
                String email = rs.getString("UserEmail");
                String address = rs.getString("UserAddress");
                String role = rs.getString("UserRole");

                UserLoginDTO user = new UserLoginDTO(id, password, name, email, address, role);
                result.add(user);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<UserLoginDTO> getAllUserAccount() throws Exception {
        List<UserLoginDTO> result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM tblUser\n"
                    + "WHERE UserRole=?";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "user");
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("UserID");
                String password = rs.getString("UserPassword");
                String name = rs.getString("UserName");
                String email = rs.getString("UserEmail");
                String address = rs.getString("UserAddress");
                String role = rs.getString("UserRole");

                UserLoginDTO user = new UserLoginDTO(id, password, name, email, address, role);
                result.add(user);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public UserLoginDTO checkLogin(String userID, String password) throws Exception {
        UserLoginDTO result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM tblUser\n"
                    + "WHERE UserID=? AND UserPassword=?";

            DBContext db = new DBContext();

            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("UserName");
                String email = rs.getString("UserEmail");
                String address = rs.getString("UserAddress");
                String role = rs.getString("UserRole");
                result = new UserLoginDTO(userID, password, fullName, email, address, role);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean createUserAccount(UserLoginDTO u) throws NamingException, SQLException, Exception {
        boolean check = false;

        try {
            String sql = "INSERT INTO tblUser(UserID,UserPassword,UserName,UserEmail,UserAddress)"
                    + "VALUES (?, ?, ?, ?, ?)";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, u.getUserID());
            preStm.setString(2, u.getPassword());
            preStm.setString(3, u.getFullname());
            preStm.setString(4, u.getEmail());
            preStm.setString(5, u.getAddress());
//                pstm.setString(6, u.getRole());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public UserLoginDTO getUserByID(String id) throws Exception {
        UserLoginDTO result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM tblUser\n"
                    + "WHERE UserID = ?\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String password = rs.getString("UserPassword");
                String fullName = rs.getString("UserName");
                String email = rs.getString("UserEmail");
                String address = rs.getString("UserAddress");
                String role = rs.getString("UserRole");
                result = new UserLoginDTO(id, password, fullName, email, address, role);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean delete(String id) throws Exception {
        boolean check = false;
        try {
            String sql = "DELETE FROM tblUser\n"
                    + "WHERE UserID=?";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean update(UserLoginDTO user) throws SQLException, NamingException, Exception {
        boolean check = false;

        try {
            String sql = "UPDATE tblUser SET  UserPassword=?, UserName=?, UserEmail=?, UserAddress=? "
                    + " WHERE UserID=? ";
            DBContext db = new DBContext();
            conn = db.getConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);

                preStm.setString(1, user.getPassword());
                preStm.setString(2, user.getFullname());
                preStm.setString(3, user.getEmail());
                preStm.setString(4, user.getAddress());
                preStm.setString(5, user.getUserID());

                check = preStm.executeUpdate() > 0;
            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
        } finally {
            closeConnection();
        }
        return check;
    }
}
