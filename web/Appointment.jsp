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
    <style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-size: 16;
}
.style2 {
	font-size: 36px;
	color: #990099;
}
.style3 {font-size: 16px}
.style6 {color: #FF0000; font-size: 16px; }
-->
    </style>
<script>
function adddept(str){
var rg=parseInt(str);
window.location.replace("http://localhost:8084/Hospital_Management_System/Appointment.jsp?nid="+rg);
}
</script>

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
   <form action="App2" method="post">
<%
	Connection conn = null;
	ResultSet rs =null;
	Statement st=null;
	int vv=Integer.parseInt(request.getParameter("nid"));
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
	st = conn.createStatement();
	rs = st.executeQuery("select * from department order by id");
%>
  <table width="840" border="1" align="center" cellpadding="5" cellspacing="6" bordercolor="#FBFBD5">
    <tr>
      <td colspan="3"><div align="center" class="style2">Enter Details</div></td>
    </tr>
    <tr>
      <td width="270"><div align="right" class="style1 style3">*Department</div></td>
      <td width="438"><label>
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
      </label></td>
      <td width="70">&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style6">*Doctor</div></td>
      <td><label>
        <select name="doc" id="doc">
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
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style6">*Patient Name</div></td>
      <td><label>
        <input name="Text_Name" type="text" id="Text_Name" size="45">
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style6">*Sex</div></td>
<td><label>
            <input type="radio" name="Radio_Sex" value="male" id="Radio_Sex_0">
            Male</label>
          <label>
            <input type="radio" name="Radio_Sex" value="female" id="Radio_Sex_1">
            Female</label>      </td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style6">*Age</div></td>
      <td><label>
        <input name="Text_Age" type="text" id="Text_Age" size="45">
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style3">Phone no</div></td>
      <td><label>
        <input name="Text_Phone" type="text" id="Text_Phone" size="45" maxlength="13">
      ( with country code)</label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style6">*Address</div></td>
      <td><label>
        <input name="Text_Address" type="text" id="Text_Address" size="45">
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style3">E-mail</div></td>
      <td><label>
        <input name="Text_Email" type="text" id="Text_Email" size="45">
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style6">*Date</div></td>
      <td><select name="List_Date" id="List_Date">
      <option value="Day" selected disabled> Day </option>
      <%
	  	for (int i=1;i<=31;i++)
		{
		%>
        <option value="<%= i %>">
        <%= i %>
        </option>
        <% } %>
        </select>
        <select name="List_Month" id="List_Month">
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
        <select name="List_Year" id="List_Year">
        <option value="Year" selected disabled> Year </option>
          <option value="2012">2012</option>
          <option value="2013">2013</option>
          <option value="2014">2014</option>  
        </select></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right" class="style6">*Payment Mode</div></td>
      <td><p>
        <label>
          <input type="radio" name="Radio_Payment" value="Cash" id="Radio_Payment_0">
          Cash(Offline)</label>
        <label>
          <input type="radio" name="Radio_Payment" value="Card" id="Radio_Payment_1">
          Credit / Debit Card</label>
        <label>
          <input type="radio" name="Radio_Payment" value="Net" id="Radio_Payment_0">
          Net Banking</label>
        <br>
      </p></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right"></div></td>
      <td colspan="2"><label>
      <input name="Submit" type="submit" class="box-orange" id="submit" value="   Submit   ">
      </label></td>
    </tr>

    <tr>
      <td><div align="right"></div></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
  </form>
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