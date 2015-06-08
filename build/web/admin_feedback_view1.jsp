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
.style2 {font-family: "Courier New", Courier, monospace}
.style5 {color: #FFFFFF; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; }
.style8 {font-family: "Courier New", Courier, monospace; font-size: 16px; }
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
  <p align="center"></p>
  <table width="962" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
    <td width="103" bgcolor="#000099"><div align="center" class="style5">NAME</div></td>
    <td width="114" bgcolor="#000099"><div align="center" class="style5">EMAIL</div></td>
    <td width="105" bgcolor="#000099"><div align="center" class="style5">NUMBER</div></td>
    <td width="153" bgcolor="#000099"><div align="center" class="style5">SUBJECT</div></td>
    <td width="218" bgcolor="#000099"><div align="center" class="style5">MESSAGE</div></td>
    <td width="79"><div align="center"></div></td>
    </tr>
  <%
  Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
  String day=request.getParameter("List_Day");
            String month=request.getParameter("List_Month");
            String year=request.getParameter("List_Year");
            String d=day+"-"+month+"-"+year;
            PreparedStatement ps=con.prepareStatement("select * from feedback where date =(select str_to_date(?,'%d-%M-%Y'))");
            ps.setString(1,d);
            ResultSet rs = ps.executeQuery();
	    int i=1;
            		
		while(rs.next())
		{
			String name1 = rs.getString("name");
			String email = rs.getString("email");
			String number = rs.getString("number");
			String subject = rs.getString("subject");
			String message = rs.getString("message");
		 %> 
  
	
    <tr>
    <form name="form" method="post" action="admin_feedback_view2.jsp"> 
      <td><div align="center" class="style8"><label><%=name1 %></label></div></td>
      <td><div align="center" class="style2"><label><%=email %></label></div></td>
      <td><div align="center" class="style8"><label><%=number %></label></div></td>
      <td><div align="center" class="style2"><label><%=subject %></label></div></td>
      <td><div align="center" class="style8"><label><%=message %></label></div></td>
      <td><div align="center">
          <label>
          <input type="hidden" name="hiddenname" value="<%=name1%>">
  	  <input type="hidden" name="hiddenemail" value="<%=email%>">
          <input type="hidden" name="hiddennumber" value="<%=number%>">
          <input type="hidden" name="hiddensubject" value="<%=subject%>">
          <input type="hidden" name="hiddenmessage" value="<%=message%>">
          <input type="submit" class="box-orange" value="REPLY">
          </label>
        </div>        </td>
     </form>
    </tr>
    <%		
		i++;
		}
		if(i==1)
		response.sendRedirect("admin_feedback_view.jsp?msg=No Record For This Date");
	%>
  </table>
  <div align="center"></div>
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