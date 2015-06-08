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
.style31 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 16px; }
.style32 {color: #FFFFFF}
.style39 {font-size: 24px; font-weight: bold; font-family: "Courier New", Courier, monospace; }
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
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
	int doc;
	doc=Integer.parseInt(request.getParameter("doc"));
	PreparedStatement ps=con.prepareStatement("select * from schedule where id=?");
	ps1.setInt(1,doc);
	ResultSet rs=ps.executeQuery();
	rs.next();
	String day=rs.getString("day");
	String start=rs.getString("start");
	String end=rs.getString("end");
	PreparedStatement ps1=con.prepareStatement("select * from doctor where id=?");
	ps1.setint(1,doc);
	Resultset rs1=ps1.executeQuery();
	rs1.next();
	%>
   <table width="980" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
    
    <tr>
      <td width="46" height="45" bgcolor="#004E86" class="style4"><div align="center" class="style23">ID</div></td>
      <td width="187" bgcolor="#006699" class="style4"><div align="center" class="style23">Name</div></td>
      <td width="72" bgcolor="#004E86" class="style4"><div align="center" class="style23">Sex</div></td>
      <td width="63" bgcolor="#006699" class="style4"><div align="center" class="style23">Age</div></td>
      <td width="122" bgcolor="#004E86" class="style4"><div align="center" class="style23">Phone</div></td>
      <td width="140" bgcolor="#006699" class="style4"><div align="center" class="style23">Address</div></td>
      <td width="129" bgcolor="#004E86" class="style4"><div align="center" class="style23">Email</div></td>
      <td width="130" bgcolor="#006699" class="style4"><div align="center" class="style23">Degree</div></td>
      <td width="91" bgcolor="#004E86" class="style4"><div align="center" class="style23">Fee</div></td>
      <td width="130" bgcolor="#006699" class="style4"><div align="center" class="style23">Day</div></td>
      <td width="130" bgcolor="#006699" class="style4"><div align="center" class="style23">Start</div></td>
      <td width="130" bgcolor="#006699" class="style4"><div align="center" class="style23">End</div></td>
    </tr>
	
	<%
	while(rs1.next())
	{
	String sx="";
	if(rs.getString("sex").equalsIgnoreCase("male"))
		sx="Male";
	else
		sx="Female";
	%>
    <tr>
      <td height="32"><div align="center" class="style12"><%=doc%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("name")%></div></td>
      <td><div align="center" class="style12"><%=sx%></div></td>
      <td><div align="center" class="style12"><%=rs.getInt("age")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("phone")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("address")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("email")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("degree")%></div></td>
      <td><div align="center" class="style12"><%=rs.getInt("fee")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("day")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("start")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("end")%></div></td>
    </tr>
     
   <%
	}
	%>
  </table>
   <p>&nbsp;</p>
    <p align="center"><a href="doctor_admin_report_schedule.jsp?nid=0">Back</a></p>
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