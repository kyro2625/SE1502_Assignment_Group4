/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.CategoryDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBContext;

/**
 *
 * @author Admin
 */
public class CategoryDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public CategoryDAO() {
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

    public CategoryDTO getCategoryByID(String id) throws Exception {
        CategoryDTO result = null;
        try {
            String sql = "SELECT CategoryName, CategoryDescription\n"
                    + "FROM tblCategory\n"
                    + "WHERE CategoryID=?";

            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("CategoryName");
                String description = rs.getString("CategoryDescription");
                result = new CategoryDTO(id, name, description);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<CategoryDTO> getAllCategories() throws Exception {
        List<CategoryDTO> result = null;
        try {
            String sql = "SELECT CategoryID, CategoryName, CategoryDescription\n"
                    + "FROM tblCategory\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("CategoryID");
                String name = rs.getString("CategoryName");
                String description = rs.getString("CategoryDescription");

                CategoryDTO dto = new CategoryDTO(id, name, description);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insert(CategoryDTO category) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO tblCategory(CategoryID, CategoryName, CategoryDescription)\n"
                    + "VALUES(?,?,?)";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, category.getId());
            preStm.setString(2, category.getName());
            preStm.setString(3, category.getDescription());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean update(CategoryDTO category) throws SQLException, NamingException, Exception {
        boolean check = false;

        try {
            String sql = "UPDATE tblCategory SET  CategoryName=?, CategoryDescription=? "
                    + " WHERE CategoryID=? ";
            DBContext db = new DBContext();
            conn = db.getConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);

                preStm.setString(1, category.getName());
                preStm.setString(2, category.getDescription());
                preStm.setString(3, category.getId());
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

    public boolean delete(String id) throws Exception {
        boolean check = false;
        try {
            String sql = "DELETE FROM tblCategory\n"
                    + "WHERE CategoryID=?";
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

}
