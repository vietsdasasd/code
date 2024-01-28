/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HP
 */
public class Category {
     private int categoriesId;
     private String categoriesName;

    public Category(int categoriesId, String categoriesName) {
        this.categoriesId = categoriesId;
        this.categoriesName = categoriesName;
    }

    public int getCategoriesId() {
        return categoriesId;
    }

    public void setCategoriesId(int categoriesId) {
        this.categoriesId = categoriesId;
    }

    public String getCategoriesName() {
        return categoriesName;
    }

    public void setCategoriesName(String categoriesName) {
        this.categoriesName = categoriesName;
    }

    @Override
    public String toString() {
        return "Category{" + "categoriesId=" + categoriesId + ", categoriesName=" + categoriesName + '}';
    }
     
}
