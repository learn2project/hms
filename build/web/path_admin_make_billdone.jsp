<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin | Illume</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style4 {
	font-size: 16px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style5 {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 24px;
}
.style7 {font-family: Georgia, "Times New Roman", Times, serif; font-size: 24px; font-weight: bold; }
.style17 {font-family: "Courier New", Courier, monospace}
.style18 {
	color: #000000
}
.style21 {font-size: 18px}
.style22 {font-size: 18px; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000; }
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
  <div align="center">
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
  </div>
 <%
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
 int total=0;
 int id=Integer.parseInt(request.getParameter("Text_Id"));
 Connection con2=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
 PreparedStatement ps2=con2.prepareStatement("select * from pathologypatient where id=?");
 ps2.setInt(1,id);
 ResultSet rs2=ps2.executeQuery();
 rs2.next();
 String pname,psex,age,pphone,paddress,pdoctor,ppsex;
 pname=rs2.getString("name");
 psex=rs2.getString("sex");
 if(psex.equalsIgnoreCase("male"))
 	ppsex="Male";
 else
 	ppsex="Female";
 age=rs2.getString("age");
 pphone=rs2.getString("phone");
 paddress=rs2.getString("address");
 pdoctor=rs2.getString("doctor");
 PreparedStatement ps=con.prepareStatement("select * from pathologytestdetails where patientid=?");
 ps.setInt(1,id);
 ResultSet rs=ps.executeQuery();
 %>
  <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td><strong>Name : </strong><span class="style17"><%=pname%></span></td>
      <td><strong>Sex</span> : </strong><span class="style17"><%=ppsex%></span></td>
      <td ><strong>Age</strong> <strong> : </strong><span class="style17"><%=age%></span></td>
    </tr>
  </table>
  <br>
  <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td ><strong>Phone Number :</strong> <span class="style17"><%=pphone%></span></td>
    </tr>
  </table>
  <br>
  <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td ><strong>Address</strong> <strong>:</strong> <span class="style17"><%=paddress%></span></td>
    </tr>
  </table>
  <br>
  <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td ><strong>Reference Doctor : </strong><span class="style17"><%=pdoctor%></span></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="273" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style4 style18 style21">Test Name</div></td>
      <td width="165" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Date</div></td>
      <td width="110" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Rate</div></td>
      <td width="222" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Report Status</div></td>
    </tr>
    <%
	while(rs.next())
	{
	int tid=rs.getInt("testid");
	String date=(rs.getDate("date")).toString();
	String st=rs.getString("report");
	Connection con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
	PreparedStatement ps1=con1.prepareStatement("select * from test where id=?");
	ps1.setInt(1,tid);
	ResultSet rs1=ps1.executeQuery();
	rs1.next();
	String name1=rs1.getString("name");
	int amt=rs1.getInt("amount");
	total+=amt;
	%>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="center" class="style17"><%=name1%></div></td>
      <td><div align="center" class="style17"><%=date%></div></td>
      <td><div align="center" class="style17"><%=amt%></div></td>
      <td><div align="center" class="style17"><%=st%></div></td>
    </tr>
    
    <%
	}
	%>
  </table>
  <br><br>
  <table width="950" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#FCFCD6" bgcolor="#CCCCCC">
    <tr>
      <td><div align="right"><span class="style7">Total Amount : <%=total%></span></div></td>
    </tr>
  </table>
  <p align="center" class="style5">
  <table align="center">
  <tr>
  <td>
  <form method="post" action="PathBillPDFCall">
  <input type="hidden" name="hiddenID" value="<%=id%>">
  <input type="hidden" name="hiddenname" value="<%=pname%>">
  <input type="hidden" name="hiddensex" value="<%=ppsex%>">
  <input type="hidden" name="hiddenage" value="<%=age%>">
  <input type="hidden" name="hiddenphone" value="<%=pphone%>">
  <input type="hidden" name="hiddenaddress" value="<%=paddress%>">
  <input type="hidden" name="hiddendoctor" value="<%=pdoctor%>">
  <input name="submit" type="submit" class="box-orange" id="submit" value="Generate PDF">
  </form>
  </td>
  </tr>
  </table>
  </p>
  <p> </p>
  <div align="center">
    <%
  }
  
  else
  {
  response.sendRedirect("admin_login.jsp");
  }
  %>
  </div>
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