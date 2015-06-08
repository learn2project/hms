<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin | Illume</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style1 {color: #333333}
.style6 {
	font-size: 14px
}
.style8 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;
}
.style11 {color: #333333; font-size: 14px; font-family: Verdana, Arial, Helvetica, sans-serif; }
.style15 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 16px;
	font-weight: bold;
	color: #009933;
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

   
    <p align="center" class="style15">
          <%
  String s;
  s=request.getParameter("msg");
  out.write(s);
  %>
    </p>
    <form method="post" action="AdmitPatientAddServ">
    <table width="648" border="0" align="center" cellpadding="10" cellspacing="10">
    
    <tr>
      <td width="210"><div align="right" class="style1 style6 style8">Name</div></td>
      <td width="368"><label>
        <input type="text" name="Text_Name" id="Text_Name">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style11"> Sex</div></td>
      <td><label>
            <input type="radio" name="Male" value="Male" id="R1">
            Male</label> 
          <label><input type="radio" name="Male" value="Female" id="R">
            Female</label></td>
    </tr>
    <tr>
      <td><div align="right" class="style11"> Age</div></td>
      <td><label>
        <input type="text" name="Text_Age" id="Text_Age">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style8"><span class="style1"> Phone Number</span>.</div></td>
      <td><label>
        <input type="text" name="Text_Phone" id="Text_Phone">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style11"> Address</div></td>
      <td><label>
        <input type="text" name="Text_Address" id="Text_Address">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style11">Reference Name</div></td>
      <td><label>
        <input type="text" name="Text_Refname" id="Text_Refname">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style11">Reference Phone</div></td>
      <td><label>
        <input type="text" name="Text_Refph" id="Text_Refph">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style11">Email id</div></td>
      <td><label>
        <input type="text" name="Text_Email" id="Text_Email">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style11">Disease</div></td>
      <td><label>
        <input type="text" name="Text_Disease" id="Text_Disease">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style11">Admission Date</div></td>
      <td><label>
        <select name="List_Day" id="List_Day">
        <option value="DAY" selected disabled>DAY</option>
        <% 
		for(int i=1;i<=31;i++)
		{
		%>
        <option value=<%=i%>> <%=i%> </option>
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
        <select name="List_Year" id="List_Year">
        <option value="1" selected disabled> YEAR </option>
        <option value="2012"> 2012 </option>
        <option value="2013"> 2013 </option>
        <option value="2014"> 2014 </option>
      </select>
      </label></td>
    </tr>
    <tr>
      <td> <div align="right" class="style8">Identification Details</div></td>
      <td><label>
        <input type="text" name="Text_Idno" id="Text_Idno">
      </label></td>
    </tr>
    <tr>
      <td><div align="right" class="style1"></div></td>
      <td><label>
        <input name="Submit" type="submit" class="box-orange" id="Submit" value=" A D D ">
      </label></td>
    </tr>
  </table>
  </form>
  <div align="right"></div>
  
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