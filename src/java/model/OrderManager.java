/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;
import javafx.scene.control.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Mr Viet
 */
public class OrderManager implements Comparable<OrderManager> {

    int orderId;
    int customerId;
    String email;
    String phone;
    String orderDate;
    double total;
    String status;

    public OrderManager(int orderId, String email, String phone, String orderDate, double total, String status, int customerId) {
        this.orderId = orderId;
        this.phone = phone;
        this.orderDate = orderDate;
        this.total = total;
        this.status = status;
        this.email = email;
        this.customerId = customerId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public int compareTo(OrderManager otherOrder) {
        // Mặc định sắp xếp theo thứ tự tăng dần của total
        return Double.compare(this.total, otherOrder.getTotal());
    }

    // Phương thức sắp xếp theo thứ tự giảm dần của total
    public int compareToDescByTotal(OrderManager otherOrder) {
        return Double.compare(otherOrder.getTotal(), this.total);
    }

    // Phương thức sắp xếp theo thứ tự tăng dần của orderDate
    public int compareToAscByOrderDate(OrderManager otherOrder) {
        return compareByOrderDate(this.getOrderDate(), otherOrder.getOrderDate());
    }

    // Phương thức sắp xếp theo thứ tự giảm dần của orderDate
    public int compareToDescByOrderDate(OrderManager otherOrder) {
        return compareByOrderDate(otherOrder.getOrderDate(), this.getOrderDate());
    }

    public static void sortByTotalAscending(List<OrderManager> orderList) {
        Collections.sort(orderList);
    }

    public static void sortByTotalDescending(List<OrderManager> orderList) {
        orderList.sort(OrderManager::compareToDescByTotal);
    }

    public static void sortByOrderDateAscending(List<OrderManager> orderList) {
        Collections.sort(orderList, OrderManager::compareToAscByOrderDate);
    }

    public static void sortByOrderDateDescending(List<OrderManager> orderList) {
        orderList.sort(OrderManager::compareToDescByOrderDate);
    }

  private int compareByOrderDate(String date1, String date2) {
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    try {
        java.util.Date thisOrderDate = dateFormat.parse(date1);
        java.util.Date otherOrderDate = dateFormat.parse(date2);

        return thisOrderDate.compareTo(otherOrderDate);
    } catch (ParseException e) {
        e.printStackTrace();
        return 0;
    }
}

  
  public static void exportToExcel(List<OrderManager> orderList, String filePath) {
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Order Data");

        // Tạo hàng header
        Row headerRow = sheet.createRow(0);
        String[] headerColumns = {"Order ID", "Email", "Phone", "Order Date", "Total", "Status", "Customer ID"};
        for (int i = 0; i < headerColumns.length; i++) {
            org.apache.poi.ss.usermodel.Cell cell = headerRow.createCell(i);
            cell.setCellValue(headerColumns[i]);
        }

        // Đổ dữ liệu từ danh sách vào file Excel
        int rowNum = 1;
        for (OrderManager order : orderList) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(order.getOrderId());
            row.createCell(1).setCellValue(order.getEmail());
            row.createCell(2).setCellValue(order.getPhone());
            row.createCell(3).setCellValue(order.getOrderDate());
            row.createCell(4).setCellValue(order.getTotal());
            row.createCell(5).setCellValue(order.getStatus());
            row.createCell(6).setCellValue(order.getCustomerId());
        }

        // Ghi workbook vào file
        try (FileOutputStream fileOut = new FileOutputStream(filePath)) {
            workbook.write(fileOut);
            System.out.println("Excel file has been created successfully.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
  
}
//

/*
  public static void main(String[] args) {
        List<OrderManager> orderList = new ArrayList<>();
        // Thêm các đối tượng OrderManager vào danh sách

        // Sắp xếp danh sách theo orderDate (tăng dần)
        Collections.sort(orderList);

        // Sắp xếp danh sách theo orderDate (giảm dần)
        Collections.sort(orderList, OrderManager::compareToDesc);

        // Sắp xếp danh sách theo email (tăng dần)
        Collections.sort(orderList, OrderManager::compareToByEmail);

        // Sắp xếp danh sách theo email (giảm dần)
        Collections.sort(orderList, OrderManager::compareToByEmailDesc);

        // In danh sách đã sắp xếp
        for (OrderManager order : orderList) {
            System.out.println("Order ID: " + order.getOrderId() + ", Email: " + order.getEmail());
            // In các thông tin khác nếu cần
        }
 */
