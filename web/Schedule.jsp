<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Schedule</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style2 {
	color: #009933
}
.style3 {font-family: Verdana, Arial, Helvetica, sans-serif}
-->
    </style>
    
    <script>
function adddept(str){
var rg=parseInt(str);
window.location.replace("http://localhost:8084/Hospital_Management_System/Schedule.jsp?&nid="+rg);
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

<form method="post" action="Schedule1.jsp">
 <%!
Connection conn = null;
ResultSet rs =null;
Statement st=null;
%>
<%
int vv;
String v=request.getParameter("value");
try{
vv=Integer.parseInt(request.getParameter("nid"));
}
catch(Exception e){vv=0;}
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
st = conn.createStatement();
rs = st.executeQuery("select * from department order by name");
%>

<table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
  <tr>
    <td width="273"><div align="right" class="style3">Department Name</div></td>
    <td width="257"><select name="dept" id="dept" onChange="adddept(this.value)">
   <% while(rs.next())
   { 
   if(rs.getInt("id")==vv)
		{
	%>
			<option value="<%=vv%>" selected disabled><%=rs.getString("name")%></option>
	<%
		}
		else
		{
    %>
		<option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>

	<% 
		
		}
	}
	%>
    </select></td>
  </tr>
  <tr>
    <td><div align="right" class="style3">Doctor's Name</div></td>
    <td><select name="doc">
    <%
String id=request.getParameter("value");
rs=st.executeQuery("select * from doctor where dept_id=" + vv+" order by name");
while(rs.next()){
%>
<option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
<%
}
%>
    </select></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><label>
      <input name="Submit" type="submit" class="box-orange" id="Submit" value="  VIEW  ">
    </label></td>
  </tr>
</table>
<br><br>
</form>     
  <p>  </p>
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