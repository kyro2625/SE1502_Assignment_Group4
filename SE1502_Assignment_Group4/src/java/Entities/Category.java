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
public class Category {
    private String CategoryID;
    private String CategoryName;
    private String CategoryDescription;

    public Category() {
    }

    public Category(String CategoryID, String CategoryName, String CategoryDescription) {
        this.CategoryID = CategoryID;
        this.CategoryName = CategoryName;
        this.CategoryDescription = CategoryDescription;
    }

    public String getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(String CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public String getCategoryDescription() {
        return CategoryDescription;
    }

    public void setCategoryDescription(String CategoryDescription) {
        this.CategoryDescription = CategoryDescription;
    }
    
    
}
