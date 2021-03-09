/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entities.Category;
import UTILS.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author nguye
 */
public class CategoryDAO {

    public boolean addCategory(Category cd) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "INSERT INTO tblCategory(CategoryID,CategoryName,CategoryDescription) "
                + "VALUES (?, ?, ?)";

        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, cd.getCategoryID());
                pstm.setString(2, cd.getCategoryName());
                pstm.setString(3, cd.getCategoryDescription());

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

    public ArrayList<Category> getAllCategory() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT c.* FROM Category c ORDER BY c.CategoryID";

        ArrayList<Category> lst = new ArrayList<>();

        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();

                while (rs.next()) {
                    String id = rs.getString("CategoryID");
                    String name = rs.getString("CategoryName");
                    String Des = rs.getString("CategoryDescription");

                    Category c = new Category(id, name, Des); //DTO

                    lst.add(c);
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
        return lst;
    }

}
