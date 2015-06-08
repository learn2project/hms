<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin | Illume</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style1 {
	color: #333333;
	font-family: Verdana, Arial, Helvetica, sans-serif;
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
         }        if(name.equalsIgnoreCase("admin"))
        {

%>
  <p>&nbsp;</p>
  <form method="post" action="AddTestServ">
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="263"><div align="right"><span class="style1">Test Name</span></div></td>
      <td width="261"><label>
        <input name="Text_Name" type="text" id="Text_Name" size="50">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Rate</div></td>
      <td><label>
        <input type="text" name="Text_Amount" id="Text_Amount">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Specimen</div></td>
      <td><label>
        <input name="Text_Specimen" type="text" id="Text_Specimen" size="50">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Status</div></td>
      <td><label>
        <select name="List_Status" id="List_Status">
          <option value="yes" selected>Available</option>
          <option value="no">Not Available</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Expected Delay</div></td>
      <td><label>
        <input type="text" name="Text_Delay" id="Text_Delay">
      (in days)</label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="box-orange" id="Submit" value="  ADD  ">
      </label></td>
    </tr>
  </table>
  </form>
  <p>&nbsp;</p>
   <div align="center">
     <p>
       <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
     </p>
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
