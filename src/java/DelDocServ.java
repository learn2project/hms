import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class DelDocServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int doct_id,dept_id,age,fee;
            String dept,name,sex,address,email,degree,number;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con1,con2,con3,con4;
            PreparedStatement stmt1,stmt2,stmt3,stmt4;
            con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            con2=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt2=con2.prepareStatement("select * from doctor where id=?");
            ResultSet rs2,rs3;
            doct_id=Integer.parseInt(request.getParameter("doc"));
            stmt2.setInt(1, doct_id);
            rs2=stmt2.executeQuery();
            rs2.next();
            dept_id=rs2.getInt("dept_id");
            con3=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt3=con3.prepareStatement("select * from department where id=?");
            stmt3.setInt(1, dept_id);
            rs3=stmt3.executeQuery();
            rs3.next();
            dept=rs3.getString("name");
            name=rs2.getString("name");
            sex=rs2.getString("sex");
            age=rs2.getInt("age");
            number=rs2.getString("phone");
            address=rs2.getString("address");
            email=rs2.getString("email");
            degree=rs2.getString("degree");
            fee=rs2.getInt("fee");
            stmt1=con1.prepareStatement("insert into removeddoc values(?,?,?,?,?,?,?,?,?)");
            stmt1.setString(1, dept);
            stmt1.setString(2, name);
            stmt1.setString(3, sex);
            stmt1.setInt(4, age);
            stmt1.setString(5, number);
            stmt1.setString(6, address);
            stmt1.setString(7, email);
            stmt1.setString(8, degree);
            stmt1.setInt(9, fee);
            stmt1.executeUpdate();
            con4=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt4=con4.prepareStatement("delete from doctor where id=?");
            stmt4.setInt(1, doct_id);
            stmt4.execute();
            response.sendRedirect("doctor_admin_del_doc.jsp?msg=Doctor Deleted Successfully&nid=0");
            
        }
                catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="doctor_admin_del_doc.jsp";
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
