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
public class Product {
    private String ProductID;
    private String ProductName;
    private String ProductBrand;
    private String ProductDescription;
    private String ProductStatus;
    private String Price;
    private String ImageURL;
    private String CategoryID;

    public Product() {
    }

    public Product(String ProductID, String ProductName, String ProductBrand, String ProductDescription, String ProductStatus, String Price, String ImageURL, String CategoryID) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ProductBrand = ProductBrand;
        this.ProductDescription = ProductDescription;
        this.ProductStatus = ProductStatus;
        this.Price = Price;
        this.ImageURL = ImageURL;
        this.CategoryID = CategoryID;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getProductBrand() {
        return ProductBrand;
    }

    public void setProductBrand(String ProductBrand) {
        this.ProductBrand = ProductBrand;
    }

    public String getProductDescription() {
        return ProductDescription;
    }

    public void setProductDescription(String ProductDescription) {
        this.ProductDescription = ProductDescription;
    }

    public String getProductStatus() {
        return ProductStatus;
    }

    public void setProductStatus(String ProductStatus) {
        this.ProductStatus = ProductStatus;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String ImageURL) {
        this.ImageURL = ImageURL;
    }

    public String getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(String CategoryID) {
        this.CategoryID = CategoryID;
    }
    
    
}
