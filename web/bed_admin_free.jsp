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
	color: #333333;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style2 {color: #F5F5CF}
.style3 {color: #006600}
-->
    </style>
<script type="text/javascript">
//form validation
function validateForm()
{
var x=document.forms["myForm"]["Text_Max"].value
var y=/^\d+$/
if (x==null || x=="")
  {
  alert("Numeric Only");
  myForm.Text_Max.focus();
  return false;
  }
else if (!y.test(x))		
    	{
    	alert("Numeric Only");
  		myForm.Text_Max.focus();
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
<form name="myForm" method="post" action="DelBedServ" onSubmit="return validateForm()">
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="262"><p align="right" class="style1">Select Bed</p>      </td>
      <td width="268"><label>
        <select name="List_Name" id="List_Name">
        
        <%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con;
        PreparedStatement stmt;
        con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
		stmt=con.prepareStatement("select * from bed order by name");
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
		String name1=rs.getString("name");
		if(name1.equalsIgnoreCase("--SELECT--"))
		{
		%>
        <option value=<%=name1%> selected disabled><%=name1%></option>
        <%
		}
		else
		{
		%>
		<option value=<%=name1%>><%=name1%></option>
		<%
		}
		}
        %>
          </select>
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Enter Quantity</div></td>
      <td><label>
        <input type="text" name="Text_Max" id="Text_Max">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><span class="style2">
        <label>
        <input name="Submit" type="submit" class="box-orange" id="Submit" value="Remove">
        </label>
      </span></td>
    </tr>
  </table>
  </form>
   <div align="center" class="style3">
     <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
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