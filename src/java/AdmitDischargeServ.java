import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;;

/**
 *
 * @author Roni
 */
public class AdmitDischargeServ extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
           int id=Integer.parseInt(request.getParameter("Text_ID"));
           String day=request.getParameter("List_Day");
           String month=request.getParameter("List_Month");
           String year=request.getParameter("List_Year");
           String date=day+" "+month+" "+year;
           PreparedStatement ps1=con.prepareStatement("select * from admitdischarge where id=?");
           ps1.setInt(1, id);
           ResultSet rs=ps1.executeQuery();
           if(rs.next())
           {
                response.sendRedirect("in_admin_discharge.jsp?msg=Patient Already Discharged");
           }
           else
           {
           PreparedStatement ps=con.prepareStatement("insert into admitdischarge values(?,(select str_to_date(?,'%d %M %Y')))");
           ps.setInt(1, id);
           ps.setString(2, date);
           ps.execute();
           response.sendRedirect("in_admin_discharge.jsp?msg=Patient Discharged Successfully");
           }

        } 
        catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="in_admin_discharge.jsp?nid=0";
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
