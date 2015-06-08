<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>News | Illume</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
	font-family: "Courier New", Courier, monospace;
}
.style2 {
	color: #333333;
	font-family: "Courier New", Courier, monospace;
	font-size: 16px;
}
.style3 {
	font-size: 18px;
	font-weight: bold;
	color: #3366CC;
}
-->
    </style>
</head>
<body>
	<div id="header">
		<a href="index.jsp" class="logo"><img src="images/logo.png" alt=""></a>
		<ul>
			<li>
				<a href="index.jsp">home</a>			</li>
			<li>
				<a href="about.html">about</a>			</li>
			<li>
				<a href="services.html">services</a>			</li>
			<li>
				<a href="schedule.html">Schedule &amp; Fees</a>			</li>
			<li>
				<a href="contact.html">contact</a>			</li>
			<li class="selected">
				<a href="notice.jsp">News Room</a>			</li>
		</ul>
</div>
<div id="body">
<%
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
  PreparedStatement ps1=con.prepareStatement("select * from notice order by date");
  ResultSet rs=ps1.executeQuery();
%>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <%
  while(rs.next())
   {
  %>
    <tr>
      <td width="188"><div align="center" class="style1"><%=(rs.getDate("date")).toString()%>&nbsp; :</div></td>
      <td width="674"><span class="style3"><%=rs.getString("subject")%>&nbsp;</span></td>
    </tr>
     <tr>
      <td width="188"><div align="center"></div></td>
      <td width="674">&nbsp;</td>
    </tr>
    <tr>
      <td width="188">&nbsp;</td>
      <td width="674"><span class="style2"><%=rs.getString("content")%>&nbsp;</span></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
     <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
     <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  <%
	}
  %>
  </table>
  <p>&nbsp;</p>
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