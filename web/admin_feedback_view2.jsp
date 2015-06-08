<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin | Illume</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
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
String name1,email,number,subject,message;
                name1=request.getParameter("hiddenname");
                email=request.getParameter("hiddenemail");
                number=request.getParameter("hiddennumber");
                subject=request.getParameter("hiddensubject");
                message=request.getParameter("hiddenmessage");
%>
<form method="post" action="FeedbackReplyServ">
 <table width="600" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="178"><div align="right">Reply</div></td>
      <td width="352"><label>
        <textarea name="text_reply" cols="50" rows="4" id="text_reply"></textarea>
      </label></td>
    </tr>
    <tr>
      <td>
      <input type="hidden" name="hiddenname" value="<%=name1%>">
  	  <input type="hidden" name="hiddenemail" value="<%=email%>">
          <input type="hidden" name="hiddennumber" value="<%=number%>">
          <input type="hidden" name="hiddensubject" value="<%=subject%>">
          <input type="hidden" name="hiddenmessage" value="<%=message%>">
      </td>
      <td><label>
        <input name="submit" type="submit" class="box-orange" id="submit" value="Reply">
      </label></td>
    </tr>
  </table>
</form>
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
