/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Roni
 */
public class UpTestServ extends HttpServlet {
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            int id=Integer.parseInt(request.getParameter("Hidden_Id"));
            PreparedStatement stmt=con.prepareStatement("delete from test where id=?");
            stmt.setInt(1,id);
            stmt.executeUpdate();
            String name=request.getParameter("Text_Name");
            int amount=Integer.parseInt(request.getParameter("Text_Amount"));
            String specimen=request.getParameter("Text_Specimen");
            String status=request.getParameter("List_Status");
            String delay=request.getParameter("Text_Delay");
            PreparedStatement stmt1=con.prepareStatement("insert into test values(?,?,?,?,?,?)");
            stmt1.setInt(1,id);
            stmt1.setString(2,name);
            stmt1.setInt(3,amount);
            stmt1.setString(4,specimen);
            stmt1.setString(5,status);
            stmt1.setString(6,delay);
            stmt1.executeUpdate();
            response.sendRedirect("test_admin_update.jsp?msg=Test Updated Successfully&nid=0");
            }
                catch(Exception e)
                {
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="test_admin_update.jsp";
                session1.setAttribute("error", msg);
                session1.setAttribute("page", page1);
                response.sendRedirect("Error.jsp");
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
        processRequest(request, response);
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
}
