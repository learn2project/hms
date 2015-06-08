import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class AddBloodServ extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           Class.forName("com.mysql.jdbc.Driver");
           String group;
           int count=0;
           group=request.getParameter("Text_Group");
           count=Integer.parseInt(request.getParameter("Text_Count"));
           Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
           Connection con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
           PreparedStatement ps=con.prepareStatement("select * from bloodbank where bloodgroup=?");
           ps.setString(1, group);           
           ResultSet rs=ps.executeQuery();
           if(rs.next())
           {
               String group1=rs.getString(1);
               if(group.equals(group1))
               {
             int count1=rs.getInt(2);
             count1=count1+count;
             PreparedStatement ps1=con.prepareStatement("update bloodbank set count=? where bloodgroup=?");
             ps1.setInt(1, count1);
             ps1.setString(2, group);
             ps1.executeUpdate();
           }
           }
           else
           {
             PreparedStatement ps1=con.prepareStatement("insert into bloodbank values(?,?)");
             ps1.setString(1, group);
             ps1.setInt(2, count);
             ps1.executeUpdate();   
           }
               
           response.sendRedirect("blood_admin_add.jsp?msg=Record Added Successfully"); 
        }
    catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="blood_admin_add.jsp";
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
