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
 rs2.next();
 String pname,psex,age,pphone,paddress,pdoctor,ppsex,padmitdate,pdischargedate;
 pname=rs2.getString("name");
 psex=rs2.getString("sex");
 if(psex.equalsIgnoreCase("male"))
 	ppsex="Male";
 else
 	ppsex="Female";
 age=rs2.getString("age");
 pphone=rs2.getString("phone");
 paddress=rs2.getString("address");
 padmitdate=(rs2.getDate("admitdate")).toString();
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
  <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="273" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style4 style18 style21">Test Name</div></td>
      <td width="165" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Date</div></td>
      <td width="110" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Rate</div></td>
    </tr>
    <%
	while(rs.next())
	{
	int tid=rs.getInt("testid");
	String date=(rs.getDate("date")).toString();
	Connection con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
	PreparedStatement ps1=con1.prepareStatement("select * from test where id=?");
	ps1.setInt(1,tid);
	ResultSet rs1=ps1.executeQuery();
	rs1.next();
	String name1=rs1.getString("name");
	int amt=rs1.getInt("amount");
	totalpath+=amt;
	%>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="center" class="style17"><%=name1%></div></td>
      <td><div align="center" class="style17"><%=date%></div></td>
      <td><div align="center" class="style17"><%=amt%></div></td>
    </tr>
    
    
    
    
    <%
	}
	%>
  </table>
  <br><br>
  <table width="950" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#FCFCD6" bgcolor="#CCCCCC">
    <tr>
      <td><div align="right"><span class="style7">Total Amount of Pathology Tests : <%=totalpath%></span></div></td>
    </tr>
  </table>  
   <p>&nbsp;</p>
  <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="239" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style4 style18 style21">Bed Name</div></td>
      <td width="251" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Admit Date</div></td>
      <td width="265" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Discharge Date</div></td>
      <td width="195" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Rate</div></td>
    </tr>
  <%
         int totalbed=0;
        Connection con3=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
	PreparedStatement ps3=con3.prepareStatement("select * from bedentry where id=?");
 	ps3.setInt(1,id);
 	ResultSet rs3=ps3.executeQuery();
	while(rs3.next())
                       {
	String bname=rs3.getString("type");
	String admitdate=(rs3.getDate("start")).toString();
	String dischargedate=(rs3.getDate("end")).toString();
	int rate=rs3.getInt("rate");
	int amount=0;
        Connection con4=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
        PreparedStatement ps4=con4.prepareStatement("select DATEDIFF((select str_to_date(?,'%Y-%m-%d')),(select str_to_date(?,'%Y-%m-%d')))as dif");
		ps4.setString(1,dischargedate);
        ps4.setString(2,admitdate);
        ResultSet rs4=ps4.executeQuery();
        rs4.next();
        int diff=rs4.getInt("dif")+1;
        amount=(diff*rate);
        totalbed+=amount;
	%>
  <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="center" class="style17"><%=bname%></div></td>
      <td><div align="center" class="style17"><%=admitdate%></div></td>
      <td><div align="center" class="style17"><%=dischargedate%></div></td>
      <td><div align="center" class="style17"><%=rate%></div></td>
    </tr> 
    <%
	}
	%>
     </table>
  <br><br>
  <table width="950" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#FCFCD6" bgcolor="#CCCCCC">
    <tr>
      <td><div align="right"><span class="style7">Total Amount of Bed Charges: <%=totalbed%></span></div></td>
    </tr>
  </table>  
  <p>&nbsp;</p>
  <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="476" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Doctor's Name</div></td>
      <td width="283" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Date</div></td>
      <td width="191" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Fee</div></td>
    </tr>
  <%
        int totalfee=0;
        Connection con5=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
	PreparedStatement ps5=con5.prepareStatement("select * from admitdoctor ad,doctor d where ad.did=d.id and ad.pid=?");
 	ps5.setInt(1,id);
 	ResultSet rs5=ps5.executeQuery();
        while(rs5.next())
                       {
	String dname=rs5.getString("d.name");
	String visitdate=(rs5.getDate("ad.date")).toString();
	int fee=rs5.getInt("ad.fee");
	
        totalfee+=fee;
	%>
  <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="center" class="style17"><%=dname%></div></td>
      <td><div align="center" class="style17"><%=visitdate%></div></td>
      <td><div align="center" class="style17"><%=fee%></div></td>
    </tr> 
    <%
	}
	%>
     </table>
  <br><br>
  <table width="950" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#FCFCD6" bgcolor="#CCCCCC">
    <tr>
      <td><div align="right"><span class="style7">Total Amount of Doctor Fees : <%=totalfee%></span></div></td>
    </tr>
  </table>  
    <p>&nbsp;</p>
    <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="475" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Bill No</div></td>
      <td width="475" height="30" valign="middle" bgcolor="#999999"><div align="center" class="style22">Amount</div></td>
    </tr>
  <%
  		float totalbill=0;
        Connection con6=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
	PreparedStatement ps6=con6.prepareStatement("select * from adminstore where id=?");
 	ps6.setInt(1,id);
 	ResultSet rs6=ps6.executeQuery();
        while(rs6.next())
                       {
	String billno=rs6.getString("billno");
	float billamt=rs6.getFloat("amount");
        totalbill+=billamt;
	%>
  <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="center" class="style17"><%=billno%></div></td>
      <td><div align="center" class="style17"><%=billamt%></div></td>
    </tr> 
    <%
	}
	%>
     </table>
  <br><br>
  <table width="950" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#FCFCD6" bgcolor="#CCCCCC">
    <tr>
      <td><div align="right"><span class="style7">Total Amount of Medicine Store Bills : <%=totalbill%></span></div></td>
    </tr>
  </table>    
   <table width="950" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#FCFCD6" bgcolor="#CCCCCC">
    <tr>
      <td><div align="right"><span class="style7">Total Bill: <%=(totalpath+totalbed+totalfee+totalbill)%></span></div></td>
    </tr>
  </table>
   <table width="950" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#FCFCD6" bgcolor="#CCCCCC">
       <%
       float totalpaid=0;
        Connection con7=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
	PreparedStatement ps7=con7.prepareStatement("select * from admitpay where id=?");
 	ps7.setInt(1,id);
 	ResultSet rs7=ps7.executeQuery();
        while(rs7.next())
                       {
	String paiddate=(rs7.getDate("date")).toString();
	float paidamt=rs7.getFloat("amount");
        totalpaid+=paidamt;
       %>
    <tr>
       <%
	}
	%> 
      <td><div align="right"><span class="style7">Total Amount paid : <%=totalpaid%></span></div></td>
    </tr>
  </table>
   <table width="950" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#FCFCD6" bgcolor="#CCCCCC">
    <tr>
      <td><div align="right"><span class="style7">Total Outstanding Bill: <%=((totalpath+totalbed+totalfee+totalbill)-totalpaid)%></span></div></td>
    </tr>
  </table> 
    
  <p align="center" class="style5">
  <table align="center">
  <tr>
  <td>
  <form method="post" action="BillPDF">
  <input type="hidden" name="h" value="<%=id%>">
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