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
.style2 {color: #009966}
.style4 {
	font-size: 16
}
-->
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
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
<p align="center" class="style2 style4">
        <%
  String s,s1;
  s=request.getParameter("msg");
  s1=request.getParameter("msg1");
  if(s1!=null)
  {
  out.write(s);
  %>
  <br>
  <br>
  <%
  out.write("Kindly Note the ID for further reference : "+s1);
  }
  %>
      </p>
<form method="post" action="AddPathPatientServ">
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="246" class="style1"><div align="right">Name</div></td>
      <td width="284"><label>
        <input name="Text_Name" type="text" id="Text_Name" size="40">
      </label></td>
    </tr>
    <tr>
      <td class="style1"><div align="right">Sex</div></td>
      <td>
        <p>
          <label>
            <input type="radio" name="Male" value="male" id="R1">
            Male</label> 
          <label><input type="radio" name="Male" value="female" id="R">
            Female</label>
          <br>
        </p>
        <label></label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Age</div></td>
      <td><input type="text" name="Text_Age" id="Text_Age"></td>
    </tr>
    <tr>
      <td class="style1"><div align="right">Phone No</div></td>
      <td><label>
      <input type="text" name="Text_Phone" id="Text_Phone">
      </label></td>
    </tr>
    <tr>
      <td class="style1"><div align="right">Address</div></td>
      <td><label>
      <input name="Text_Address" type="text" id="Text_Address" value="" size="50">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Doctor's Name</div></td>
      <td><label>
      <input type="text" name="Text_Doctor" id="Text_Doctor">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="Add" type="submit" class="box-orange" id="Add" value="  Add  ">
      </label></td>
    </tr>
  </table>
</form>
    <div align="center" class="style2">
      <p>&nbsp;</p>
      
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