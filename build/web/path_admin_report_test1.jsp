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
.style24 {
	font-family: "Courier New", Courier, monospace;
	font-weight: bold;
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
         }
        if(name.equalsIgnoreCase("admin"))
        {

%>
 <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
    
    <tr>
      <td width="125" height="45" bgcolor="#004E86" class="style4"><div align="center" class="style23">Patient ID</div></td>
      <td width="339" bgcolor="#006699" class="style4"><div align="center" class="style23">Patient Name</div></td>
      <td width="297" bgcolor="#004E86" class="style4"><div align="center" class="style23">Test Date</div></td>
      <td width="189" bgcolor="#006699" class="style4"><div align="center" class="style23"><span class="style22">Report Status</span></div></td>
    </tr>
    <%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
	int test;
	test=Integer.parseInt(request.getParameter("List_Test"));
	PreparedStatement ps=con.prepareStatement("select pt.patientid,pp.name pname,pt.date ptdate,pt.report, t.name tname from test t,pathologytestdetails pt,pathologypatient pp where pt.patientid=pp.id and pt.testid=t.id and pt.testid=?");
	ps.setInt(1,test);
	String status="";
	String tname="";
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	%>
    <tr>
      <td height="32"><div align="center" class="style12"><%=rs.getInt("patientid")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("pname")%></div></td>
      <td><div align="center" class="style12"><%=(rs.getString("ptdate")).toString()%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("report")%></div></td>
    </tr>
     
    <%
	tname=rs.getString("tname");
	}
	%>
  </table>
  
  
  <p>&nbsp;</p>
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td class="style22"><div align="center"><strong>Report for :</strong><span class="style24"> <%=tname%></span></div></td>
    </tr>
  </table>
  <p>&nbsp;  </p>
  <p align="center"><a href="path_admin_report_test.jsp">Back</a></p>
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