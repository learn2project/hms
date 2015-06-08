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
      <td width="323" height="45" bgcolor="#004E86" class="style4"><div align="center" class="style23">Name</div></td>
      <td width="116" bgcolor="#006699" class="style4"><div align="center" class="style23">Rate(INR)</div></td>
      <td width="190" bgcolor="#004E86" class="style4"><div align="center" class="style23">Specimen</div></td>
      <td width="203" bgcolor="#006699" class="style4"><div align="center" class="style23"><span class="style22">Expected Report Delay ( in Days )</span></div></td>
      <td width="118" bgcolor="#004E86" class="style4"><div align="center" class="style23"><span class="style22">Status</span></div></td>
    </tr>
    <%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
	PreparedStatement ps=con.prepareStatement("select * from test where id>0 order by status,name");
	String status="";
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	if(rs.getString("status").equals("yes"))
		status="Available";
	else
		status="Not Available";
	%>
    <tr>
      <td height="32"><div align="center" class="style12"><%=rs.getString("name")%></div></td>
      <td><div align="center" class="style12"><%=rs.getInt("amount")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("specimen")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("delay")%></div></td>
      <td><div align="center" class="style12"><%=status%></div></td>
    </tr>
     
    <%
	}
	%>
  </table>
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