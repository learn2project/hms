<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style1 {
	color: #999999;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style2 {
	color: #333333
}
.style3 {
	color: #FF0000;
	font-size: 16px;
	font-family: Georgia, "Times New Roman", Times, serif;
	font-weight: bold;
}
-->
    </style>
</head>
<body>
	<div id="header">
		<a href="index.jsp" class="logo"><img src="images/logo.png" alt=""></a>
<ul>
			<li>
				<a href="index.jsp">home</a>
			</li>
			<li>
				<a href="about.html">about</a>
			</li>
			<li>
				<a href="services.html">services</a>
			</li>
			<li>
				<a href="schedule.html">Schedule &amp; Fees</a>
			</li>
			<li>
				<a href="contact.html">contact</a>
			</li>
			<li>
				<a href="notice.jsp">News Room</a>
			</li>
		</ul>
	</div>
<div id="body">
  <p>&nbsp;</p>
  
  <%
        String name;
        name=(session.getAttribute("user")).toString();
        if(!name.equalsIgnoreCase("admin"))
        {

%>
  
  <form method="post" action="AdminServ">
  <table width="400" border="0" align="center" cellpadding="10" cellspacing="10" bordercolor="#FBFBD5">
    <tr>
      <td width="192"><div align="right" class="style1 style2">Enter Admin Key</div></td>
      <td width="237"><label>
      <input type="password" name="Text_Key" id="Text_Key">
      </label></td>
    </tr>
     <tr>
      <td colspan="2"><div align="center">
        <input name="button4" type="submit" class="box-blue" id="button4" value="   ENTER   " >
      </div></td>
    </tr>
    </table>
    </form>
  <div align="center"><span class="style3">
  <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
  </span>
  </div>
  
  <%
  }
  
  else
  {
  response.sendRedirect("admin.jsp");
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