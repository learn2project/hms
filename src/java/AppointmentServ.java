
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AppointmentServ extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            int doctor;
            con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            doctor=Integer.parseInt(request.getParameter("doc"));
            String pname=request.getParameter("Text_Name");
            String sex=request.getParameter("Radio_Sex");
            String age=request.getParameter("Text_Age");
            String ph=request.getParameter("Text_Phone");
            String address=request.getParameter("Text_Address");
            String email=request.getParameter("Text_Email");
            String year=request.getParameter("List_Year");
            String month=request.getParameter("List_Month");
            String date=request.getParameter("List_Date");
            String d=date+" "+month+" "+year;
            String payment=request.getParameter("Radio_Payment");
            PreparedStatement ps=con.prepareStatement("select dayname((select str_to_date(?,'%d %M %Y'))) day from dual");
            ps.setString(1,d);
            ResultSet rs=ps.executeQuery();
            rs.next();
            String dd=rs.getString("day");
            ps=con.prepareStatement("select day from schedule where id=?");
            ps.setInt(1, doctor);
            ResultSet rss=ps.executeQuery();
            boolean x=false;
            while(rss.next())
            {
                String dy=rss.getString("day");
                if(dy.equalsIgnoreCase(dd))
                {
                    x=true;
                    
                }
            }
            if(x)
            {
                ps=con.prepareStatement("select count from schedule where id=? and day=?");
                ps.setInt(1, doctor);
                ps.setString(2,dd);
                ResultSet rrs=ps.executeQuery();
                rrs.next();
                int cnt=rrs.getInt("count");
                ps=con.prepareStatement("select count(*) as cc from appointment where doctor=? and date=(select str_to_date(?,'%d %M %Y'))");
                ps.setInt(1, doctor);
                ps.setString(2, d);
                ResultSet rs1=ps.executeQuery();
                rs1.next();
                int cnt1=rs1.getInt("cc");
                if(cnt1<cnt)
                {
                    ps=con.prepareStatement("select max(id) max from appointment");
                    ResultSet rs2=ps.executeQuery();
                    rs2.next();
                    int iid=rs2.getInt("max");
                    iid++;
                    ps=con.prepareStatement("select fee from doctor where id=?");
                    ps.setInt(1, doctor);
                    ResultSet rs3=ps.executeQuery();
                    rs3.next();
                    int amtt=rs3.getInt("fee");
                    ps=con.prepareStatement("insert into appointment values(?,?,?,?,?,?,?,?,(select str_to_date(?,'%d %M %Y')),?,?,?)");
                    ps.setInt(1, iid);
                    ps.setString(2,pname);
                    ps.setString(3,sex);
                    ps.setString(4,age);
                    ps.setString(5,ph);
                    ps.setString(6,address);
                    ps.setString(7,email);
                    ps.setInt(8, doctor);
                    ps.setString(9,d);
                    ps.setInt(10,amtt);
                    ps.setString(11,payment);
                    ps.setString(12,"Pending");
                    ps.execute();
                    String mmsg="Your appointment is done successfully. ID number is :"+iid+" dated : "+d+". Contact us for any queires.";
                    EMail em=new EMail();
                    em.set(email,mmsg,"Appointment");
                    em.execute();
                    /*String num="";
                    if(ph.length()==10 || ph.length()==12)
                    {
                        if(ph.length()==10)
                                num="91"+ph+"@bulletinmessenger.net";
                    em.set(num, mmsg, "Appointment");
                    em.execute();
                    }*/
                    if(payment.equalsIgnoreCase("Net"))
                    {
                        response.sendRedirect("http://localhost:8084/Money_Bank/index.jsp?id="+iid+"&amount="+amtt);
                    }
                }
                else
                {
                    HttpSession session1 = request.getSession(true);
                    String msg,page1;
                    msg="Appointment full on selected date. Please try another date.";
                    page1="Appointment.jsp?nid=0";
                    session1.setAttribute("error", msg);
                    session1.setAttribute("page", page1);
                    response.sendRedirect("Error.jsp");
                }
            }
            else
            {
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg="Doctor not available on selected date";
                page1="Appointment.jsp?nid=0";
                session1.setAttribute("error", msg);
                session1.setAttribute("page", page1);
                response.sendRedirect("Error.jsp");
            }
            response.sendRedirect("Appointment.jsp?nid=0");
        } 
        catch(Exception e)
        {
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="Appointment.jsp?nid=0";
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
