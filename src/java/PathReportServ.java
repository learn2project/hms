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
public class PathReportServ extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            int id=Integer.parseInt(request.getParameter("Text_Id"));
            int test=Integer.parseInt(request.getParameter("List_Test"));
            String d=request.getParameter("List_Date");
            String m=request.getParameter("List_Month");
            String y=request.getParameter("List_Year");
            String dd=d+" "+m+" "+y;
            String res=request.getParameter("Text_Result");
            String per=request.getParameter("Text_Perform");
            PreparedStatement ps=con.prepareStatement("insert into testreport values (?,?,(select str_to_date(?,'%d %M %Y')),?,?)");
            ps.setInt(1, id);
            ps.setInt(2, test);
            ps.setString(3,dd);
            ps.setString(4,res);
            ps.setString(5,per);
            ps.executeUpdate();
            PreparedStatement ps1=con.prepareStatement("update pathologytestdetails set report='Delivered' where patientid=? and testid=?");
            ps1.setInt(1, id);
            ps1.setInt(2,test);
            ps1.executeUpdate();
            response.sendRedirect("path_admin_make_report.jsp?msg=Report Generated Successfully&nid=0");     
        }  
        catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="path_admin_make_report.jsp?nid=0";
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
