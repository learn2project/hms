<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add Doctor</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #333333;
}
.style2 {color: #009933}
-->
    </style>
<script type="text/javascript">
//form validation
function validateForm()
{
var a=document.forms["myForm"]["Text_Name"].value
var b=document.forms["myForm"]["Text_Age"].value
var c=document.forms["myForm"]["Text_Phone"].value
var d=document.forms["myForm"]["Text_Address"].value
var e=document.forms["myForm"]["Text_Mail"].value
var f=document.forms["myForm"]["Text_Degree"].value
var g=document.forms["myForm"]["Text_Fee"].value
var y=/^\d+$/
if (a==null || a=="")
  {
  alert("Name cannot be blank...");
  myForm.Text_Name.focus();
  return false;
  }
else if (b==null || b=="")
  {
  alert("Age cannot be blank...");
  myForm.Text_Age.focus();
  return false;
  }
else if (!y.test(b))		
    	{
    	alert("Age is numeric only");
  		myForm.Text_Age.focus();
    	return false;
  		}
else if (c==null || c=="")
  {
  alert("Phone number cannot be blank...");
  myForm.Text_Phone.focus();
  return false;
  }
else if (d==null || d=="")
  {
  alert("Address cannot be blank...");
  myForm.Text_Address.focus();
  return false;
  }
else if (e==null || e=="")
  {
  alert("E-Mail cannot be blank...");
  myForm.Text_Mail.focus();
  return false;
  }
else if (f==null || f=="")
  {
  alert("Degree cannot be blank...");
  myForm.Text_Degree.focus();
  return false;
  }
else if (g==null || g=="")
  {
  alert("Fee cannot be blank...");
  myForm.Text_Fee.focus();
  return false;
  }
else if (!y.test(g))		
    	{
    	alert("Fee is numeric only");
  		myForm.Text_Fee.focus();
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
  <form name="myForm" method="post" action="AddDocServ" onSubmit="return validateForm()">
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td class="style1"><div align="right">Department</div></td>
      <td width="420"><label>
        <select name="List_Dept" id="List_Dept">
         <%
         Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            PreparedStatement stmt;
            con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt=con.prepareStatement("select * from department order by name");
            ResultSet rs=stmt.executeQuery();
            while(rs.next())
            {
                int did=rs.getInt(1);
                String dname=rs.getString(2);
         %>

                <option value=<%=did%> selected><%=dname%></option>
                  <%
            }
            %>
        </select>
      </label></td>
    </tr>
    <tr>
      <td class="style1"><div align="right">Name</div></td>
      <td><label>
        <input name="Text_Name" type="text" id="Text_Name" size="50">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Sex</div></td>
      <td><p>
        <label>
          <input type="radio" name="RadioGroup1" value="male" id="RadioGroup1_0">
          Male</label>
        <label>
          <input type="radio" name="RadioGroup1" value="female" id="RadioGroup1_1">
          Female</label>
        <br>
      </p></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Age</div></td>
      <td><label>
        <input name="Text_Age" type="text" id="Text_Age" size="10">
      </label></td>
    </tr>
    <tr>
      <td class="style1"><div align="right">Phone Number</div></td>
      <td><label>
        <input name="Text_Phone" type="text" id="Text_Phone" size="50">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Address</div></td>
      <td><input name="Text_Address" type="text" id="Text_Address" size="65"></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Email id</div></td>
      <td><label>
        <input name="Text_Mail" type="text" id="Text_Mail" size="65">
      </label></td>
    </tr>
    <tr>
      <td class="style1"><div align="right">Degree</div></td>
      <td><label>
        <input name="Text_Degree" type="text" id="Text_Degree" size="65">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">
        Fee</div></td>
      <td><label>
        <input type="text" name="Text_Fee" id="Text_Fee">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="box-orange" id="Submit" value="Submit">
      </label></td>
    </tr>
  </table>
  </form>
  <p>&nbsp;</p>
  <div align="center" class="style2">
    <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
  </div>
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