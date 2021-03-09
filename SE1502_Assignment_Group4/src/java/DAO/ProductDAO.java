/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entities.Product;
import UTILS.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Thinkpro
 */
public class ProductDAO {

    public boolean deleteProduct(String ProductID) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "DELETE FROM tblProduct WHERE ProductID=?";
        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, ProductID);

                pstm.executeQuery();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }

    public Product searchProduct(String ProductID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT a.*,b.CategoryName FROM tblProduct a, tblCategory b where a.ProductID=? and a.CategoryID=b.CategoryID";

        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, ProductID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    String id = rs.getString("ProductID");
                    String name = rs.getString("ProductName");
                    String brand = rs.getString("ProductBrand");
                    String price = rs.getString("ProductPrice");
                    String description = rs.getString("ProductDescription");
                    String status = rs.getString("ProductStatus");
                    String imageurl = rs.getString("ImageURL");
                    String categoryId = rs.getString("CategoryID");
                    Product tmp = new Product(id, name, brand, description, status, price, imageurl, categoryId);
                    return tmp;
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public boolean UpdatedProduct(Product tmp) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "UPDATE tblProduct SET ProductName=? ProductBrand=? ProductDescription=? "
                + "ProductStatus=? Price=? ImageURL=? CategoryID=? WHERE ProductID=?";
        try {
            con = DBConnect.makeConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, tmp.getProductName());
                pstm.setString(2, tmp.getProductBrand());
                pstm.setString(3, tmp.getProductDescription());
                pstm.setString(4, tmp.getProductStatus());
                pstm.setString(5, tmp.getPrice());
                pstm.setString(6, tmp.getImageURL());
                pstm.setString(7, tmp.getCategoryID());
                pstm.setString(8, tmp.getProductID());
                pstm.executeQuery();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return false;
    }
}
