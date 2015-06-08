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
public class AdmitPatientAddServ extends HttpServlet {

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
            int id=0;
            String name=request.getParameter("Text_Name");
            String sex=request.getParameter("Male");
            String age=request.getParameter("Text_Age");
            String phone=request.getParameter("Text_Phone");
            String address=request.getParameter("Text_Address");
            String refname=request.getParameter("Text_Refname");
            String refph=request.getParameter("Text_Refph");
            String email=request.getParameter("Text_Email");
	    	String disease=request.getParameter("Text_Disease");
            String day=request.getParameter("List_Day");
            String month=request.getParameter("List_Month");
            String year=request.getParameter("List_Year");
            String date=day+" "+month+" "+year;
            String idno=request.getParameter("Text_Idno");
            PreparedStatement ps1=con.prepareStatement("select max(id) id from admitpatient");
            ResultSet rs=ps1.executeQuery();
            rs.next();
            id=rs.getInt("id")+1;
            PreparedStatement ps=con.prepareStatement("insert into admitpatient values(?,?,?,?,?,?,?,?,?,?,(select str_to_date(?,'%d %M %Y')),?)");
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, sex);
            ps.setString(4, age);
            ps.setString(5, phone);
            ps.setString(6, address);
            ps.setString(7, refname);
            ps.setString(8, refph);
            ps.setString(9, email);
            ps.setString(10, disease);
            ps.setString(11, date);
            ps.setString(12, idno);
            ps.executeUpdate();
            response.sendRedirect("in_admin_add_patient.jsp?msg=Patient Added Successfully. Please note the ID for further reference. Id = "+id);

        }
         catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="in_admin_add_patient.jsp";
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
