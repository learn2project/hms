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

 
    <%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
	int dept;
	dept=Integer.parseInt(request.getParameter("List_Dept"));
	PreparedStatement ps1=con.prepareStatement("select name from department where id=?");
	ps1.setInt(1,dept);
	ResultSet rs1=ps1.executeQuery();
	rs1.next();
	String dname=rs1.getString("name");
	PreparedStatement ps=con.prepareStatement("select * from doctor where dept_id=?");
	ps.setInt(1,dept);
	ResultSet rs=ps.executeQuery();
	%>
	<table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td class="style22"><div align="center"><strong>Report for :</strong><span class="style24"> <%=dname%></span></div></td>
    </tr>
  </table>
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
    </tr>
	
	<%
	while(rs.next())
	{
	String sx="";
	if(rs.getString("sex").equalsIgnoreCase("male"))
		sx="Male";
	else
		sx="Female";
	%>
    <tr>
      <td height="32"><div align="center" class="style12"><%=rs.getInt("id")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("name")%></div></td>
      <td><div align="center" class="style12"><%=sx%></div></td>
      <td><div align="center" class="style12"><%=rs.getInt("age")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("phone")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("address")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("email")%></div></td>
      <td><div align="center" class="style12"><%=rs.getString("degree")%></div></td>
      <td><div align="center" class="style12"><%=rs.getInt("fee")%></div></td>
    </tr>
     
    <%
	
	}
	%>
  </table>
  
  
  <p>&nbsp;</p>
  
  <p align="center"><a href="doctor_admin_report_dept.jsp">Back</a></p>
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