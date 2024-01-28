/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBConnect;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.OrderManager;

/**
 *
 * @author Mr Viet
 */
public class DaoOrder extends DBConnect {

    //hàm lấy ra tất cả các order
    //cho orderManager
    public List<OrderManager> getAllOrders() {
        List<OrderManager> orders = new ArrayList<>();

        try {
            String query = "SELECT orderId, customerId, orderDate, status"
                    + " FROM Orders";
            try ( PreparedStatement statement = connection.prepareStatement(query)) {
                try ( ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int orderId = resultSet.getInt("orderId");

                        String[] mailAndPhone = findEmailAndPhoneNumberByCustomerId(resultSet.getInt("customerId"));
                        int customerId = resultSet.getInt("customerId");
                        String mail = mailAndPhone[0];
                        String phone = mailAndPhone[1];

                        String orderDate = resultSet.getString("orderDate");

                        double total = findTotalPrice(orderId);
                        String status = resultSet.getString("status");
                        orders.add(new OrderManager(orderId, mail, phone, orderDate, total, status, customerId));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    // hàm filter
    public List<OrderManager> getAllOrdersFilterDateAndWord(String fromDate, String toDate) {
        List<OrderManager> orders = new ArrayList<>();

        try {
            String query = " SELECT o.orderId, c.email AS mail, c.phone, o.orderDate, o.status, o.customerId "
                    + "FROM Orders o "
                    + "JOIN Customers c ON o.customerId = c.customerId "
                    + "WHERE c.customerName LIKE '%' "
                    + "  AND ("
                    + "    (ISDATE(o.orderDate) = 1 AND TRY_CAST(o.orderDate AS DATETIME) BETWEEN ? AND ?) "
                    + "  ); ";

            try ( PreparedStatement statement = connection.prepareStatement(query)) {

                statement.setString(1, fromDate);
                statement.setString(2, toDate);
                try ( ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int orderId = resultSet.getInt("orderId");
                        String mail = resultSet.getString("mail");
                        String phone = resultSet.getString("phone");
                        int customerId = resultSet.getInt("customerId");

                        String orderDate = resultSet.getString("orderDate");

                        double total = findTotalPrice(orderId);
                        String status = resultSet.getString("status");
                        orders.add(new OrderManager(orderId, mail, phone, orderDate, total, status, customerId));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;

    }

    public String[] findEmailAndPhoneNumberByCustomerId(int id) {
        String[] rs = new String[2];

        try {
            String query = "SELECT email, phone "
                    + "FROM Customers WHERE customerId = ?";
            try ( PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, id);

                try ( ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        rs[0] = resultSet.getString("email");
                        rs[1] = resultSet.getString("phone");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    public double findTotalPrice(int orderId) {
        double rs = 0;

        try {
            String query = "SELECT listPrice, discount, quantity "
                    + "FROM OrderItems WHERE orderId = ?";
            try ( PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, orderId);
                try ( ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        double price = resultSet.getDouble("listPrice");
                        int discount = resultSet.getInt("discount");
                        int quantity = resultSet.getInt("quantity");

                        rs += quantity * (price - ((price / 100) * discount));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    public void deleteOrder(int orderId) {
        deleteOrderItems(orderId);
        try {
            String query = "DELETE FROM Orders WHERE orderId = ?";
            try ( PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, orderId);
                int affectedRows = statement.executeUpdate();

                // Kiểm tra xem có bao nhiêu dòng bị ảnh hưởng (đã bị xóa)
                if (affectedRows > 0) {
                    System.out.println(affectedRows + " row(s) deleted successfully.");
                } else {
                    System.out.println("No rows deleted. The specified orderId may not exist.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//cho orderDetail
//    public List<OrderDetail> getAllOrdersDetail(int orderId) {
//        List<OrderDetail> orders = new ArrayList<>();
//
//        try {
//            String query = "SELECT productId, orderItemId, orderId, listPrice, discount, quantity"
//                    + " FROM OrderItems "
//                    + " WHERE orderId = ?";
//            try ( PreparedStatement statement = connection.prepareStatement(query)) {
//                statement.setInt(1, orderId);
//                try ( ResultSet resultSet = statement.executeQuery()) {
//                    while (resultSet.next()) {
//                        int orderItemsId = resultSet.getInt("orderItemId");
//                        int productId = resultSet.getInt("productId");
//                        
//                        String imagePath = getImagePathProduct(productId);
//                        String productName = getProductName(productId);
//                       
//                        double price = resultSet.getDouble("listPrice");
//                        int discount = resultSet.getInt("discount");
//                        int quantity = resultSet.getInt("quantity");
//                        
//                        double total = quantity * (price - ((price / 100) * discount));
//                        
//                        orders.add(new OrderDetail(productId, orderItemsId, imagePath, productName, price, quantity, total));
//                    }
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return orders;
//    }
    public void deleteOrderItems(int orderId) {
        try {
            String query = "DELETE FROM OrderItems WHERE orderId = ?";
            try ( PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, orderId);
                int affectedRows = statement.executeUpdate();

                // Kiểm tra xem có bao nhiêu dòng bị ảnh hưởng (đã bị xóa)
                if (affectedRows > 0) {
                    System.out.println(affectedRows + " row(s) deleted successfully.");
                } else {
                    System.out.println("No rows deleted. The specified orderId may not exist.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<OrderDetail> getAllOrdersDetail(int orderId) {
        List<OrderDetail> orders = new ArrayList<>();

        try {
            String query = "SELECT Products.productId, OrderItems.orderItemId, MIN(Images.imagePath) AS imagePath, Products.productName, OrderItems.listPrice AS price, OrderItems.discount, OrderItems.quantity "
                    + " FROM Orders "
                    + " JOIN OrderItems ON Orders.orderId = OrderItems.orderId "
                    + " JOIN Products ON OrderItems.productId = Products.productId "
                    + " LEFT JOIN Images ON Products.productId = Images.productId "
                    + " WHERE Orders.orderId = ? "
                    + " GROUP BY Products.productId, OrderItems.orderItemId, Products.productName, OrderItems.listPrice, OrderItems.discount, OrderItems.quantity";
            try ( PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, orderId);
                try ( ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int orderItemsId = resultSet.getInt("orderItemId");
                        int productId = resultSet.getInt("productId");

                        String imagePath = resultSet.getString("imagePath");
                        String productName = resultSet.getString("productName");

                        double price = resultSet.getDouble("price");
                        int discount = resultSet.getInt("discount");
                        price = (price - ((price / 100) * discount));

                        int quantity = resultSet.getInt("quantity");

                        double total = quantity * price;

                        orders.add(new OrderDetail(productId, orderItemsId, imagePath, productName, price, quantity, total));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    public String getImagePathProduct(int productId) {
        String rs = "";

        try {
            String query = "SELECT imagePath"
                    + " FROM Images "
                    + " WHERE productId = ?"
                    + " LIMIT 1"; // Chỉ lấy một bản ghi đầu tiên

            try ( PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, productId);
                try ( ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        rs = resultSet.getString("imagePath");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    public String getProductName(int productId) {
        String rs = "";

        try {
            String query = "SELECT productName"
                    + " FROM Products "
                    + " WHERE productId = ?"
                    + " LIMIT 1"; // Chỉ lấy một bản ghi đầu tiên

            try ( PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, productId);
                try ( ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        rs = resultSet.getString("productName");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    //hàm xóa đi orderItem theo id
    public void deleteOrderItem(int orderItemId) {
        try {
            String query = "DELETE FROM OrderItems WHERE orderItemId = ?";
            try ( PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, orderItemId);

                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Đã xóa thành công hàng có orderItemId = " + orderItemId);
                } else {
                    System.out.println("Không tìm thấy hàng để xóa với orderItemId = " + orderItemId);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
