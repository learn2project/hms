package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class doctor_005fadmin_005fadd_005fdoc_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE HTML>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"UTF-8\">\r\n");
      out.write("\t<title>Add Doctor</title>\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\">\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("<!--\r\n");
      out.write(".style1 {\r\n");
      out.write("\tfont-family: Verdana, Arial, Helvetica, sans-serif;\r\n");
      out.write("\tcolor: #333333;\r\n");
      out.write("}\r\n");
      out.write("-->\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"header\">\r\n");
      out.write("\t\t<a href=\"index.jsp\" class=\"logo\"><img src=\"images/logo.png\" alt=\"\"></a>\r\n");
      out.write("\t\t<ul>\r\n");
      out.write("\t\t\t<li>\r\n");
      out.write("\t\t\t\t<a href=\"index.html\">home</a>\t\t\t</li>\r\n");
      out.write("\t\t\t<li>\r\n");
      out.write("\t\t\t\t<a href=\"about.html\">about</a>\t\t\t</li>\r\n");
      out.write("\t\t\t<li>\r\n");
      out.write("\t\t\t\t<a href=\"services.html\">services</a>\t\t\t</li>\r\n");
      out.write("\t\t\t<li>\r\n");
      out.write("\t\t\t\t<a href=\"schedule.html\">Schedule &amp; Fees</a>\t\t\t</li>\r\n");
      out.write("\t\t\t<li>\r\n");
      out.write("\t\t\t\t<a href=\"contact.html\">contact</a>\t\t\t</li>\r\n");
      out.write("\t\t\t<li>\r\n");
      out.write("\t\t\t\t<a href=\"notice.html\">News Room</a>\t\t\t</li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"body\">\r\n");
      out.write("  <p>&nbsp;</p>\r\n");
      out.write("  <form method=\"post\" action=\"\">\r\n");
      out.write("  <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"10\" cellspacing=\"10\">\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"style1\"><div align=\"right\">Department</div></td>\r\n");
      out.write("      <td width=\"420\"><label>\r\n");
      out.write("        <select name=\"List_Dept\" id=\"List_Dept\">\r\n");
      out.write("         ");

         Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            PreparedStatement stmt;
            con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt=con.prepareStatement("select * from department order by name");
            ResultSet rs=stmt.executeQuery();
            while(rs.next())
            {
                int did=rs.getInt(1);
                String dname=rs.getString(2);
         
      out.write("\r\n");
      out.write("\r\n");
      out.write("                <option value=");
      out.print(did);
      out.write(" selected>");
      out.print(dname);
      out.write("</option>\r\n");
      out.write("                  ");

            }
            
      out.write("\r\n");
      out.write("        </select>\r\n");
      out.write("      </label></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"style1\"><div align=\"right\">Name</div></td>\r\n");
      out.write("      <td><label>\r\n");
      out.write("        <input name=\"Text_Name\" type=\"text\" id=\"Text_Name\" size=\"50\">\r\n");
      out.write("      </label></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td><div align=\"right\" class=\"style1\">Sex</div></td>\r\n");
      out.write("      <td><p>\r\n");
      out.write("        <label>\r\n");
      out.write("          <input type=\"radio\" name=\"RadioGroup1\" value=\"male\" id=\"RadioGroup1_0\">\r\n");
      out.write("          Male</label>\r\n");
      out.write("        <label>\r\n");
      out.write("          <input type=\"radio\" name=\"RadioGroup1\" value=\"female\" id=\"RadioGroup1_1\">\r\n");
      out.write("          Female</label>\r\n");
      out.write("        <br>\r\n");
      out.write("      </p></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td><div align=\"right\" class=\"style1\">Age</div></td>\r\n");
      out.write("      <td><label>\r\n");
      out.write("        <input name=\"Text_Age\" type=\"text\" id=\"Text_Age\" size=\"10\">\r\n");
      out.write("      </label></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"style1\"><div align=\"right\">Phone Number</div></td>\r\n");
      out.write("      <td><label>\r\n");
      out.write("        <input name=\"Text_Phone\" type=\"text\" id=\"Text_Phone\" size=\"50\">\r\n");
      out.write("      </label></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td><div align=\"right\" class=\"style1\">Address</div></td>\r\n");
      out.write("      <td><input name=\"Text_Address\" type=\"text\" id=\"Text_Address\" size=\"65\"></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td><div align=\"right\" class=\"style1\">Email id</div></td>\r\n");
      out.write("      <td><label>\r\n");
      out.write("        <input name=\"Text_Mail\" type=\"text\" id=\"Text_Mail\" size=\"65\">\r\n");
      out.write("      </label></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"style1\"><div align=\"right\">Degree</div></td>\r\n");
      out.write("      <td><label>\r\n");
      out.write("        <input name=\"Text_Degree\" type=\"text\" id=\"Text_Degree\" size=\"65\">\r\n");
      out.write("      </label></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td><div align=\"right\" class=\"style1\">\r\n");
      out.write("        Fee</div></td>\r\n");
      out.write("      <td><label>\r\n");
      out.write("        <input type=\"text\" name=\"Text_Fee\" id=\"Text_Fee\">\r\n");
      out.write("      </label></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td>&nbsp;</td>\r\n");
      out.write("      <td><label>\r\n");
      out.write("        <input name=\"Submit\" type=\"submit\" class=\"box-orange\" id=\"Submit\" value=\"Submit\">\r\n");
      out.write("      </label></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("  </form>\r\n");
      out.write("  <p>&nbsp;</p>\r\n");
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
