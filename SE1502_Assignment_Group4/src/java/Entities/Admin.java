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
public class Admin {
    private String AdminID;
    private String AdminPassword;
    private String AdminName;

    public Admin() {
    }

    public Admin(String AdminID, String AdminPassword) {
        this.AdminID = AdminID;
        this.AdminPassword = AdminPassword;
    }

    public Admin(String AdminID, String AdminPassword, String AdminName) {
        this.AdminID = AdminID;
        this.AdminPassword = AdminPassword;
        this.AdminName = AdminName;
    }

    public String getAdminID() {
        return AdminID;
    }

    public void setAdminID(String AdminID) {
        this.AdminID = AdminID;
    }

    public String getAdminPassword() {
        return AdminPassword;
    }

    public void setAdminPassword(String AdminPassword) {
        this.AdminPassword = AdminPassword;
    }

    public String getAdminName() {
        return AdminName;
    }

    public void setAdminName(String AdminName) {
        this.AdminName = AdminName;
    }
    
}
