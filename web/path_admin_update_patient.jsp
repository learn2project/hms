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
.style1 {
	color: #333333;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style2 {
	color: #009933;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
-->
    </style>

<script>
function xyz(str){
var rg=parseInt(str);
window.location.replace("http://localhost:8084/Hospital_Management_System/path_admin_update_patient.jsp?nid="+rg);
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
  <div align="center">
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
  </div>
  <form method="post" action="UpdatePathPatientServ">
  <%
Connection conn = null;
ResultSet rs =null;
Statement st=null;
int vv=Integer.parseInt(request.getParameter("nid"));
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
st = conn.createStatement();
rs = st.executeQuery("select * from pathologypatient where id="+vv);
rs.next();
String n,sex,age,phone,address,doctor;
n=rs.getString("name");
sex=rs.getString("sex");
age=rs.getString("age");
phone=rs.getString("phone");
address=rs.getString("address");
doctor=rs.getString("doctor");
%>

  <table width="606" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="211"><div align="right" class="style1">Enter Patient's Id</div></td>
      <td width="384"><label>
        <input name="Text_Id" type="text" id="Text_Id" size="40" value="<%=vv%>" onChange="xyz(this.value)">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Enter Name</div></td>
      <td><label>
        <input name="Text_Name" type="text" id="Text_Name" size="40" value="<%=n%>">
      </label></td>
    </tr>
    <tr>
      <td height="40"><div align="right" class="style1">Select Sex</div></td>
      <td><p>
        <label><input type="radio" name="Radio_Sex" value="male" id="Radio_Sex_0">Male</label>
        <label><input type="radio" name="Radio_Sex" value="female" id="Radio_Sex_0" checked>Female</label> 
      </p></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Enter Age</div></td>
      <td><label>
        <input type="text" name="Text_Age" id="Text_Age" value="<%=age%>">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Enter Phone Number</div></td>
      <td><label>
        <input type="text" name="Text_Phone" id="Text_Phone" value="<%=phone%>">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Enter Address</div></td>
      <td><label>
      <input name="Text_Address" type="text" id="Text_Address" value="<%=address%>" size="50">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Doctor's Name</div></td>
      <td><label>
        <input type="text" name="Text_Doctor" id="Text_Doctor" value="<%=doctor%>">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="box-orange" id="Submit" value="  UPDATE ">
      </label></td>
    </tr>
  </table>
  </form>
  
   <div align="center" class="style2">
     <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
    </div>
  <div align="center">
    <%
  }
  
  else
  {
  response.sendRedirect("admin_login.jsp");
  }
  %>
  </div>
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