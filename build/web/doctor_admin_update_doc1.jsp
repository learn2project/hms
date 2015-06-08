<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Doctor</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style2 {color: #009933}
.style3 {
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
        String name1="";
try
        {
        	name1=(session.getAttribute("user")).toString();
         }
         catch(Exception ee)
         {
         	response.sendRedirect("index.jsp");
         }        if(name1.equalsIgnoreCase("admin"))
        {

%>
  <p>&nbsp;</p>
  <form method="post" action="UpdateDocServ">
    <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
      <tr>
        <td class="style3"><div align="right">Department</div></td>
        <td width="420"><label>
          <select name="List_Dept" id="List_Dept">
            <%
         Class.forName("com.mysql.jdbc.Driver");
            Connection con,con1,con2;
            PreparedStatement stmt,stmt1,stmt2;
            con=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt=con.prepareStatement("select * from department order by name");
			con2=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt2=con.prepareStatement("select * from department where id=?");
			con1=DriverManager.getConnection("jdbc:mysql:///hms","root","system");
            stmt1=con.prepareStatement("select * from doctor where id=?");
            int docid=Integer.parseInt(request.getParameter("List_Doc"));
			stmt1.setInt(1,docid);
            ResultSet rs=stmt.executeQuery();
			ResultSet rs1=stmt1.executeQuery();
                        rs.next();
                        rs1.next();
			int age,fee,dept_id,id;
			String name,sex,phone,address,email,degree;
                        id=rs1.getInt("id");
                        dept_id=rs1.getInt("dept_id");
			age=rs1.getInt("age");
			fee=rs1.getInt("fee");
			name=rs1.getString("name");
			sex=rs1.getString("sex");
			phone=rs1.getString("phone");
			address=rs1.getString("address");
			email=rs1.getString("email");
			degree=rs1.getString("degree");
			stmt2.setInt(1,dept_id);
			ResultSet rs2=stmt2.executeQuery();
                        rs2.next();
			String x=rs2.getString("name");
            while(rs.next())
            {
                int did=rs.getInt(1);
                String dname=rs.getString(2);
         %>
            
            <option value=<%=did%> ><%=dname%></option>
            <%
            }
            %>
            <option value=<%=dept_id%> selected><%=x%></option>
          </select>
        </label></td>
      </tr>
      <tr>
        <td class="style3"><div align="right">Name</div></td>
        <td><label>
          <input name="Text_Name" type="text" id="Text_Name" size="50" value="<%=name%>">
        </label></td>
      </tr>
      <tr>
        <td><div align="right" class="style3">Sex</div></td>
        <td><p>
            <label>
            <input name="RadioGroup1" type="radio" id="RadioGroup1_0" value="male">
              Male</label>
            <label>
            <input type="radio" name="RadioGroup1" value="female" id="RadioGroup1_1">
              Female</label>
            <br>
        </p></td>
      </tr>
      <tr>
        <td><div align="right" class="style3">Age</div></td>
        <td><label>
          <input name="Text_Age" type="text" id="Text_Age" size="10" value="<%=age%>">
        </label></td>
      </tr>
      <tr>
        <td class="style3"><div align="right">Phone Number</div></td>
        <td><label>
          <input name="Text_Phone" type="text" id="Text_Phone" size="50" value="<%=phone%>">
        </label></td>
      </tr>
      <tr>
        <td><div align="right" class="style3">Address</div></td>
        <td><input name="Text_Address" type="text" id="Text_Address" size="65" value="<%=address%>"></td>
      </tr>
      <tr>
        <td><div align="right" class="style3">Email id</div></td>
        <td><label>
          <input name="Text_Mail" type="text" id="Text_Mail" size="65" value="<%=email%>">
        </label></td>
      </tr>
      <tr>
        <td class="style3"><div align="right">Degree</div></td>
        <td><label>
          <input name="Text_Degree" type="text" id="Text_Degree" size="65" value="<%=degree%>">
        </label></td>
      </tr>
      <tr>
        <td><div align="right" class="style3"> Fee</div></td>
        <td><label>
          <input type="text" name="Text_Fee" id="Text_Fee" value="<%=fee%>">
        </label></td>
      </tr>
      <tr>
        <td><input type="hidden" name="doc_id" value="<%=id%>"></td>
        <td><label>
          <input name="Submit" type="submit" class="box-orange" id="Submit" value="Submit">
        </label></td>
      </tr>
    </table>
  </form>
  <p>&nbsp;</p>
  <div align="center" class="style2">
    <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
  </div>
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