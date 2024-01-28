/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Product;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author HP
 */
public class ProductDAO extends DBConnect {
    //hien thi ban hang

    public Vector<Product> getAllProduct() throws SQLException {
        String sql = "SELECT P.*, I.imagePath\n"
                + "FROM Products P\n"
                + "OUTER APPLY (\n"
                + "    SELECT TOP 1 imagePath\n"
                + "    FROM Images I\n"
                + "    WHERE I.productId = P.productId\n"
                + "    ORDER BY I.createDate\n"
                + ") I;";
        Vector<Product> list = new Vector<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("productId"),
                        rs.getInt("available"),
                        rs.getInt("discount"),
                        rs.getInt("categoriesId"),
                        rs.getBoolean("isActive"),
                        rs.getString("productName"),
                        rs.getDouble("listPrice"),
                        rs.getString("imagePath")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public Product getProductById(int proId) throws SQLException {
        String sql = "SELECT P.*, I.imagePath\n"
                + "FROM Products P\n"
                + "OUTER APPLY (\n"
                + "    SELECT TOP 1 imagePath\n"
                + "    FROM Images I\n"
                + "    WHERE I.productId = P.productId\n"
                + "    ORDER BY I.createDate\n"
                + ") I where P.productId = ?;";
        Product p = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, proId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p = new Product(
                        rs.getInt("productId"),
                        rs.getInt("available"),
                        rs.getInt("discount"),
                        rs.getInt("categoriesId"),
                        rs.getBoolean("isActive"),
                        rs.getString("productName"),
                        rs.getDouble("listPrice"),
                        rs.getString("imagePath")
                );
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return p;
    }
    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        try {
            for (Product arg : p.getAllProduct()) {
            System.out.println(arg);
        }
        } catch (Exception e) {
        }
    }
}
