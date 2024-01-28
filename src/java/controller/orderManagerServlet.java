/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DaoOrder;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;
import model.OrderManager;
import javax.swing.*;

/**
 *
 * @author Mr Viet
 */
public class orderManagerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DaoOrder dao_order = new DaoOrder();
        List<OrderManager> orders = dao_order.getAllOrders();
        if(request.getParameter("service") != null){
            OrderManager.exportToExcel(orders, "D:/allOrders.xlsx");
        }
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("views/orderManager.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoOrder dao = new DaoOrder();
        List<OrderManager> orders = null;
        if (request.getParameter("order-date_start") != null && request.getParameter("order-date_end") != null) {
            String fromDate = request.getParameter("order-date_start");
            String toDate = request.getParameter("order-date_end");
            System.out.println(fromDate);

            orders = dao.getAllOrdersFilterDateAndWord(fromDate, toDate);

        } else if (request.getParameter("order-name_asc") != null) {
            orders = dao.getAllOrders();
            if (request.getParameter("order-name_asc").equals("Ascending")) {
                OrderManager.sortByTotalAscending(orders);
            } else {
                OrderManager.sortByTotalDescending(orders);
            }
        } else if (request.getParameter("order-date_asc") != null) {
            orders = dao.getAllOrders();
            if (request.getParameter("order-date_asc").equals("Ascending")) {
                OrderManager.sortByOrderDateAscending(orders);
            } else {
                OrderManager.sortByOrderDateDescending(orders);
            }
        } else if (request.getParameter("service").equals("delete")) {
            dao.deleteOrder(Integer.parseInt(request.getParameter("orderId")));
            orders = dao.getAllOrders();
        }
        System.out.println(request.getParameter("service"));
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("views/orderManager.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
