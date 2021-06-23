/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class ProductErrorObject implements Serializable{
    private String idError, nameError, brandError, descriptionError, statusError, priceError, imageURL;

    public ProductErrorObject() {
    }

    public ProductErrorObject(String idError, String nameError, String brandError, String descriptionError, String statusError, String priceError, String imageURL) {
        this.idError = idError;
        this.nameError = nameError;
        this.brandError = brandError;
        this.descriptionError = descriptionError;
        this.statusError = statusError;
        this.priceError = priceError;
        this.imageURL = imageURL;
    }

    public String getIdError() {
        return idError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getBrandError() {
        return brandError;
    }

    public void setBrandError(String brandError) {
        this.brandError = brandError;
    }

    public String getDescriptionError() {
        return descriptionError;
    }

    public void setDescriptionError(String descriptionError) {
        this.descriptionError = descriptionError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }
    
    
}
