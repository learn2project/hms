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
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #333333;
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
<form method="post" action="RecTestServ">
  <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="258"><div align="right"><span class="style1">Select Test</span></div></td>
      <td width="272"><label>
        <select name="List_Test" id="List_Test">
        <%
         Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            PreparedStatement stmt;
            con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt=con.prepareStatement("select * from test where status<>'yes' order by name");
            ResultSet rs=stmt.executeQuery();
            while(rs.next())
            {
                int did=rs.getInt(1);
                String dname=rs.getString(2);
				if(did==0)
				{
         %>

                <option value=<%=did%> selected disabled><%=dname%></option>
                  <%
            }
			else
			{
			%>

                <option value=<%=did%>><%=dname%></option>
                  <%
				  }
                               }
            %>
        </select>
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input name="button" type="submit" class="box-blue" id="button" value="  Reactive  "></td>
    </tr>
  </table>
  </form>
  <p>&nbsp;</p>
  <div align="center">
     <p>
       <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
     </p>
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