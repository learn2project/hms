<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<script>
function adddept(str){
var rg=parseInt(str);
window.location.replace("http://localhost:8084/Hospital_Management_System/App1.jsp?nid="+rg);
}
</script>
    <style type="text/css">
<!--
.style4 {font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333; font-weight: bold; }
-->
    </style>
</head>
<body>
	<div id="header">
		<a href="index.jsp" class="logo"><img src="images/logo.png" alt=""></a>
		<ul>
			<li>
				<a href="index.jsp">home</a>			</li>
			<li>
				<a href="about.html">about</a>			</li>
			<li>
				<a href="services.html">services</a>			</li>
			<li>
				<a href="schedule.html">Schedule &amp; Fees</a>			</li>
			<li>
				<a href="contact.html">contact</a>			</li>
			<li>
				<a href="notice.jsp">News Room</a>			</li>
		</ul>
</div>
<div id="body">
  <p>  </p>
  <form method="post" action="AppointmentServ">
   <%!
Connection conn = null;
ResultSet rs =null;
Statement st=null;
%>
<%
String v=request.getParameter("value");
int vv=Integer.parseInt(request.getParameter("nid"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
st = conn.createStatement();
rs = st.executeQuery("select * from department");
%>
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="224"><div align="right" class="style4">Department</div></td>
      <td width="306">
      <select name="dept" id="dept" onChange="adddept(this.value)">
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
    </select>
      </td>
    </tr>
    <tr>
      <td><div align="right" class="style4">Doctor</div></td>
      <td>
      <select name="doc">
    <%
String id=request.getParameter("value");
rs=st.executeQuery("select * from doctor where dept_id=" + vv);
while(rs.next()){
%>
<option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
<%
}
%>
    </select>
      </td>
    </tr>
    <tr>
      <td><div align="right" class="style4">Name</div></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style4">Sex</div></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style4">Age</div></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style4">Phone Number</div></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style4">Address</div></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style4">Email</div></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style4">Date</div></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style4">Payment mode</div></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="box-orange" id="Submit" value="   Submit   ">
      </label></td>
    </tr>
  </table>
  </form>
  <p> </p>
  <p> </p>
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