/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author nguye
 */
public class User {
    private String UserID;
    private String UserPassword;
    private String UserName;
    private String UserEmail;
    private String UserAddress;

    public User() {
    }

    public User(String UserID, String UserPassword, String UserName, String UserEmail, String UserAddress) {
        this.UserID = UserID;
        this.UserPassword = UserPassword;
        this.UserName = UserName;
        this.UserEmail = UserEmail;
        this.UserAddress = UserAddress;
    }

    public User(String UserID, String UserPassword) {
        this.UserID = UserID;
        this.UserPassword = UserPassword;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getUserPassword() {
        return UserPassword;
    }

    public void setUserPassword(String UserPassword) {
        this.UserPassword = UserPassword;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getUserEmail() {
        return UserEmail;
    }

    public void setUserEmail(String UserEmail) {
        this.UserEmail = UserEmail;
    }

    public String getUserAddress() {
        return UserAddress;
    }

    public void setUserAddress(String UserAddress) {
        this.UserAddress = UserAddress;
    }
    
}
