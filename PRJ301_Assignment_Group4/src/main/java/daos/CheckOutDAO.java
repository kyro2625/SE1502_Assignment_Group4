package daos;

import dtos.CartItem;
import dtos.CategoryDTO;
import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import dtos.UserLoginDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBContext;

/**
 *
 * @author nguye
 */
public class CheckOutDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public CheckOutDAO() {

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

    public boolean createOrder(UserLoginDTO user) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO tblOrder(UserID)\n"
                    + "VALUES(?)";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, user.getUserID());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public OrderDTO getCurrentOrderByUserID(String id) throws Exception {
        OrderDTO result = null;
        try {
            String sql = "SELECT TOP 1 * \n"
                    + "FROM tblOrder \n"
                    + "WHERE UserID =? ORDER BY OrderID DESC ";

            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String orderID = rs.getString("OrderID");
                String date = rs.getString("OrderDate");
                String userID = rs.getString("UserID");
                result = new OrderDTO(Integer.parseInt(orderID), date, userID);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insertOrderDetail(CartItem item, int id) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO tblOrderDetail(OrderID, ProductID, Quantity)\n"
                    + "VALUES(?,?,?)";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, id);
            preStm.setInt(2, item.getProduct().getId());
            preStm.setInt(3, item.getQuantity());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<OrderDTO> getOrderByUserID(String id) throws Exception {

        List<OrderDTO> result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM tblOrder\n"
                    + "WHERE UserID = ?\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                int orderID = rs.getInt("OrderID");
                String date = rs.getString("OrderDate");
                String userID = rs.getString("UserID");
                OrderDTO order = new OrderDTO(orderID, date, userID);
                result.add(order);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<OrderDetailDTO> getOrderDetailByOrderID(String id) throws Exception {

        List<OrderDetailDTO> result = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM tblProduct P, tblOrderDetail D\n"
                    + "WHERE P.ProductID = D.ProductID AND D.OrderID = ?\n";
            DBContext db = new DBContext();
            conn = db.getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String productID = rs.getString("ProductID");
                String productName = rs.getString("ProductName");
                String price = rs.getString("Price");
                String quantity = rs.getString("Quantity");
                OrderDetailDTO orderdetail = new OrderDetailDTO(productID, productName, Float.parseFloat(price), Integer.parseInt(quantity));
                result.add(orderdetail);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
