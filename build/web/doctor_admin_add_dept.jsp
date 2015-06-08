<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add Department</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #666666;
}
.style2 {color: #009933}
-->
    </style>
<script type="text/javascript">
//form validation
function validateForm()
{
var x=document.forms["myForm"]["Text_Dept"].value
var y=/^\d+$/
if (x==null || x=="")
  {
  alert("Cannot be blank..");
  myForm.Text_Dept.focus();
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
         }        if(name.equalsIgnoreCase("admin"))
        {

%>
  <p>&nbsp;</p>
  <form name="myForm" method="post" action="AddDeptServ" onSubmit="return validateForm()">
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="288"><div align="right" class="style1">Enter New Department</div></td>
      <td width="285"><label>
        <input name="Text_Dept" type="text" id="Text_Dept" size="50">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" class="box-blue" value="      A D D      "></td>
    </tr>
  </table>
  </form>
  <p align="center" class="style2">
   <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
  &nbsp;</p>
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