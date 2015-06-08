<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Error</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<div id="header">
		<a href="index.jsp" class="logo"><img src="images/logo.png" alt=""></a>
		<ul>
			<li>
				<a href="index.jsp">home</a>			</li>
			<li>
				<a href="about.html">about</a>			</li>
			<li>
				<a href="services.html">services</a>			</li>
			<li>
				<a href="schedule.html">Schedule &amp; Fees</a>			</li>
			<li>
				<a href="contact.html">contact</a>			</li>
			<li>
				<a href="notice.jsp">News Room</a>			</li>
		</ul>
</div>
<div id="body">
  
  <%
  String msg=(session.getAttribute("error")).toString();
  String rpage=(session.getAttribute("page")).toString();
  %>    
   <p align="center" style="font-size:20px;font-weight: bold; color:#FF0000"><%=msg%></p>
        
        <div align="center"><a href=<%=rpage%>>Back</a>   
  
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