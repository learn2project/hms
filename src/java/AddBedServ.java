import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class AddBedServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String name;
            int rate,capacity;
            name=request.getParameter("Text_Name");
            rate=Integer.parseInt(request.getParameter("Text_Rate"));
            capacity=Integer.parseInt(request.getParameter("Text_Capacity"));
            Connection con;
            PreparedStatement stmt;
            con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            Connection con1;
            PreparedStatement stmt1;
            con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt=con.prepareStatement("select * from bed where name=?");
            stmt.setString(1, name);
            ResultSet rs=stmt.executeQuery();
            if (rs.first())
            {
            //String name1=rs.getString("name");
            //int rate1=rs.getInt("rate");
            int capacity1=rs.getInt("max");
            //int count1=rs.getInt("count");
            capacity1=capacity1+capacity;
            stmt1=con1.prepareStatement("update bed set max=? where name=?");
            stmt1.setInt(1, capacity1); 
            stmt1.setString(2, name);
            stmt1.executeUpdate();
            }
            else
            {
            stmt1=con1.prepareStatement("insert into bed values(?,?,?)");
            stmt1.setString(1, name); 
            stmt1.setInt(2, rate);
            stmt1.setInt(3, capacity);
            stmt1.executeUpdate();
            }
            
            
            response.sendRedirect("bed_admin_add.jsp?msg=Bed Added Successfully");
            
            }
        
                catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="bed_admin_add.jsp";
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
