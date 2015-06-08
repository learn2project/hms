<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin | Illume</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style2 {font-family: Verdana, Arial, Helvetica, sans-serif; color: #009933; }
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
<form method="post" action="AdmitAddBillServ">
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td><div align="right" class="style1">Patient ID</div></td>
      <td><label>
        <input type="text" name="Text_PId" id="Text_PId">
      </label></td>
    </tr>
    <tr>
      <td class="style1"><div align="right">Bill Reference Number</div></td>
      <td><label>
      <input type="text" name="Text_BillRefNo" id="Text_BillRefNo">
      </label></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style1">Bill Amount</span></div></td>
      <td><label>
      <input type="text" name="Text_BillAmount" id="Text_BillAmount">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="Add" type="submit" class="box-orange" id="Add" value="Add">
      </label></td>
    </tr>
  </table>
  </form>
 <div align="center" class="style2">
      <p>&nbsp;</p>
      <p class="style2">
        <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
      </p>
  </div>
  <p>&nbsp;</p>
  
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
