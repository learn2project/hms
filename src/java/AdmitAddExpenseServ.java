import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class AdmitAddExpenseServ extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            int pid=Integer.parseInt(request.getParameter("Text_PId"));
            int test=Integer.parseInt(request.getParameter("List_Test"));
            String date=request.getParameter("List_Date");
            String month=request.getParameter("List_Month");
            String year=request.getParameter("List_Year");
            String d=date+" "+month+" "+year;
            PreparedStatement ps=con.prepareStatement("insert into admitpath values(?,?,(select str_to_date(?,'%d %M %Y')))");
            ps.setInt(1, pid);
            ps.setInt(2, test);
            ps.setString(3, d);
            ps.executeUpdate();
            response.sendRedirect("in_admin_add_expense.jsp?msg=Patient's Expense Added Successfully");  
            
        }
                catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="in_admin_add_expense.jsp";
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
