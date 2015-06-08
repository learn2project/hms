<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
<!--
.style1 {
	color: #333333;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #666666;
}
-->
    </style>
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
  <table width="500" border="1" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="152"><div align="right"><span class="style1">Outdoor Patients</span></div></td>
      <td width="272"><form method="post" action=""><input name="button4" type="submit" class="box-orange" id="button4" value="   Search Patient Information   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button5" type="submit" class="box-orange" id="button4" value="   Report for Doctor Datewise   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button6" type="submit" class="box-orange" id="button4" value="            Report By Date            " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button7" type="submit" class="box-orange" id="button4" value="          Report By Doctor           " ></form></td>
    </tr>
  </table>
  <p>.</p>
  <table width="500" border="1" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="152" class="style1"><div align="right">Admitted Patients</div></td>
      <td width="272"><form method="post" action=""><input name="button8" type="submit" class="box-blue" id="button4" value="   Search Patient Information   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button9" type="submit" class="box-blue" id="button4" value="              Add Patient              " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button10" type="submit" class="box-blue" id="button4" value="            Update Patient            " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button4" type="submit" class="box-blue" id="button4" value="          Discharge Patient          " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button4" type="submit" class="box-blue" id="button4" value="              Allocate Bed              " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button4" type="submit" class="box-blue" id="button4" value="           Allocate Doctor            " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button4" type="submit" class="box-blue" id="button4" value="             Add Expense              " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button4" type="submit" class="box-blue" id="button4" value="             Add Store Bill             " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button4" type="submit" class="box-blue" id="button4" value="              Add Payment             " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="">
        <input name="button16" type="submit" class="box-blue" id="button10" value="                Make Bill                " >
      </form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button4" type="submit" class="box-blue" id="button4" value="            Report By Date           " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button4" type="submit" class="box-blue" id="button4" value="           Report By Doctor          " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button4" type="submit" class="box-blue" id="button4" value="   Report By Doctor Datewise   " ></form></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table width="500" border="1" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="154" class="style1"><div align="right">Doctor</div></td>
      <td width="270"><form method="post" action="doctor_admin_add_dept.jsp"><input name="button" type="submit" class="box-orange" id="button" value="   Add Department   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="">
        <input name="button2" type="submit" class="box-orange" id="button2" value="   Delete Department   " >
      </form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="doctor_admin_add_doc.jsp"><input name="button3" type="submit" class="box-orange" id="button3" value="   Add Doctor   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button11" type="submit" class="box-orange" id="button5" value="   Update Doctor   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button12" type="submit" class="box-orange" id="button6" value="   Delete Doctor   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button13" type="submit" class="box-orange" id="button7" value="   Report By Doctor   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="">
        <input name="button14" type="submit" class="box-orange" id="button8" value="   Report By Doctor Datewise   " >
      </form></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  
    <table width="500" border="1" align="center" cellpadding="10" cellspacing="10">
      <tr>
        <td width="150"><div align="right"><span class="style2">Pathology</span></div></td>
        <td width="274"><form method="post" action="">
            <input name="p1" type="submit" class="box-blue" id="p1" value="            Add Patient             " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="">
          <input name="p2" type="submit" class="box-blue" id="p2" value="           Update Patient          " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="">
            <input name="p3" type="submit" class="box-blue" id="p3" value="           Search Patient          " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="">
            <input name="p4" type="submit" class="box-blue" id="p4" value="            Make Report            " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="">
          <input name="p5" type="submit" class="box-blue" id="p5" value="              Make Bill               " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="">
          <input name="p6" type="submit" class="box-blue" id="p6" value="          Report By Date          " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="">
          <input name="p7" type="submit" class="box-blue" id="p7" value="   Report By Test Datewise   " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="">
          <input name="p8" type="submit" class="box-blue" id="p8" value="           Report By Test         " >
        </form></td>
      </tr>
  </table>
    <p>&nbsp;</p>
    <table width="500" border="1" align="center" cellpadding="10" cellspacing="10">
      <tr>
        <td width="149"><div align="right"><span class="style2">Test &amp; Diagnostics</span></div></td>
        <td width="275"><form method="post" action=""><input name="td1" type="submit" class="box-orange" id="td1" value="           Add Test          " ></form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="td2" type="submit" class="box-orange" id="td2" value="        Update Test         " ></form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="td3" type="submit" class="box-orange" id="td3" value="          Delete Test        " ></form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="td4" type="submit" class="box-orange" id="td4" value="             Report            " ></form></td>
      </tr>
  </table>
    <p>&nbsp;</p>
    <table width="500" border="1" align="center" cellpadding="10" cellspacing="10">
      <tr>
        <td width="149"><div align="right"><span class="style2">Blood Bank</span></div></td>
        <td width="275"><form method="post" action=""><input name="bb1" type="submit" class="box-blue" id="bb1" value="              Add Blood             " ></form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="bb2" type="submit" class="box-blue" id="bb2" value="          Dispatch Blood          " ></form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="bb3" type="submit" class="box-blue" id="bb3" value="   Report By Current Status   " ></form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="bb4" type="submit" class="box-blue" id="bb4" value="         Report By Group         " ></form></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <table width="500" border="1" align="center" cellpadding="10" cellspacing="10">
      <tr>
        <td width="151"><div align="right"><span class="style2">Bed</span></div></td>
        <td width="273"><form method="post" action=""><input name="b1" type="submit" class="box-orange" id="b1" value="                     Add Bed                    " >
        </form></td> 
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="b2" type="submit" class="box-orange" id="b2" value="                    Free Bed                    " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="b3" type="submit" class="box-orange" id="b3" value="         Report Bed Patientwise          " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="b4" type="submit" class="box-orange" id="b4" value="         Report Bedwise Patient          " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="b5" type="submit" class="box-orange" id="b5" value="   Report Bedwise Patient For Date   " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="b6" type="submit" class="box-orange" id="b6" value="           Report By Patient/Bed          " >
        </form></td>
      </tr>
  </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  
  <p>&nbsp;</p>
  <p>&nbsp;  </p>
  <p>&nbsp;</p>
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