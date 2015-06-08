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
.style2 {font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333; }
-->
    </style>
    
<script>
function uptest(str){
var did=document.getElementById("Test").selectedIndex;
var val = document.getElementById("Test").options[did].text;
var rg=parseInt(str);
window.location.replace("http://localhost:8084/Hospital_Management_System/test_admin_update.jsp?id="+did+"&value="+val+"&nid="+rg);
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
<form method="post" action="UpTestServ">
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
rs = st.executeQuery("select * from test order by name");
%>
  <table width="600" border="1" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="257"><div align="right" class="style2">Select Test</div></td>
      <td width="267"><label>
        <select name="Test" id="Test" onChange="uptest(this.value)">
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
    </tr>
     <%
		rs=st.executeQuery("select * from test where id=" + vv);
		rs.next();
	%>
    <tr>
      <td><div align="right" class="style2">Name</div></td>
      <td><label>
        <input type="text" name="Text_Name" id="Text_Name" value="<%=rs.getString("name")%>">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style2">Amount</div></td>
      <td><input type="text" name="Text_Amount" id="Text_Amount" value="<%=rs.getString("amount")%>"></td>
    </tr>
    <tr>
      <td><div align="right" class="style2">Status</div></td>
      <td><select name="List_Status" id="List_Status">
      		<%
			String sts=rs.getString("status");
			if(sts.equalsIgnoreCase("yes"))
			{
			%>
            	<option value="yes" selected>Available</option>
                <option value="no">Not Available</option>
			<%
			}
			else
			{
			%>
            	<option value="yes">Available</option>
				<option value="no" selected>Not Available</option>
            <%
			}
			%>
            </select></td>
    </tr>
    <tr>
      <td><div align="right" class="style2">Specimen</div></td>
      <td><input type="text" name="Text_Specimen" id="Text_Specimen" value="<%=rs.getString("specimen")%>"></td>
    </tr>
    <tr>
      <td><div align="right" class="style2">Delay</div></td>
      <td><input type="text" name="Text_Delay" id="Text_Delay" value="<%=rs.getString("delay")%>"> 
        ( in days )</td>
    </tr>
    <tr>
      <td><input type="hidden" name="Hidden_Id" value="<%=vv%>"></td>
      <td><label>
        <input name="Submit" type="submit" class="box-orange" id="Submit" value="  UPDATE  ">
      </label></td>
    </tr>
  </table>
  </form>
  <p>&nbsp;</p>
  <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
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