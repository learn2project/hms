<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Doctor</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style2 {color: #009933}
.style3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #333333;
}
-->
    </style>
</head>
<body>
	<div id="header">
		<a href=# class="logo"><img src="images/logo.png" alt=""></a>
	    
  <ul>
			<li>
				<a href="admin.jsp">Admin home page</a>			</li>
			
			<li>
				<a href="index.jsp">Logout</a>			</li>
		</ul>
</div>
<div id="body">
 <%
        String name="";
try
        {
        	name=(session.getAttribute("user")).toString();
         }
         catch(Exception ee)
         {
         	response.sendRedirect("index.jsp");
         }        if(name.equalsIgnoreCase("admin"))
        {

%>
  <p>&nbsp;</p>
  <form method="post" action="doctor_admin_update_doc1.jsp">
    <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
      <tr>
        <td width="206"><div align="right" class="style3">
          <div align="right">Select Doctor</div>
        </div></td>
        <td width="324"><label>
          <select name="List_Doc" id="List_Doc">
           <%
         Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            PreparedStatement stmt;
            con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt=con.prepareStatement("select * from doctor order by name");
            ResultSet rs=stmt.executeQuery();
            while(rs.next())
            {
                int did=rs.getInt("id");
                String dname=rs.getString("name");
         %>
         
                <option value=<%=did%> selected><%=dname%></option>
                  <%
            }
            %>
          </select>
        </label></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><label><span class="style2">
          <input name="Submit" type="submit" class="box-orange" id="Submit" value="  Prodeed  ">
        </span></label></td>
      </tr>
    </table>
  </form>
  <p>&nbsp;</p>
  <div align="center" class="style2">
    <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
  </div>
   <%
  }
  
  else
  {
  response.sendRedirect("admin_login.jsp");
  }
  %>
</div>
<div id="footer">
		<div>
			<p>
				<span>2013 &copy; Illume labs &amp; hospital</span><a href="terms.html" >Terms of Service</a> | <a href="policy.html" >Privacy Policy</a> | <a href="faq.html" >FAQ</a> | <a href="admin_login.jsp" >Admin Login</a>
			</p>
			<ul>
				<li id="facebook">
					<a href="http://www.facebook.com/">facebook</a>
				</li>
				<li id="twitter">
					<a href="http://www.twitter.com/">twitter</a>
				</li>
				<li id="googleplus">
					<a href="http://www.google.com">googleplus</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>