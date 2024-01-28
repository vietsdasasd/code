/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Comparator;
import java.util.List;

/**
 *
 * @author Mr Viet
 */
public class OrderDetail {
    private int productId;
    private int orderItemId;
    
    private String imagePath;
    private String productName;
    private double price;
    private int quantity;
    private double total;
    public OrderDetail(int productId, int orderItemId, String imagePath, String productName, double price, int quantity, double total) {
        this.productId = productId;
        this.orderItemId = orderItemId;
        
        this.imagePath = imagePath;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

   

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
  
  
public static void sortByTotalAscending(List<OrderDetail> orderDetails) {
        orderDetails.sort(Comparator.comparing(OrderDetail::getTotal));
    }

    // Sắp xếp theo total giảm dần
    public static void sortByTotalDescending(List<OrderDetail> orderDetails) {
        orderDetails.sort(Comparator.comparing(OrderDetail::getTotal).reversed());
    }

    // Sắp xếp theo id tăng dần
    public static void sortByIdAscending(List<OrderDetail> orderDetails) {
        orderDetails.sort(Comparator.comparing(OrderDetail::getOrderItemId));
    }

    // Sắp xếp theo id giảm dần
    public static void sortByIdDescending(List<OrderDetail> orderDetails) {
        orderDetails.sort(Comparator.comparing(OrderDetail::getOrderItemId).reversed());
    }

   // Sắp xếp theo productName từ A-Z (không phân biệt hoa thường)
    public static void sortByProductNameAscending(List<OrderDetail> orderDetails) {
        orderDetails.sort(Comparator.comparing(o -> o.getProductName().toLowerCase().substring(0, 1)));
    }

    // Sắp xếp theo productName từ Z-A (không phân biệt hoa thường)
    public static void sortByProductNameDescending(List<OrderDetail> orderDetails) {
        orderDetails.sort(Comparator.comparing(o -> o.getProductName().toLowerCase().substring(0, 1), Comparator.reverseOrder()));
    }
   
  
}
