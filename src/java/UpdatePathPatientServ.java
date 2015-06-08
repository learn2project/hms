import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class UpdatePathPatientServ extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            Connection con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            int id=Integer.parseInt(request.getParameter("Text_Id"));
            String name=request.getParameter("Text_Name");
            String sex=request.getParameter("Radio_Sex");
            String age=request.getParameter("Text_Age");
            String phone=request.getParameter("Text_Phone");
            String address=request.getParameter("Text_Address");
            String doctor=request.getParameter("Text_Doctor");
            PreparedStatement ps=con.prepareStatement("delete from pathologypatient where id=?");
            ps.setInt(1,id);
            ps.executeUpdate();
            PreparedStatement ps1=con.prepareStatement("insert into pathologypatient values(?,?,?,?,?,?,?)");
            ps1.setInt(1, id);
            ps1.setString(2, name);
            ps1.setString(3, sex);
            ps1.setString(4, age);
            ps1.setString(5, phone);
            ps1.setString(6, address);
            ps1.setString(7, doctor);
            ps1.executeUpdate();
          response.sendRedirect("path_admin_update_patient.jsp?msg=Patient Updated Successfully&nid=0&msg1="+id);     
        }  
        catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="path_admin_update_patient.jsp&nid=0";
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
