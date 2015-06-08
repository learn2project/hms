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
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #333333;
}
.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #006600;
	font-size: 16;
}
-->
    </style>
<script>
function xyz(str){
var rg=parseInt(str);
window.location.replace("http://localhost:8084/Hospital_Management_System/path_admin_make_report.jsp?nid="+rg);
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
  <form method="post" action="PathReportServ">
  <%
  			int vv=Integer.parseInt(request.getParameter("nid"));

  %>
    <table width="750" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="291"><div align="right" class="style1">Patient's Id</div></td>
      <td width="389"><label>
        <input type="text" name="Text_Id" id="Text_Id" value="<%=vv%>" onChange="xyz(this.value)">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1"> Test</div></td>
      <td><label>
        <select name="List_Test" id="List_Test">
         <%
        	Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            Statement stmt;
            con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select t.id,t.name from pathologypatient pp,pathologytestdetails pt,test t where pp.id="+vv+" and pp.id=pt.patientid and pt.testid=t.id and pt.report='Pending' order by t.name");
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
      <td><div align="right" class="style1"> Report Date</div></td>
      <td>
      <select name="List_Date" id="List_Date">
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
        </select>
      </td>
    </tr>
    <tr>
      <td><div align="right" class="style1"> Result</div></td>
      <td><label>
        <textarea name="Text_Result" cols="50" rows="10" wrap="off" id="Text_Result"></textarea>
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1">Performed By</div></td>
      <td><label>
        <input name="Text_Perform" type="text" id="Text_Perform" size="40">
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
  <p align="center" class="style2">
  <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
  </p>
  
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