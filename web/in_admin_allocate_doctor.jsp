<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin | Illume</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style25 {font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333; }
.style26 {
	font-size: 16px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #006633;
}
-->
    </style>
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
  <p>
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
  </p>
  <p align="center" class="style26">
   <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
  </p>
  <form method="post" action="AdmitAllocateDocServ">
  <table width="900" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="339"><div align="right" class="style25">Patient ID : </div></td>
      <td width="491"><label>
        <input type="text" name="Text_ID" id="Text_ID">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style25">Doctor</div></td>
      <td><select name="List_Doc" id="List_Doc">
        <%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root", "system");
Statement st = conn.createStatement();
ResultSet rs=st.executeQuery("select * from doctor");
while(rs.next())
{
if(rs.getInt("id")==0)
{
%>
<option value="<%=rs.getInt("id")%>" selected disabled><%=rs.getString("name")%></option>
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
      <td><div align="right" class="style25"> Date</div></td>
      <td><select name="List_Day">
     <option value="Day" selected disabled> Day </option>
     <%
	  	for (int i=1;i<=31;i++)
		{
	 %>
     	   <option value="<%= i %>"><%= i %></option>
     <% 
	 	} 
	 %>
            </select>
        <select name="List_Month" id="List_Month">
        <option value="1" selected disabled> MONTH </option>
        <option value="Jan"> January </option>
        <option value="Feb"> February </option>
        <option value="Mar"> March </option>
        <option value="Apr"> April </option>
        <option value="May"> May </option>
        <option value="Jun"> June </option>
        <option value="Jul"> July </option>
        <option value="Aug"> August </option>
        <option value="Sep"> September </option>
        <option value="Oct"> October </option>
        <option value="Nov"> November </option>
        <option value="Dec"> December </option>
   	    </select>
        <select name="List_Year">
          <option value="Year" selected disabled> Year </option>
          <option value="2012">2012</option>
          <option value="2013">2013</option>
          <option value="2014">2014</option>  
        </select>      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="box-orange" id="Submit" value="  Allocate  ">
      </label></td>
    </tr>
  </table>
  </form>
  <p>&nbsp; </p>
  <p>
  
  </p>
  
 
  <p>
    <%
  }
  
  else
  {
  response.sendRedirect("admin_login.jsp");
  }
  %>
  </p>
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