<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home | Illume</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
    <%
                String msg="";
                session.setAttribute("user",msg);       
%>
	<div id="header">
		<a href="index.jsp" class="logo"><img src="images/logo.png" alt=""></a>
<ul>
			<li class="selected">
				<a href="index.jsp">home</a>
			</li>
			<li>
				<a href="about.html">about</a>
			</li>
			<li>
				<a href="services.html">services</a>
			</li>
			<li>
				<a href="schedule.html">Schedule &amp; Fees</a>
			</li>
			<li>
				<a href="contact.html">contact</a>
			</li>
			<li>
				<a href="notice.jsp">News Room</a>
			</li>
		</ul>
	</div>
<div id="section">
		<div>
			<div>
				<h1>advanced.reliable.fast</h1>
		  <p>
					When it comes to find answers to questions on your health and getting results, we are number one with a wide range of mordern facilities. None other is faster, more reliable, more advanced and accurate. Choose Us.				</p>
		  </div>
		</div>
	</div>
	<div id="featured">
		<div>
			<div class="article">
				<h2>Welcome to Illume Labs &amp; Hospital</h2>
				<h2><img src="images/diagnostic-center.jpg" alt="">
			  </h2>
		  <p>
			  Illume labs &amp; hospital offers you almost all the mordern super facilities with advanced features.</p>
				<p>
					You can choose and make appointment from the wide range of available globally renowed doctors. You can avail pathological tests at reasonable rates.
				</p>
				<p>
					For more details or any query please visit <a href="faq.html">FAQ</a> or <a href="contact.html">Contact Us</a>.</p>
		  </div>
			<ul>
				<li>
					<h3>pathology</h3>
					<div>
						<p>
							All kinds of pathological tests.
						</p>
						<a href="pathology.html" class="more">Click Here</a>
					</div>
					<img src="images/hematology.jpg" alt="">
				</li>
				<li>
					<h3>Online Appointment</h3>
					<div>
						<p>
							Make your appointment here.
						</p>
						<a href="Appointment.jsp?nid=0" class="more">Click Here</a>
					</div>
					<img src="images/appointment.png" alt="">
				</li>
				<li>
					<h3>Patient Info</h3>
					<div>
						<p>
							Check the status of patient and other informations.
						</p>
						<a href="status.html" class="more">Click Here</a>
					</div>
					<img src="images/status.png" alt="">
				</li>
				<li>
					<h3>Blood Bank</h3>
					<div>
						<p>
							Check the availability of blood in our blood bank.
						</p>
						<a href="bloodbank.html" class="more">Click Here</a>
					</div>
					<img src="images/blood.png" alt="">
				</li>
			</ul>
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