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
.style2 {color: #009966}
.style3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #333333;
}
.style11 {font-size: 30px}
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

function adddept(str){
var rg=parseInt(str);
window.location.replace("http://localhost:8084/Hospital_Management_System/doctor_admin_add_schedule.jsp?nid="+rg);
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
<%
Connection conn = null;
ResultSet rs =null;
Statement st=null;
int vv=Integer.parseInt(request.getParameter("nid"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
st = conn.createStatement();
rs = st.executeQuery("select * from department order by name");
%>

<form name="myForm" method="post" action="AddDoctorScheduleServ1" onSubmit="return validateForm()">
  <table width="800" border="0" align="center" cellpadding="10" cellspacing="10">
  <tr>
     <td width="221"><div align="right"><span class="style3">Department</span></div></td>
     <td><select name="dept" id="dept" onChange="adddept(this.value)">
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
      <td><div align="right"><span class="style3">Doctor</span></div></td>
      <td width="221"><select name="List_Doctor" id="List_Doctor">
       <%
String id=request.getParameter("value");
rs=st.executeQuery("select * from doctor where dept_id=" + vv);
while(rs.next()){
%>
<option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
<%
}
%>
      </select></td>
      <td colspan="2">&nbsp;</td>
      </tr>
    <tr>
      <td class="style3"><div align="right">Day of Week</div></td>
      <td colspan="3">
      <select name="List_Day" size="1" id="List_Day">
      <option value="0" selected disabled> --SELECT-- </option> 
      <option value="Monday"> Monday </option> 
      <option value="Tuesday"> Tuesday </option> 
      <option value="Wednesday"> Wednesdy </option> 
      <option value="Thursday"> Thursday </option> 
      <option value="Friday"> Friday </option> 
      <option value="Saturday"> Saturday </option> 
      <option value="Sunday"> Sunday </option> 
      </select></td>
      </tr>
    <tr>
      <td class="style3"><div align="right">Start &amp; End Time</div></td>
      <td><select name="Start_1" size="1" id="Start_1">
      <option value="999" selected disabled> --SELECT-- </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Start_2" size="1" id="Start_2">
        <option value="999" selected disabled> --SELECT-- </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td colspan="2"><select name="End_1" size="1" id="End_1">
      <option value="999" selected disabled> --SELECT-- </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="End_2" size="1" id="End_2">
        <option value="999" selected disabled> --SELECT-- </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      </tr>
      <tr>
      <td class="style3"><div align="right">Maximum patient</div></td>
      <td colspan="3"><label>
        <input type="text" name="Text_Count" id="Text_Count">
      </label></td>
      </tr>
    <td>&nbsp;</td>
      <td colspan="2"><div align="center">
        <input name="submit2" type="submit" class="box-orange" id="submit2" value=" ADD ">        
      </div>        <label></label></td>
      <td width="207">&nbsp;</td>
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