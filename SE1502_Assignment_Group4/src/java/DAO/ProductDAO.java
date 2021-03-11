/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entities.Category;
import Entities.Product;
import UTILS.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Thinkpro
 */
public class ProductDAO {

    public boolean addProduct(Product p) throws NamingException, SQLException, Exception {
        Connection con = null;
        PreparedStatement pstm = null;
        String sql = "INSERT INTO tblProduct(ProductID,ProductName,ProductBrand,ProductDescription,ProductStatus,Price,ImageURL,CategoryID) "
                + "VALUES (?,?,?,?,?,?,?,?)";

        try {
            con = DBConnect.getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                pstm.setString(1, p.getProductID());
                pstm.setString(2, p.getProductName());
                pstm.setString(3, p.getProductBrand());
                pstm.setString(4, p.getProductDescription());
                pstm.setString(5, p.getProductStatus());
                pstm.setString(6, p.getPrice());
                pstm.setString(7, p.getImageURL());
                pstm.setString(8, p.getCategoryID());

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

    public ArrayList<Category> getAllCategory() throws NamingException, SQLException, Exception {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT c.* FROM tblCategory c ORDER BY c.CategoryID";

        ArrayList<Category> lst = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
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
    
      private List<Product> products;

    public ProductDAO() {
        try {
            this.products = getAllProducts();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Product> findAll() {
        return this.products;
    }

    public Product find(String id) {
        for (Product product : this.products) {
            if (product.getProductID().equalsIgnoreCase(id)) {
                return product;
            }
        }
        return null;
    }

    public ArrayList<Product> getAllProducts() throws NamingException, SQLException, Exception {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM tblProduct";
        ArrayList<Product> lst = new ArrayList<>();
        try {
            con = DBConnect.getConnection();
            if (con != null) {
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("ProductID");
                    String name = rs.getString("ProductName");
                    String brand = rs.getString("ProductBrand");
                    String des = rs.getString("ProductDescription");
                    String sta = rs.getString("ProductStatus");
                    String price = rs.getString("Price");
                    String img = rs.getString("ImageURL");
                    String cateID = rs.getString("CategoryID");
                    Product p= new Product(id, name, brand, des, sta, price, img, cateID);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if(pstm!=null){
                pstm.close();
            }
            if(con!=null){
                con.close();
            }
        }
        return lst;
    }

}
