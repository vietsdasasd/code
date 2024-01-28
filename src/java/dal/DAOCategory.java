/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import model.Category;
import model.Product;

/**
 *
 * @author HP
 */
public class DAOCategory extends DBConnect {
    public Vector<Category> getAllCategory() throws SQLException {
        String sql = "SELECT * from Categories";
        Vector<Category> list = new Vector<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category cat = new Category(
                        rs.getInt("categoriesId"),
                        rs.getString("categoriesName")
                );
                list.add(cat);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
