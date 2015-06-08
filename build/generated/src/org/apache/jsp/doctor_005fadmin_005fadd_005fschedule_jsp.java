package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;

public final class doctor_005fadmin_005fadd_005fschedule_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"UTF-8\">\r\n");
      out.write("\t<title>Admin | Illume</title>\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\">\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("<!--\r\n");
      out.write(".style2 {color: #009966}\r\n");
      out.write(".style3 {\r\n");
      out.write("\tfont-family: Verdana, Arial, Helvetica, sans-serif;\r\n");
      out.write("\tcolor: #333333;\r\n");
      out.write("}\r\n");
      out.write(".style11 {font-size: 30px}\r\n");
      out.write("-->\r\n");
      out.write("    </style>\r\n");
      out.write("     \r\n");
      out.write("    <script>\r\n");
      out.write("function adddept(str){\r\n");
      out.write("var rg=parseInt(str);\r\n");
      out.write("window.location.replace(\"http://localhost:8084/Hospital_Management_System/doctor_admin_add_schedule.jsp?nid=\"+rg);\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"header\">\r\n");
      out.write("\t\t<a href=# class=\"logo\"><img src=\"images/logo.png\" alt=\"\"></a>\r\n");
      out.write("\t    \r\n");
      out.write("  <ul>\r\n");
      out.write("\t\t\t<li>\r\n");
      out.write("\t\t\t\t<a href=\"admin.jsp\">Admin home page</a>\t\t\t</li>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<li>\r\n");
      out.write("\t\t\t\t<a href=\"index.jsp\">Logout</a>\t\t\t</li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"body\">\r\n");
      out.write(" ");

        String name="";
        try
        {
        	name=(session.getAttribute("user")).toString();
         }
         catch(Exception ee)
         {
         	response.sendRedirect("index.jsp");
         }
        if(name.equalsIgnoreCase("admin"))
        {


      out.write('\r');
      out.write('\n');

Connection conn = null;
ResultSet rs =null;
Statement st=null;
int vv=Integer.parseInt(request.getParameter("nid"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
st = conn.createStatement();
rs = st.executeQuery("select * from department");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<form method=\"post\" action=\"AddDoctorScheduleServ1\">\r\n");
      out.write("  <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"10\" cellspacing=\"10\">\r\n");
      out.write("  <tr>\r\n");
      out.write("     <td width=\"127\"><div align=\"right\"><span class=\"style3\">Department</span></div></td>\r\n");
      out.write("     <td><select name=\"dept\" id=\"dept\" onChange=\"adddept(this.value)\">\r\n");
      out.write("   ");
 while(rs.next())
   { 
   if(rs.getInt("id")==vv)
		{
	
      out.write("\r\n");
      out.write("\t\t\t<option value=\"");
      out.print(vv);
      out.write("\" selected disabled>");
      out.print(rs.getString("name"));
      out.write("</option>\r\n");
      out.write("\t");

		}
		else
		{
    
      out.write("\r\n");
      out.write("\t\t<option value=\"");
      out.print(rs.getInt("id"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("name"));
      out.write("</option>\r\n");
      out.write("\r\n");
      out.write("\t");
 
		
		}
	}
	
      out.write("\r\n");
      out.write("    </select></td>\r\n");
      out.write("   </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td><div align=\"right\"><span class=\"style3\">Doctor</span></div></td>\r\n");
      out.write("      <td width=\"145\"><select name=\"List_Doctor\" size=\"1\" id=\"List_Doctor\">\r\n");
      out.write("       ");

String id=request.getParameter("value");
rs=st.executeQuery("select * from doctor where dept_id=" + vv);
while(rs.next()){

      out.write("\r\n");
      out.write("<option value=\"");
      out.print(rs.getInt("id"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("name"));
      out.write("</option>\r\n");

}

      out.write("\r\n");
      out.write("      </select></td>\r\n");
      out.write("      <td colspan=\"2\">&nbsp;</td>\r\n");
      out.write("      </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"style3\"><div align=\"right\">Monday</div></td>\r\n");
      out.write("      <td><select name=\"monday_start_1\" size=\"1\" id=\"monday_start_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("      ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("        <option value=\"");
      out.print( i );
      out.write("\">   ");
      out.print( i );
      out.write("          </option>\r\n");
      out.write("        ");
 } 
      out.write("        \r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"monday_start_2\" size=\"1\" id=\"monday_start_2\">\r\n");
      out.write("          <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td colspan=\"2\"><select name=\"monday_end_1\" size=\"1\" id=\"monday_end_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"monday_end_2\" size=\"1\" id=\"monday_end_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"style3\"><div align=\"right\">Tuesday</div></td>\r\n");
      out.write("      <td><select name=\"tuesday_start_1\" size=\"1\" id=\"tuesday_start_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"tuesday_start_2\" size=\"1\" id=\"tuesday_start_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td colspan=\"2\"><select name=\"tuesday_end_1\" size=\"1\" id=\"tuesday_end_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"tuesday_end_2\" size=\"1\" id=\"tuesday_end_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td><div align=\"right\"><span class=\"style3\">Wednesday</span></div></td>\r\n");
      out.write("      <td><select name=\"wednesday_start_1\" size=\"1\" id=\"wednesday_start_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"wednesday_start_2\" size=\"1\" id=\"wednesday_start_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td width=\"184\"><select name=\"wednesday_end_1\" size=\"1\" id=\"wednesday_end_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"wednesday_end_2\" size=\"1\" id=\"wednesday_end_2\">\r\n");
      out.write("          <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td width=\"14\">&nbsp;</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td><div align=\"right\"><span class=\"style3\">Thursday</span></div></td>\r\n");
      out.write("      <td><select name=\"thursday_start_1\" size=\"1\" id=\"thursday_start_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"thursday_start_2\" size=\"1\" id=\"thursday_start_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td><select name=\"thursday_end_1\" size=\"1\" id=\"thursday_end_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"thursday_end_2\" size=\"1\" id=\"thursday_end_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td>&nbsp;</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td><div align=\"right\"><span class=\"style3\">Friday</span></div></td>\r\n");
      out.write("      <td><select name=\"friday_start_1\" size=\"1\" id=\"friday_start_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"friday_start_2\" size=\"1\" id=\"friday_start_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td><select name=\"friday_end_1\" size=\"1\" id=\"friday_end_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"friday_end_2\" size=\"1\" id=\"friday_end_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td>&nbsp;</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td width=\"127\"><div align=\"right\"><span class=\"style3\">Saturday</span></div></td>\r\n");
      out.write("      <td><select name=\"saturday_start_1\" size=\"1\" id=\"saturday_start_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"saturday_start_2\" size=\"1\" id=\"saturday_start_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td><select name=\"saturday_end_1\" size=\"1\" id=\"saturday_end_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"saturday_end_2\" size=\"1\" id=\"saturday_end_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td>&nbsp;</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td><div align=\"right\"><span class=\"style3\">Sunday</span></div></td>\r\n");
      out.write("      <td><select name=\"sunday_start_1\" size=\"1\" id=\"sunday_start_1\">\r\n");
      out.write("      <option value=-999> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"sunday_start_2\" size=\"1\" id=\"sunday_start_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td><select name=\"sunday_end_1\" size=\"1\" id=\"sunday_end_1\">\r\n");
      out.write("      <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=23;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("        <span class=\"style11\">:</span>\r\n");
      out.write("        <select name=\"sunday_end_2\" size=\"1\" id=\"sunday_end_2\">\r\n");
      out.write("        <option value=-999 selected disabled> NA </option>\r\n");
      out.write("          ");

	  	for (int i=00;i<=59;i++)
		{
		
      out.write("\r\n");
      out.write("          <option value=\"");
      out.print( i );
      out.write("\"> ");
      out.print( i );
      out.write(" </option>\r\n");
      out.write("          ");
 } 
      out.write("\r\n");
      out.write("        </select></td>\r\n");
      out.write("      <td>&nbsp;</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <td>&nbsp;</td>\r\n");
      out.write("      <td colspan=\"2\"><div align=\"center\">\r\n");
      out.write("        <input name=\"submit2\" type=\"submit\" class=\"box-orange\" id=\"submit2\" value=\" ADD \">        \r\n");
      out.write("      </div>        <label></label></td>\r\n");
      out.write("      <td>&nbsp;</td>\r\n");
      out.write("    </table> \r\n");
      out.write("  </form>\r\n");
      out.write("    <div align=\"center\" class=\"style2\">\r\n");
      out.write("      <p>&nbsp;</p>\r\n");
      out.write("      <p>\r\n");
      out.write("        ");

  String s;
  s=request.getParameter("msg");
  out.write(s);
  
      out.write("\r\n");
      out.write("      </p>\r\n");
      out.write("    </div>\r\n");
      out.write("  <p>&nbsp;</p>\r\n");
      out.write("  \r\n");
      out.write("  ");

  }
  
  else
  {
  response.sendRedirect("admin_login.jsp");
  }
  
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"footer\">\r\n");
      out.write("\t\t<div>\r\n");
      out.write("\t\t\t<p>\r\n");
      out.write("\t\t\t\t<span>2013 &copy; Illume labs &amp; hospital</span><a href=\"terms.html\" >Terms of Service</a> | <a href=\"policy.html\" >Privacy Policy</a> | <a href=\"faq.html\" >FAQ</a> | <a href=\"admin_login.jsp\" >Admin Login</a>\r\n");
      out.write("\t\t\t</p>\r\n");
      out.write("\t\t\t<ul>\r\n");
      out.write("\t\t\t\t<li id=\"facebook\">\r\n");
      out.write("\t\t\t\t\t<a href=\"http://www.facebook.com/\">facebook</a>\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t<li id=\"twitter\">\r\n");
      out.write("\t\t\t\t\t<a href=\"http://www.twitter.com/\">twitter</a>\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t<li id=\"googleplus\">\r\n");
      out.write("\t\t\t\t\t<a href=\"http://www.google.com\">googleplus</a>\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
