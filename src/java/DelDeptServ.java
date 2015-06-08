import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class DelDeptServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int doct_id,dept_id,age,fee;
            String dept,name,sex,address,email,degree,number,name1;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con1,con2,con3,con4,con5,con6;
            PreparedStatement stmt1,stmt2,stmt3,stmt4,stmt5,stmt6;
            con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            con2=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt2=con2.prepareStatement("select * from department where id=?");
            ResultSet rs1,rs2,rs3;
            dept_id=Integer.parseInt(request.getParameter("List_Dept"));
            stmt2.setInt(1, dept_id);
            rs2=stmt2.executeQuery();
            rs2.next();
            dept_id=rs2.getInt("id");
            name=rs2.getString("name");
            stmt1=con1.prepareStatement("insert into removeddept  values(?)");
            stmt1.setString(1, name);
            stmt1.executeUpdate();
            con4=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt4=con4.prepareStatement("delete from department where id=?");
            stmt4.setInt(1, dept_id);
            stmt4.execute();
            con3=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt3=con3.prepareStatement("select * from doctor where dept_id=?");
            stmt3.setInt(1, dept_id);
            rs3=stmt3.executeQuery();
            while(rs3.next())
            {
            dept=name;
            int did;
            did=rs3.getInt("id");
            name1=rs3.getString("name");
            sex=rs3.getString("sex");
            age=rs3.getInt("age");
            number=rs3.getString("phone");
            address=rs3.getString("address");
            email=rs3.getString("email");
            degree=rs3.getString("degree");
            fee=rs3.getInt("fee");
            con5=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt5=con5.prepareStatement("delete from doctor where id=?");
            stmt5.setInt(1, did);
            stmt5.executeUpdate();
            con6=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt6=con6.prepareStatement("insert into removeddoc values(?,?,?,?,?,?,?,?,?)");
            stmt6.setString(1, name);
            stmt6.setString(2, name1);
            stmt6.setString(3, sex);
            stmt6.setInt(4, age);
            stmt6.setString(5, number);
            stmt6.setString(6, address);
            stmt6.setString(7, email);
            stmt6.setString(8, degree);
            stmt6.setInt(9, fee);
            stmt6.executeUpdate();
            }
            response.sendRedirect("doctor_admin_del_dept.jsp?msg=Department Deleted Successfully");
            
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
