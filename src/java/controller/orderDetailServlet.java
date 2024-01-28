/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DaoOrder;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.OrderDetail;

/**
 *
 * @author Mr Viet
 */
public class orderDetailServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet orderDetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet orderDetailServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));                          
        DaoOrder dao = new DaoOrder();
        List<OrderDetail> orderDetails = dao.getAllOrdersDetail(orderId);
        request.setAttribute("orderDetails", orderDetails);
        request.getRequestDispatcher("views/orderDetail.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DaoOrder dao = new DaoOrder();
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));

        List<OrderDetail> orderDetails = dao.getAllOrdersDetail(orderId);
        if(request.getParameter("order-name") != null){
            String req = request.getParameter("order-name");
            if(req.equals("asPrice")){
                OrderDetail.sortByTotalAscending(orderDetails);
            }else if(req.equals("desPrice")){
                OrderDetail.sortByTotalDescending(orderDetails);
            }else if(req.equals("asId")){
                OrderDetail.sortByIdAscending(orderDetails);
            }else if(req.equals("desId")){
                OrderDetail.sortByIdDescending(orderDetails);
            }
            else if(req.equals("asName")){
                OrderDetail.sortByProductNameAscending(orderDetails);
            }else{
                OrderDetail.sortByProductNameDescending(orderDetails);
            }
        }else if(request.getParameter("orderItemId") != null){
            dao.deleteOrderItem(Integer.parseInt(request.getParameter("orderItemId")));
            orderDetails = dao.getAllOrdersDetail(orderId);

        }
        
        request.setAttribute("orderId", orderId);
        request.setAttribute("customerId", customerId);
        request.setAttribute("orderDetails", orderDetails);
        request.getRequestDispatcher("views/orderDetail.jsp?orderId=" + orderId + "&customerId=" + customerId ).forward(request, response);
//response.sendRedirect("orderDetailServlet?orderId="+orderId+"&customerId=" + customerId);
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
