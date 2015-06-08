<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin | Illume</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style4 {
	font-family: Geneva, Arial, Helvetica, sans-serif;
	color: #333333;
	font-size: 16px;
}
.style12 {font-family: Arial, Helvetica, sans-serif; color: #000000; }
.style22 {font-size: 16px}
.style23 {font-size: 16px; color: #FFFDE0; font-weight: bold; font-family: "Courier New", Courier, monospace; }
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
         }
        if(name.equalsIgnoreCase("admin"))
        {

%>
 <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
    
    <tr>
      <td width="125" height="45" bgcolor="#004E86" class="style4"><div align="center" class="style23">Patient ID</div></td>
      <td width="339" bgcolor="#006699" class="style4"><div align="center" class="style23">Patient Name</div></td>
      <td width="297" bgcolor="#004E86" class="style4"><div align="center" class="style23">Bed Type</div></td>
    </tr>
    <%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
	String d,m,y,dd;
	String bed,r;
	d=request.getParameter("List_Date");
    m=request.getParameter("List_Month");
    y=request.getParameter("List_Year");
    dd=d+" "+m+" "+y;
	bed=request.getParameter("List_Bed");
	PreparedStatement ps=con.prepareStatement("select ap.id pid,ap.name pname,be.type btype from bedentry be, admitpatient ap where be.start<=(select str_to_date(?,'%d %M %Y')) and be.end>=(select str_to_date(?,'%d %M %Y')) and ap.id=be.id and be.type=?");
	ps.setString(1,dd);
	ps.setString(2,dd);
	ps.setString(3,bed);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	%>
    <tr>
      <td height="32"><div align="center" class="style12"><%=rs.getInt("pid")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("pname")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("btype")%></div></td>
    </tr>
     
    <%
	}
	%>
  </table>
  
  
  <p>&nbsp;  </p>
  <p align="center"><a href="bed_admin_report_datewise.jsp">Back</a></p>
  <p>
    <%
  }
  
  else
  {
  response.sendRedirect("admin_login.jsp");
  }
  %>
      </p>
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