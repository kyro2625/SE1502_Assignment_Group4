/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.ProductDTO;
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
 * @author nguyen
 */
public class ProductDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

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

    public List<ProductDTO> getAllProduct() throws Exception {
        List<ProductDTO> result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM tblProduct\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("ProductID");
                String name = rs.getString("ProductName");
                String brand = rs.getString("ProductBrand");
                String description = rs.getString("ProductDescription");
                String status = rs.getString("ProductStatus");
                String price = rs.getString("Price");
                String imageURL = rs.getString("ImageURL");
                String categoryID = rs.getString("CategoryID");
                CategoryDAO dao = new CategoryDAO();
                CategoryDTO category = dao.getCategoryByID(categoryID);
                ProductDTO product = new ProductDTO(Integer.parseInt(id), name, brand, description, status, Float.parseFloat(price), imageURL, category);
                result.add(product);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean delete(String id) throws Exception {
        boolean check = false;
        try {
            String sql = "DELETE FROM tblProduct\n"
                    + "WHERE ProductID=?";
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

//    public boolean search(String roomId) throws Exception {
//        boolean check = false;
//        try {
//            String sql = " "
//        }
//    }
    public boolean insert(ProductDTO product) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO tblProduct(ProductID, ProductName, ProductBrand, ProductDescription, ProductStatus, Price, ImageURL, CategoryID)\n"
                    + "VALUES(?,?,?,?,?,?,?,?)";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, product.getId());
            preStm.setString(2, product.getName());
            preStm.setString(3, product.getBrand());
            preStm.setString(4, product.getDescription());
            preStm.setString(5, product.getStatus());
            preStm.setFloat(6, product.getPrice());
            preStm.setString(7, product.getImageURL());
            preStm.setString(8, product.getCategory().getId());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean update(ProductDTO product) throws SQLException, NamingException, Exception {
        boolean check = false;

        try {
            String sql = "UPDATE tblProduct SET  ProductName=?, ProductBrand=?,ProductDescription=?, ProductStatus=?, Price=?, ImageURL=?,  CategoryID=? "
                    + " WHERE ProductID=? ";
            DBContext db = new DBContext();
            conn = db.getConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);

                preStm.setString(1, product.getName());
                preStm.setString(2, product.getBrand());
                preStm.setString(3, product.getDescription());
                preStm.setString(4, product.getStatus());
                preStm.setFloat(5, product.getPrice());
                preStm.setString(6, product.getImageURL());
                preStm.setString(7, product.getCategory().getId());
                preStm.setInt(8, product.getId());

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

    public ProductDTO getProductByID(String id) throws Exception {
        ProductDTO result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM tblProduct\n"
                    + "WHERE ProductID = ?\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("ProductName");
                String brand = rs.getString("ProductBrand");
                String description = rs.getString("ProductDescription");
                String status = rs.getString("ProductStatus");
                String price = rs.getString("Price");
                String imageURL = rs.getString("ImageURL");
                String categoryID = rs.getString("CategoryID");
                CategoryDAO dao = new CategoryDAO();
                CategoryDTO category = dao.getCategoryByID(categoryID);
                ProductDTO laptop = new ProductDTO(Integer.parseInt(id), name, brand, description, status, Float.parseFloat(price), imageURL, category);
                result = new ProductDTO(Integer.parseInt(id), name, brand, description, status, Float.parseFloat(price), imageURL, category);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ProductDTO> getProductByCategoryID(String id) throws Exception {

        List<ProductDTO> result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM tblProduct\n"
                    + "WHERE CategoryID = ?\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);

            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String productid = rs.getString("ProductID");
                String name = rs.getString("ProductName");
                String brand = rs.getString("ProductBrand");
                String description = rs.getString("ProductDescription");
                String status = rs.getString("ProductStatus");
                String price = rs.getString("Price");
                String imageURL = rs.getString("ImageURL");
                String categoryID = rs.getString("CategoryID");
                CategoryDAO dao = new CategoryDAO();
                CategoryDTO category = dao.getCategoryByID(categoryID);
                ProductDTO product = new ProductDTO(Integer.parseInt(productid), name, brand, description, status, Float.parseFloat(price), imageURL, category);
                result.add(product);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    private List<ProductDTO> products;

    public ProductDAO() {
        try {
            this.products = getAllProduct();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<ProductDTO> findAll() {
        return this.products;
    }

    public ProductDTO find(int id) {
        int proid = id;
        Integer productID = new Integer(proid);

        for (ProductDTO product : this.products) {

            if (product.getId() == id) {

                return product;
            }
        }
        return null;
    }
}
