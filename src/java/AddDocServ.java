import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class AddDocServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            int id,age,fee;
            String name,sex,address,email,degree,number;
            id=Integer.parseInt(request.getParameter("List_Dept"));
            name=request.getParameter("Text_Name");
            sex=request.getParameter("RadioGroup1");
            age=Integer.parseInt(request.getParameter("Text_Age"));
            number=(request.getParameter("Text_Phone"));
            address=request.getParameter("Text_Address");
            email=request.getParameter("Text_Mail");
            degree=request.getParameter("Text_Degree");
            fee=Integer.parseInt(request.getParameter("Text_Fee"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection con1,con2;
            PreparedStatement stmt1,stmt2;
            con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            con2=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt1=con1.prepareStatement("insert into doctor values(?,?,?,?,?,?,?,?,?,?)");
            stmt2=con2.prepareStatement("select max(id) from doctor");
            ResultSet rs1=stmt2.executeQuery();
            rs1.next();
            int new_id=rs1.getInt(1);
            new_id++;
            stmt1.setInt(1, new_id);
            stmt1.setInt(2, id);
            stmt1.setString(3, name);
            stmt1.setString(4, sex);
            stmt1.setInt(5, age);
            stmt1.setString(6, number);
            stmt1.setString(7, address);
            stmt1.setString(8, email);
            stmt1.setString(9, degree);
            stmt1.setInt(10, fee);
            stmt1.executeUpdate();
            response.sendRedirect("doctor_admin_add_doc.jsp?msg=Doctor Added Successfully");
            
        }
                catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="doctor_admin_add_doc.jsp";
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
