import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class DelBedServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String name;
            int capacity;
            name=request.getParameter("List_Name");
            capacity=Integer.parseInt(request.getParameter("Text_Max"));
            Connection con,con1;
            PreparedStatement stmt,stmt1;
            con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt=con.prepareStatement("select * from bed where name=?");
            stmt.setString(1, name);
            ResultSet rs=stmt.executeQuery();
            rs.next();
            capacity = rs.getInt("max")- capacity;
            con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt1=con1.prepareStatement("update bed set max=? where name=?");
            stmt1.setInt(1, capacity);
            stmt1.setString(2, name);
            stmt1.executeUpdate();
            
        
            
            response.sendRedirect("bed_admin_free.jsp?msg=Bed Removed Successfully");
            
            }
        
                catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="bed_admin_free.jsp";
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
