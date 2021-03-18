/*
 * To change this license header, choose License Headers in project properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author cong :)
 */

// Mot dat ten thuoc tinh thi chu dau tien viet thuong ko la con meo no troll :)
public class Product {
    private int productID; // ???
    private String productName; //???
    private String productBrand;
    private String productDescription;
    private String productStatus;
    private float price;
    private String imageURL; // photo???
    private String CategoryID;

    public Product() {
    }

    public Product(int productID, String productName, String productBrand, String productDescription, String productStatus, float price, String imageURL, String CategoryID) {
        this.productID = productID;
        this.productName = productName;
        this.productBrand = productBrand;
        this.productDescription = productDescription;
        this.productStatus = productStatus;
        this.price = price;
        this.imageURL = imageURL;
        this.CategoryID = CategoryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductBrand() {
        return productBrand;
    }

    public void setProductBrand(String productBrand) {
        this.productBrand = productBrand;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(String CategoryID) {
        this.CategoryID = CategoryID;
    }
    
    
}
