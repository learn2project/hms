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


public class AdmitAllocateBedServ extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            PreparedStatement ps,ps1;
            con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            int pid=Integer.parseInt(request.getParameter("Text_ID"));
            String bedid=(request.getParameter("List_Bed"));            
            String day=request.getParameter("List_Day");
            String month=request.getParameter("List_Month");
            String year=request.getParameter("List_Year");
            String date=day+" "+month+" "+year;
            String day1=request.getParameter("List_Day1");
            String month1=request.getParameter("List_Month1");
            String year1=request.getParameter("List_Year1");
            String date1=day1+" "+month1+" "+year1;
            ps1=con.prepareStatement("select * from bed where name=?");
            ps1.setString(1,bedid);
            ResultSet rs=ps1.executeQuery();
            rs.next();
            int fee=rs.getInt("rate");
            ps=con.prepareStatement("insert into bedentry values(?,?,(select str_to_date(?,'%d %M %Y')),(select str_to_date(?,'%d %M %Y')),?)");
            ps.setInt(1,pid);
            ps.setString(2,bedid);
            ps.setString(3,date);
            ps.setString(4,date1);
            ps.setInt(5,fee);
            ps.execute();
            response.sendRedirect("in_admin_allocate_bed.jsp?msg=Allocated Successfully");
            
            }
        
                catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="in_admin_allocate_bed.jsp";
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
