<%@page import="java.sql.*"%>
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
<script type="text/javascript">
//form validation
function validateForm()
{
var x=document.forms["myForm"]["Text_Count"].value
var y=/^\d+$/
if (x==null || x=="")
  {
  alert("Numeric Only");
  myForm.Text_Count.focus();
  return false;
  }
else if (!y.test(x))		
    	{
    	alert("Numeric Only");
  		myForm.Text_Count.focus();
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
<form name="myForm" method="post" action="DispatchBloodServ" onSubmit="return validateForm()">
 <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td><div align="right"><span class="style1">Blood Group</span></div></td>
      <td><label>
        <select name="List_Group" id="List_Group">
        <%
		Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
		PreparedStatement ps=con.prepareStatement("select * from bloodbank where count>0 order by bloodgroup");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
		String n=rs.getString("bloodgroup");
		if(n.equals("--SELECT--"))
		{
		%>
        <option value=<%=n%> selected disabled><%=n%></option>
        <%
		}
		else
		{
		%>
        <option value=<%=n%>><%=n%></option>
        <%
		}
		}
		%>
        </select>
      </label></td>
    </tr>
    <tr>
      <td class="style1"><div align="right">Count</div></td>
      <td><label>
        <input type="text" name="Text_Count" id="Text_Count">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="Dispatch" type="submit" class="box-orange" id="Dispatch" value="Dispatch">
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