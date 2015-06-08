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
     
    <script>
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
rs = st.executeQuery("select * from department");
%>

<form method="post" action="AddDoctorScheduleServ1">
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
  <tr>
     <td width="127"><div align="right"><span class="style3">Department</span></div></td>
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
      <td width="145"><select name="List_Doctor" id="List_Doctor">
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
      <td class="style3"><div align="right">Monday</div></td>
      <td><select name="Monday_Start_1" size="1" id="Monday_Start_1">
      <option value="999" selected disabled> NA </option>
      <%
	  	for (int i=0;i<=23;i++)
		{
		%>
        <option value="<%=i%>">   <%=i%>          </option>
        <% 
		} 
		%>        
      </select>
        <span class="style11">:</span>
        <select name="Monday_Start_2" size="1" id="Monday_Start_2">
          <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td colspan="2"><select name="Monday_End_1" size="1" id="Monday_End_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Monday_End_2" size="1" id="Monday_End_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      </tr>
    <tr>
      <td class="style3"><div align="right">Tuesday</div></td>
      <td><select name="Tuesday_Start_1" size="1" id="tuesday_start_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Tuesday_Start_2" size="1" id="tuesday_start_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td colspan="2"><select name="Tuesday_End_1" size="1" id="tuesday_end_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Tuesday_End_2" size="1" id="tuesday_end_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      </tr>
    <tr>
      <td><div align="right"><span class="style3">Wednesday</span></div></td>
      <td><select name="Wednesday_Start_1" size="1" id="wednesday_start_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Wednesday_Start_2" size="1" id="wednesday_start_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td width="184"><select name="Wednesday_End_1" size="1" id="wednesday_end_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Wednesday_End_2" size="1" id="wednesday_end_2">
          <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td width="14">&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right"><span class="style3">Thursday</span></div></td>
      <td><select name="Thursday_Start_1" size="1" id="thursday_start_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Thursday_Start_2" size="1" id="thursday_start_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td><select name="Thursday_End_1" size="1" id="thursday_end_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Thursday_End_2" size="1" id="thursday_end_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right"><span class="style3">Friday</span></div></td>
      <td><select name="Friday_Start_1" size="1" id="friday_start_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Friday_Start_2" size="1" id="friday_start_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td><select name="Friday_End_1" size="1" id="friday_end_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Friday_End_2" size="1" id="friday_end_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td width="127"><div align="right"><span class="style3">Saturday</span></div></td>
      <td><select name="Saturday_Start_1" size="1" id="saturday_start_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Saturday_Start_2" size="1" id="saturday_start_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td><select name="Saturday_End_1" size="1" id="saturday_end_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Saturday_End_2" size="1" id="saturday_end_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right"><span class="style3">Sunday</span></div></td>
      <td><select name="Sunday_Start_1" size="1" id="sunday_start_1">
        <option value="999" selected disabled> NA </option>
        <%
	  	for (int i=00;i<=23;i++)
		{
		%>
        <option value="<%= i %>"> <%= i %> </option>
        <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Sunday_Start_2" size="1" id="sunday_start_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td><select name="Sunday_End_1" size="1" id="sunday_end_1">
      <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=23;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
      </select>
        <span class="style11">:</span>
        <select name="Sunday_End_2" size="1" id="sunday_end_2">
        <option value="999" selected disabled> NA </option>
          <%
	  	for (int i=00;i<=59;i++)
		{
		%>
          <option value="<%= i %>"> <%= i %> </option>
          <% } %>
        </select></td>
      <td>&nbsp;</td>
    </tr>
    <td>&nbsp;</td>
      <td colspan="2"><div align="center">
        <input name="submit2" type="submit" class="box-orange" id="submit2" value=" ADD ">        
      </div>        <label></label></td>
      <td>&nbsp;</td>
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