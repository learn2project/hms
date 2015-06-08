<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Illume</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #333333;
}
.style2 {color: #006633}
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
<form method="post" action="NoticeServ">
  <table width="700" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="250" class="style1"><div align="right">Select Date</div></td>
      <td width="380"><label>
      <select name="List_Date" id="List_Date">
      <option value="Day" selected disabled> Day </option>
      <%
	  	for (int i=1;i<=31;i++)
		{
		%>
        <option value="<%= i %>">
        <%= i %>
        </option>
        <% } %>
          </select>
      </label>
        <label>
        <select name="List_Month" id="List_Month">
         <option value="Month" selected disabled> Month </option>
        <option value="Jan">JAN</option>
        <option value="Feb">FEB</option>
        <option value="Mar">MAR</option>
        <option value="Apr">APR</option>
        <option value="May">MAY</option>
        <option value="Jun">JUN</option>
        <option value="Jul">JUL</option>
        <option value="Aug">AUG</option>
        <option value="Sep">SEP</option>
        <option value="Oct">OCT</option>
        <option value="Nov">NOV</option>
        <option value="Dec">DEC</option>
                </select>
        </label>
        <label>
        <select name="List_Year" id="List_Year">
        <option value="Year" selected disabled> Year </option>
          <option value="2012">2012</option>
          <option value="2013">2013</option>
          <option value="2014">2014</option>  
        </select>
                </select>
        </label></td>
    </tr>
    <tr>
      <td class="style1"><div align="right">Subject</div></td>
      <td><label>
        <input name="Text_Subject" type="text" id="Text_Subject" size="50">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Message</div></td>
      <td><textarea name="Text_Message" cols="50" rows="8" id="Text_Message"></textarea></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name=" Submit" type="submit" class="box-orange" id=" Submit" value=" ADD ">
      </label></td>
    </tr>
  </table>
  </form>
  <p>&nbsp;</p>
  <p align="center" class="style2">
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