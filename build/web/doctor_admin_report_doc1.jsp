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
	int doc;
	try
	{
	doc=Integer.parseInt(request.getParameter("doc"));
	if(doc==0)
		throw new NullPointerException("1");
	PreparedStatement ps1=con.prepareStatement("select * from doctor where id=?");
	ps1.setInt(1,doc);
	ResultSet rs=ps1.executeQuery();
	rs.next();
	String name1=rs.getString("name");
	String sex="";
	if(rs.getString("sex").equalsIgnoreCase("male"))
		sex="Male";
	else
		sex="Female";
	int age=rs.getInt("age");
	String phone=rs.getString("phone");
	String address=rs.getString("address");
	String email=rs.getString("email");
	String degree=rs.getString("degree");
	int fee=rs.getInt("fee");
	%>
  <p>&nbsp;</p>
  
    <table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="236" height="75" bgcolor="#003366"><div align="right" class="style32"><span class="style31">Doctor ID&nbsp;&nbsp;&nbsp;&nbsp;</span></div></td>
        <td width="514"><span class="style39">&nbsp;&nbsp;&nbsp;&nbsp;<%=doc%></span></td>
      </tr>
      <tr>
        <td height="75" bgcolor="#003366"><div align="right" class="style32"><span class="style31">Name&nbsp;&nbsp;&nbsp;&nbsp;</span></div></td>
        <td><span class="style39">&nbsp;&nbsp;&nbsp;&nbsp;<%=name1%></span></td>
      </tr>
      <tr>
        <td height="75" bgcolor="#003366"><div align="right" class="style32"><span class="style31">Sex&nbsp;&nbsp;&nbsp;&nbsp;</span></div></td>
        <td><span class="style39">&nbsp;&nbsp;&nbsp;&nbsp;<%=sex%></span></td>
      </tr>
      <tr>
        <td height="75" bgcolor="#003366"><div align="right" class="style32"><span class="style31">Age&nbsp;&nbsp;&nbsp;&nbsp;</span></div></td>
        <td><span class="style39">&nbsp;&nbsp;&nbsp;&nbsp;<%=age%></span></td>
      </tr>
      <tr>
        <td height="75" bgcolor="#003366"><div align="right" class="style32"><span class="style31">Phone number&nbsp;&nbsp;&nbsp;&nbsp;</span></div></td>
        <td><span class="style39">&nbsp;&nbsp;&nbsp;&nbsp;<%=phone%></span></td>
      </tr>
      <tr>
        <td height="75" bgcolor="#003366"><div align="right" class="style32"><span class="style31">Address&nbsp;&nbsp;&nbsp;&nbsp;</span></div></td>
        <td><span class="style39">&nbsp;&nbsp;&nbsp;&nbsp;<%=address%></span></td>
      </tr>
      <tr>
        <td height="75" bgcolor="#003366"><div align="right" class="style32"><span class="style31">Email&nbsp;&nbsp;&nbsp;&nbsp;</span></div></td>
        <td><span class="style39">&nbsp;&nbsp;&nbsp;&nbsp;<%=email%></span></td>
      </tr>
      <tr>
        <td height="75" bgcolor="#003366"><div align="right" class="style32"><span class="style31">Degree&nbsp;&nbsp;&nbsp;&nbsp;</span></div></td>
        <td><span class="style39">&nbsp;&nbsp;&nbsp;&nbsp;<%=degree%></span></td>
      </tr>
      <tr>
        <td height="75" bgcolor="#003366"><div align="right" class="style32"><span class="style31">Fee&nbsp;&nbsp;&nbsp;&nbsp;</span></div></td>
        <td><span class="style39">&nbsp;&nbsp;&nbsp;&nbsp;<%=fee%></span></td>
      </tr>
    </table>
  <p>&nbsp;</p>
    <p align="center"><a href="doctor_admin_report_doc.jsp?nid=0">Back</a></p>
  <p>
    <%
	}
	catch(Exception e)
	{
	HttpSession session1 = request.getSession(true);
    String msg,page1;
    msg="Please Select Doctor name. You have not selected any name..";
    page1="doctor_admin_report_doc.jsp?nid=0";
    session1.setAttribute("error", msg);
    session1.setAttribute("page", page1);
    response.sendRedirect("Error.jsp");
	}
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