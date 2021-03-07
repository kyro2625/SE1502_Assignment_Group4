/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

/**
 *
 * @author nguye
 */
public class Order {
    private String OrderID;
    private String UserID;

    public Order() {
    }

    public Order(String OrderID, String UserID) {
        this.OrderID = OrderID;
        this.UserID = UserID;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }
    
}
