/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author HP
 */
public class Product {
    private int productId, available, discount, categoriesId, createBy, modifiedBy;
    private boolean isActive;
    private String productName;
    private double listPrice;
    private Date createDate, modifiedDate;
    private String imagePath;

    public Product(int productId, int available, int discount, int categoriesId, boolean isActive, String productName, double listPrice, String imagePath) {
        this.productId = productId;
        this.available = available;
        this.discount = discount;
        this.categoriesId = categoriesId;
        this.isActive = isActive;
        this.productName = productName;
        this.listPrice = listPrice;
        this.imagePath = imagePath;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getCategoriesId() {
        return categoriesId;
    }

    public void setCategoriesId(int categoriesId) {
        this.categoriesId = categoriesId;
    }

    public int getCreateBy() {
        return createBy;
    }

    public void setCreateBy(int createBy) {
        this.createBy = createBy;
    }

    public int getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(int modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getListPrice() {
        return listPrice;
    }

    public void setListPrice(double listPrice) {
        this.listPrice = listPrice;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
public String getPrice() {
        String formattedPrice = String.format("%,.0f", listPrice);
        formattedPrice = formattedPrice.replace(",", ".");
        return formattedPrice;
    }
    
    public String getPriceAfterDiscount() {
        double productPrice = listPrice*(1-discount*0.01);
        String formattedPrice = String.format("%,.0f", productPrice);
        formattedPrice = formattedPrice.replace(",", ".");
        return formattedPrice;
    }
    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", available=" + available + ", discount=" + discount + ", categoriesId=" + categoriesId + ", createBy=" + createBy + ", modifiedBy=" + modifiedBy + ", isActive=" + isActive + ", productName=" + productName + ", listPrice=" + listPrice + ", createDate=" + createDate + ", modifiedDate=" + modifiedDate + ", imagePath=" + imagePath + '}';
    }

    
    
    
}
