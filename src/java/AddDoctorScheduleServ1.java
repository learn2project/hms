import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class AddDoctorScheduleServ1 extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            int doctor=Integer.parseInt(request.getParameter("List_Doctor"));
            String day=request.getParameter("List_Day");
            String start1=request.getParameter("Start_1");
            String start2=request.getParameter("Start_2");
            String end1=request.getParameter("End_1");
            String end2=request.getParameter("End_2");
            int count=Integer.parseInt(request.getParameter("Text_Count"));
            String s=start1+" : "+start2+"Hrs.";
            String e=end1+" : "+end2+"Hrs.";
            PreparedStatement ps=con.prepareStatement("insert into schedule values(?,?,?,?,?)");
            ps.setInt(1, doctor);
            ps.setString(2, day);
            ps.setString(3, s);
            ps.setString(4, e);
            ps.setInt(5,count);
            ps.executeUpdate();
            /*String monday_start_1=request.getParameter("Monday_Start_1").toString();
            String monday_start_2=request.getParameter("Monday_Start_2").toString();
            String monday_end_1=request.getParameter("Monday_End_1").toString();
            String monday_end_2=request.getParameter("Monday_End_2").toString();
            String Tuesday_Start_1=request.getParameter("Tuesday_Start_1").toString();
            String Tuesday_Start_2=request.getParameter("Tuesday_Start_2").toString();
            String Tuesday_End_1=request.getParameter("Tuesday_End_1").toString();
            String Tuesday_End_2=request.getParameter("Tuesday_End_2").toString();
            String Wednesday_Start_1=request.getParameter("Wednesday_Start_1");
            String Wednesday_Start_2=request.getParameter("Wednesday_Start_2");
            String Wednesday_End_1=request.getParameter("Wednesday_End_1");
            String Wednesday_End_2=request.getParameter("Wednesday_End_2");
            String Thursday_Start_1=request.getParameter("Thursday_Start_1");
            String Thursday_Start_2=request.getParameter("Thursday_Start_2");
            String Thursday_End_1=request.getParameter("Thursday_End_1");
            String Thursday_End_2=request.getParameter("Thursday_End_2");
            String Friday_Start_1=request.getParameter("Friday_Start_1");
            String Friday_Start_2=request.getParameter("Friday_Start_2");
            String Friday_End_1=request.getParameter("Friday_End_1");
            String Friday_End_2=request.getParameter("Friday_End_2");
            String Saturday_Start_1=request.getParameter("Saturday_Start_1");
            String Saturday_Start_2=request.getParameter("Saturday_Start_2");
            String Saturday_End_1=request.getParameter("Saturday_End_1");
            String Saturday_End_2=request.getParameter("Saturday_End_2");
            String Sunday_Start_1=request.getParameter("Sunday_Start_1");
            String Sunday_Start_2=request.getParameter("Sunday_Start_2");
            String Sunday_End_1=request.getParameter("Sunday_End_1");
            String Sunday_End_2=request.getParameter("Sunday_End_2");
            String monday_start=monday_start_1+":"+monday_start_2+"Hrs.";
            String monday_end=monday_end_1+":"+monday_end_2+"Hrs.";
            String tuesday_start=Tuesday_Start_1+":"+Tuesday_Start_2+"Hrs.";
            String tuesday_end=Tuesday_End_1+":"+Tuesday_End_2+"Hrs.";
            String wednesday_start=Wednesday_Start_1+":"+Wednesday_Start_2+"Hrs.";
            String wednesday_end=Wednesday_End_1+":"+Wednesday_End_2+"Hrs.";
            String thursday_start=Thursday_Start_1+":"+Thursday_Start_2+"Hrs.";
            String thursday_end=Thursday_End_1+":"+Thursday_End_2+"Hrs.";
            String friday_start=Friday_Start_1+":"+Friday_Start_2+"Hrs.";
            String friday_end=Friday_End_1+":"+Friday_End_2+"Hrs.";
            String saturday_start=Saturday_Start_1+":"+Saturday_Start_2+"Hrs.";
            String saturday_end=Saturday_End_1+":"+Saturday_End_2+"Hrs.";
            String sunday_start=Sunday_Start_1+":"+Sunday_Start_2+"Hrs.";
            String sunday_end=Sunday_End_1+":"+Sunday_End_2+"Hrs.";
            if(!monday_start_1.equalsIgnoreCase("999"))
            {
            PreparedStatement ps=con.prepareStatement("insert into schedule values(?,?,?,'Monday')");
            ps.setInt(1, doctor);
            ps.setString(2, monday_start);
            ps.setString(3, monday_end);
            ps.executeUpdate();
            }
            if(!Tuesday_Start_1.equalsIgnoreCase("-999"))
            {
            PreparedStatement ps=con.prepareStatement("insert into schedule values(?,?,?,'Tuesday')");
            ps.setInt(1, doctor);
            ps.setString(2, tuesday_start);
            ps.setString(3, tuesday_end);
            ps.executeUpdate();
            }
            
            if(!Wednesday_Start_1.equalsIgnoreCase("-999"))
            {
            PreparedStatement ps=con.prepareStatement("insert into schedule values(?,?,?,'Wednesday')");
            ps.setInt(1, doctor);
            ps.setString(2, wednesday_start);
            ps.setString(3, wednesday_end);
            ps.executeUpdate();
            }
            if(!Thursday_Start_1.equalsIgnoreCase("-999"))
            {
            PreparedStatement ps=con.prepareStatement("insert into schedule values(?,?,?,'Thursday')");
            ps.setInt(1, doctor);
            ps.setString(2, thursday_start);
            ps.setString(3, thursday_end);
            ps.executeUpdate();
            }
            if(!Friday_Start_1.equalsIgnoreCase("-999"))
            {
            PreparedStatement ps=con.prepareStatement("insert into schedule values(?,?,?,'Friday')");
            ps.setInt(1, doctor);
            ps.setString(2, friday_start);
            ps.setString(3, friday_end);
            ps.executeUpdate();
            }
            if(!Saturday_Start_1.equalsIgnoreCase("-999"))
            {
            PreparedStatement ps=con.prepareStatement("insert into schedule values(?,?,?,'Saturday')");
            ps.setInt(1, doctor);
            ps.setString(2, saturday_start);
            ps.setString(3, saturday_end);
            ps.executeUpdate();
            }
            if(!Sunday_Start_1.equalsIgnoreCase("-999"))
            {
            PreparedStatement ps=con.prepareStatement("insert into schedule values(?,?,?,'Sunday')");
            ps.setInt(1, doctor);
            ps.setString(2, sunday_start);
            ps.setString(3, sunday_end);
            ps.executeUpdate();
            }
             */


            response.sendRedirect("doctor_admin_add_schedule.jsp?msg=Success&nid=0");
        }  catch(Exception e){
                HttpSession session1 = request.getSession(true);
                String msg,page1;
                msg=e.toString();
                page1="doctor_admin_add_schedule.jsp?nid=0";
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
