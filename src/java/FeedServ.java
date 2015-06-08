import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class FeedServ extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String name,email,phone,sub,msg;
            name=request.getParameter("Text_Name");
            email=request.getParameter("Text_Mail");
            phone=request.getParameter("Text_Phone");
            sub=request.getParameter("Text_Subject");
            msg=request.getParameter("Text_Message");
            Connection con1;
            PreparedStatement stmt1;
            con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt1=con1.prepareStatement("insert into feedback values(?,?,?,?,?,(select curdate() from dual))");
            stmt1.setString(1, name);
            stmt1.setString(2, email);
            stmt1.setString(3, phone);
            stmt1.setString(4, sub);
            stmt1.setString(5, msg);
            stmt1.execute();
            EMail em=new EMail();
            em.set(email, "Thank you for your feedback. We will contact you via email and try our best to solve your problem", "Feedback for Illume Labs and Hospital");
            em.execute();
            response.sendRedirect("contact.html");
            } 
        catch(Exception e)
        {            
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="contact.html";
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
