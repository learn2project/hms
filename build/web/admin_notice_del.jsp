<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin | Illume</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style1 {
	color: #003366;
	font-weight: bold;
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
         }
        if(name.equalsIgnoreCase("admin"))
        {

%>
  <form name="form1" method="post" action="admin_notice_del1.jsp">
    <label></label><label><br>
    </label>
    <div align="center"></div>
    <label>
    <div align="center">
      <table width="600" height="72" border="0" cellpadding="10" cellspacing="10">
        <tr>
          <td width="600">
            <div align="center">
             <span class="style23">Date :</span> 
              <select name="List_Day" id="List_Day">
                <option value="--SELECT--">--SELECT--</option>
                <%
	  	for (int i=1;i<=31;i++)
		{
	 %>
                <option value="<%= i %>"><%= i %></option>

     <% 
	 	} 
	 %>
              </select>
               <span class="style23">Month :</span> 
              <select name="List_Month" id="List_Month">
                 <option value="--SELECT--">--SELECT--</option>
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
                <span class="style23">Year :</span> 
                 <select name="List_Year" id="List_Year">
                   <option value="--SELECT--">--SELECT--</option>
                   <option value="2012">2012</option>
          		<option value="2013">2013</option>
          		<option value="2014">2014</option>
              </select>
          </div></td>
        </tr>
        <tr>
          <td><div align="center">
            <input name="submit" type="submit" class="box-orange" id="submit" value="VIEW">
</div></td>
        </tr>
      </table>
      <br>
      <br>
    </div>
    </label>
    <div align="center"></div>
  </form>
  <p align="center" class="style1"> 
  <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
   </p>
  
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