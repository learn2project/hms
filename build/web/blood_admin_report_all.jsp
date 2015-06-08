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
.style6 {font-size: 16px; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF; }
.style7 {
	font-family: "Courier New", Courier, monospace;
	font-weight: bold;
}

.style12 {font-family: "Courier New", Courier, monospace; font-size: 16px; font-weight: bold;}
.style14 {color: #FF0000}

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
  <p> 
  <%
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
  PreparedStatement ps1=con.prepareStatement("select * from bloodbank where bloodgroup<>'--SELECT--'");
  ResultSet rs=ps1.executeQuery();
  double d,wid;
  int wid1;
   %></p>
  
  <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="173" height="30" bgcolor="#333399"><div align="center" class="style12 style6"><strong>Blood Group</strong></div></td>
      <td width="584" height="30" bgcolor="#333399"><div align="center" class="style12 style6"><strong>Status</strong></div></td>
      <td width="143" height="30" bgcolor="#333399"><div align="center" class="style12 style6"><strong>In Stock (Bot.)</strong></div></td>
    </tr>
    <%
	while(rs.next())
	{
	String gr=rs.getString("bloodgroup");
	int count=rs.getInt("count");
	String src="";
	int cc=0;
	if(count>100)
		count=100;
	d=(540*count)/100;
	if(count>75)
	{
		src="images/green.png";
	}
	if(count>40 && count<75)
	{
		src="images/yellow.png";
	}
	if(count>0 && count<40)
	{
		src="images/red.png";
	}
	if(count==0)
	{
		src="images/red.png";
		cc=0;
	}
	
	%>
    <tr>
      <td height="30"><div align="center" class="style7 style12"><strong><%=gr%></strong></div></td>
      <td height="30">
        <div align="center" class="style12">
          <div align="left">
            <%
	  //for(int j=0;j<cc;j++)
	  //{
	  //%>
            <img src=<%=src%> width="<%=d%>" height="15">
            <%
	  //}
	  %>
            </div>
      </div></td>
      <td height="30"><div align="center" class="style12 style13"><strong><%=count%></strong></div></td>
    </tr>
	<%
	}
	%>
  </table>
  
  <table width="900" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td><div align="right"><span class="style14">Maximum Capacity : 100 Bottles for each group.</span></div></td>
    </tr>
  </table>
  <p align="right" class="style14">&nbsp;</p>
  <p> </p>
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