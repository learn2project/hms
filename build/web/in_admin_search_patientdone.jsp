<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>

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
 int totalpath=0;
 int id=Integer.parseInt(request.getParameter("Text_Id"));
 Connection con2=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
 PreparedStatement ps2=con2.prepareStatement("select * from admitpatient where id=?");
 ps2.setInt(1,id);
 ResultSet rs2=ps2.executeQuery();
 if(rs2.next())
 {
 String pname,psex,age,pphone,paddress,pdoctor,ppsex,padmitdate,pdischargedate,prefname,prefphone,pemail,pdisease,pidno;
 pname=rs2.getString("name");
 psex=rs2.getString("sex");
 if(psex.equalsIgnoreCase("male"))
 	ppsex="Male";
 else
 	ppsex="Female";
 age=rs2.getString("age");
 pphone=rs2.getString("phone");
 paddress=rs2.getString("address");
 prefname=rs2.getString("refname");
 prefphone=rs2.getString("refphone");
 pemail=rs2.getString("email");
 pdisease=rs2.getString("disease");
 padmitdate=(rs2.getDate("admitdate")).toString();
 pidno=rs2.getString("idno");
 PreparedStatement pss=con2.prepareStatement("select * from admitdischarge where id=?");
 pss.setInt(1,id);
 ResultSet rss=pss.executeQuery();
 if(rss.next())
 {
 pdischargedate=(rs2.getDate("date")).toString();
 }
 else
 {
 pdischargedate="Not Discharged";
 }
 PreparedStatement ps=con.prepareStatement("select * from admitpath where id=?");
 ps.setInt(1,id);
 ResultSet rs=ps.executeQuery();
 %>
 <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td><strong>Name : </strong><span class="style17"><%=pname%></span></td>
    </tr>
  </table>
 <br>
  <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td><strong>Sex : </strong><span class="style17"><%=ppsex%></span></td>
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
      <td ><strong>Reference Name</strong> <strong>:</strong> <span class="style17"><%=prefname%></span></td>
    </tr>
  </table>
  <br>
  <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td ><strong>Reference Phone Number</strong> <strong>:</strong> <span class="style17"><%=prefphone%></span></td>
    </tr>
  </table>
  <br>
  <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td ><strong>Email</strong> <strong>:</strong> <span class="style17"><%=pemail%></span></td>
    </tr>
  </table>
  <br>
  <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td ><strong>Disease</strong> <strong>:</strong> <span class="style17"><%=pdisease%></span></td>
    </tr>
  </table>
  <br>
  <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td ><strong>Identification Number</strong> <strong>:</strong> <span class="style17"><%=pidno%></span></td>
    </tr>
  </table>
  <br>
  <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td ><strong>Admit Date: </strong><span class="style17"><%=padmitdate%></span></td>
    </tr>
  </table>
  <br>
  <table width="950" border="0" align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td ><strong>Discharge Date: </strong><span class="style17"><%=pdischargedate%></span></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p> </p>
  <div align="center">
    <%
	}
	else
	{
	response.sendRedirect("in_admin_search_patient.jsp?msg=No Record Found");
	}
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