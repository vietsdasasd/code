/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAOCategory;
import dal.ProductDAO;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Vector;
import model.Category;

/**
 *
 * @author HP
 */
@WebServlet(name="ProductServlet", urlPatterns={"/ProductServlet"})
public class ProductServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ProductServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductServlet at " + request.getContextPath () + "</h1>");
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
        ProductDAO proDao = new ProductDAO();
        DAOCategory catDao = new DAOCategory();
        try {
            String service = request.getParameter("Service");
            if (service == null) {
                service = "getAll";
            }
            //default will getAll
            if (service.equals("getAll")) {
                Vector<Product> listProduct = new Vector<>();
                Vector<Category> listCategory = new Vector<>();
                listProduct = proDao.getAllProduct();
                listCategory = catDao.getAllCategory();
                request.setAttribute("listProduct", listProduct);
                request.setAttribute("listCategory", listCategory);
                request.getRequestDispatcher("/views/home.jsp").forward(request, response);
            }
            if (service.equals("proDetail")) {
                String proId = request.getParameter("proId");
                Product proDetail = proDao.getProductById(Integer.parseInt(proId));
                 request.setAttribute("proDetail", proDetail);
                 request.getRequestDispatcher("/views/productDetail.jsp").forward(request, response);
            }
        }catch (SQLException e) {
            System.out.println(e);
        }
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
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public static void main(String[] args) {
        ProductDAO proDao = new ProductDAO();
        try {
            Product proDetail = proDao.getProductById(1);
            System.out.println(proDetail);
        } catch (Exception e) {
        }
    }
}
