/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import model.CustomerBill;

/**
 *
 * @author Mr Viet
 */
public class DaoCustomerBill extends DBConnect{
    
   public CustomerBill findCustomerBill(int customerId, int orderId) {
    CustomerBill rs = null;

    try {
        String query = "SELECT TOP 1 Customers.customerName, Customers.address, Customers.phone, Orders.orderDate "
                + "FROM Customers "
                + "JOIN Orders ON Customers.customerId = Orders.customerId "
                + "WHERE Customers.customerId = ? AND Orders.orderId = ?;";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, customerId);
            statement.setInt(2, orderId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String customerName = resultSet.getString("customerName");
                    String address = resultSet.getString("address");
                    String phone = resultSet.getString("phone");
                    Timestamp orderDateTimestamp = resultSet.getTimestamp("orderDate");
                    
                    // Chuyển đổi Timestamp thành String hoặc kiểu dữ liệu khác nếu cần
                    String orderDate = orderDateTimestamp != null ? orderDateTimestamp.toString() : null;

                    rs = new CustomerBill(customerName, address, phone, orderDate);
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return rs;
}

}
