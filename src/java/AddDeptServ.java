import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class AddDeptServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String name;
            int id;
            name=request.getParameter("Text_Dept");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            PreparedStatement stmt;
            con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt=con.prepareStatement("select id from department where name=?");
            stmt.setString(1, name);
            ResultSet rs=stmt.executeQuery();
            if(rs.first())
                response.sendRedirect("doctor_admin_add_dept.jsp?msg=Already in Database");
            else
            {
            Connection con1,con2;
            PreparedStatement stmt1,stmt2;
            con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            con2=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt1=con1.prepareStatement("insert into department values(?,?)");
            stmt2=con2.prepareStatement("select max(id) from department");
            stmt1.setString(2, name);
            ResultSet rs1=stmt2.executeQuery();
            rs1.next();
            int new_id=rs1.getInt(1);
            new_id++;
            stmt1.setInt(1, new_id);
            stmt1.executeUpdate();
            response.sendRedirect("doctor_admin_add_dept.jsp?msg=Department Added Successfully");
            
            }
        }
                catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="doctor_admin_add_dept.jsp";
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
