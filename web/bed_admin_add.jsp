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
-->
    </style>
<script type="text/javascript">
//form validation
function validateForm()
{
var x=document.forms["myForm"]["Text_Rate"].value
var z=document.forms["myForm"]["Text_Capacity"].value
var m=document.forms["myForm"]["Text_Name"].value
var y=/^\d+$/
if (m==null || m=="")
  {
  alert("Type cannot be blank");
  myForm.Text_Name.focus();
  return false;
  }
else if (x==null || x=="")
  {
  alert("Numeric Only");
  myForm.Text_Rate.focus();
  return false;
  }
else if (z==null || z=="")
  {
  alert("Numeric Only");
  myForm.Text_Capacity.focus();
  return false;
  }
else if(!y.test(x))
{
  alert("Numeric Only");
  myForm.Text_Rate.focus();
  return false;
  }
else if(!y.test(z))
{
  alert("Numeric Only");
  myForm.Text_Capacity.focus();
  return false;
  }
else
		return true;
}
</script>
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
<form name="myForm" method="post" action="AddBedServ" onSubmit="return validateForm()">
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="270"><div align="right"><span class="style1">Enter Type</span></div></td>
      <td width="260"><label>
        <input type="text" name="Text_Name" id="Text_Name">
      </label></td>
    </tr>
    <tr>
      <td class="style1"><div align="right">Enter Rate</div></td>
      <td><input type="text" name="Text_Rate" id="Text_Rate"></td>
    </tr>
    <tr>
      <td class="style1"><div align="right">Maximum Capacity</div></td>
      <td><input type="text" name="Text_Capacity" id="Text_Capacity"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="box-orange" id="Submit" value=" ADD ">
      </label></td>
    </tr>
  </table>
  </form>
    <div align="center" class="style2">
      <p>&nbsp;</p>
      <p>
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