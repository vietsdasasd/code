
import java.util.ArrayList;
import java.util.List;
import model.OrderManager;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Mr Viet
 */
public class testExportToExel {
     public static void main(String[] args) {
        // Tạo danh sách đối tượng OrderManager (Mô phỏng dữ liệu từ database hoặc nguồn dữ liệu khác)
        List<OrderManager> orderList = new ArrayList<>();
        orderList.add(new OrderManager(1, "test@email.com", "123456789", "2022-01-16", 100.0, "Shipped", 1));
        orderList.add(new OrderManager(2, "another@email.com", "987654321", "2022-01-17", 150.0, "Processing", 2));

        // Đường dẫn tới file Excel
        String filePath = "D:/file.xlsx";


        // Gọi phương thức xuất Excel
        OrderManager.exportToExcel(orderList, filePath);
    }
}
