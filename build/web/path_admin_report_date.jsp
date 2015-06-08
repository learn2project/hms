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
.style23 {
	font-size: 18px;
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
 
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td align="center" valign="middle"><form method="post" action="path_admin_report_date1.jsp">
         <span class="style23">Date :</span> 
         <select name="select1">
     <option value="Day" selected disabled> Day </option>
     <%
	  	for (int i=1;i<=31;i++)
		{
	 %>
     	   <option value="<%= i %>"><%= i %></option>
     <% 
	 	} 
	 %>
            </select>
             &nbsp;&nbsp;&nbsp;
         <span class="style23">Month : </span>
         <select name="select2">
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
                     &nbsp;&nbsp;&nbsp;
         <span class="style23">Year :</span> 
         <select name="select3">
          <option value="Year" selected disabled> Year </option>
          <option value="2012">2012</option>
          <option value="2013">2013</option>
          <option value="2014">2014</option>  
                  </select>
            &nbsp;&nbsp;&nbsp;
            <input type="submit" class="box-orange" value="   View   ">
  </form></td>
    </tr>
  </table>
  <p>
  
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