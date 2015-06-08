import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class AddTestServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con2=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            PreparedStatement stmt2=con2.prepareStatement("select id from test where name=?");
            String name=request.getParameter("Text_Name");
            stmt2.setString(1, name);
            ResultSet rs2=stmt2.executeQuery();
            if(rs2.first())
                response.sendRedirect("test_admin_add.jsp?msg=Already in Database");
            else
            {
                Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
                Connection con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
		int amount=Integer.parseInt(request.getParameter("Text_Amount"));
		String specimen=request.getParameter("Text_Specimen");
		String status=request.getParameter("List_Status");
		String delay=request.getParameter("Text_Delay");		
		PreparedStatement stmt1=con1.prepareStatement("select max(id) from test");
		ResultSet rs1=stmt1.executeQuery();
                rs1.next();
		int id=rs1.getInt(1);
		id++;
		PreparedStatement stmt=con.prepareStatement("insert into test values (?,?,?,?,?,?)");
		stmt.setInt(1,id);
		stmt.setString(2,name);
		stmt.setInt(3,amount);
		stmt.setString(4,specimen);
		stmt.setString(5,status);
		stmt.setString(6,delay);
		stmt.executeUpdate();
                response.sendRedirect("test_admin_add.jsp?msg=Test Added Successfully");
            
            }
        }
                catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="test_admin_add.jsp";
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
