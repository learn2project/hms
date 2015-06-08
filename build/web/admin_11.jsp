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
         }        if(name.equalsIgnoreCase("admin"))
        {

%>
  <table width="500" border="0" align="center" cellpadding="10" cellspacing="10">
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
  <table width="500" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="158" class="style1"><div align="right">Admitted Patients</div></td>
      <td width="272"><form method="post" action=""><input name="button8" type="submit" class="box-blue" id="button4" value="   Search Patient Information   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="in_admin_add_patient.jsp"><input name="button9" type="submit" class="box-blue" id="button4" value="              Add Patient              " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="in_admin_update_patient.jsp?nid=0"><input name="button10" type="submit" class="box-blue" id="button4" value="            Update Patient            " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="in_admin_discharge.jsp"><input name="button4" type="submit" class="box-blue" id="button4" value="          Discharge Patient          " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="in_admin_allocate_bed.jsp"><input name="button4" type="submit" class="box-blue" id="button4" value="              Allocate Bed              " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="in_admin_allocate_doctor.jsp"><input name="button4" type="submit" class="box-blue" id="button4" value="           Allocate Doctor            " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="in_admin_add_expense.jsp"><input name="button4" type="submit" class="box-blue" id="button4" value="       Add Pathology Expense    " >
      </form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="in_admin_add_bill.jsp"><input name="button4" type="submit" class="box-blue" id="button4" value="             Add Store Bill             " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="in_admin_add_payment.jsp"><input name="button4" type="submit" class="box-blue" id="button4" value="              Add Payment             " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action=""><input name="button4" type="submit" class="box-blue" id="button4" value="                Make Bill                " ></form></td>
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
  <table width="500" border="0" align="center" cellpadding="10" cellspacing="10">
    <tr>
      <td width="158" class="style1"><div align="right">Doctor</div></td>
      <td width="272"><form method="post" action="doctor_admin_add_dept.jsp"><input name="button" type="submit" class="box-orange" id="button" value="   Add Department   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="doctor_admin_del_dept.jsp"><input name="button2" type="submit" class="box-orange" id="button2" value="   Delete Department   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="doctor_admin_add_doc.jsp"><input name="button3" type="submit" class="box-orange" id="button3" value="   Add Doctor   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="doctor_admin_add_schedule.jsp?nid=0"><input name="button3" type="submit" class="box-orange" id="button3" value="   Add Schedule   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="doctor_admin_update_doc.jsp"><input name="button11" type="submit" class="box-orange" id="button5" value="   Update Doctor   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="doctor_admin_del_doc.jsp?nid=0"><input name="button12" type="submit" class="box-orange" id="button6" value="   Delete Doctor   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="doctor_admin_report_doc.jsp?nid=0"><input name="button13" type="submit" class="box-orange" id="button7" value="   Report By Doctor   " ></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><form method="post" action="doctor_admin_report_dept.jsp"><input name="button14" type="submit" class="box-orange" id="button8" value="   Report By Department   " >
      </form></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table width="500" border="0" align="center" cellpadding="10" cellspacing="10">
  <tr>
        <td width="158"><div align="right"><span class="style1">Pathology</span></div></td>
<td width="272"><form method="post" action="path_admin_add_patient.jsp">
            <input name="p1" type="submit" class="box-blue" id="p1" value="            Add Patient             " >
        </form></td>
    </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="path_admin_update_patient.jsp?nid=0">
          <input name="p2" type="submit" class="box-blue" id="p2" value="           Update Patient          " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="path_admin_allocate_test.jsp">
            <input name="p4" type="submit" class="box-blue" id="p4" value="           Allocate Test            " >
        </form></td>
      </tr>
       <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="path_admin_make_report.jsp?nid=0">
            <input name="p4" type="submit" class="box-blue" id="p4" value="            Make Report            " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="path_admin_make_bill.jsp">
          <input name="p5" type="submit" class="box-blue" id="p5" value="              View Bill               " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="path_admin_report_date.jsp">
          <input name="p6" type="submit" class="box-blue" id="p6" value="          Report By Date          " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="path_admin_report_date_test.jsp">
          <input name="p7" type="submit" class="box-blue" id="p7" value="   Report By Test Datewise   " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="path_admin_report_test.jsp">
          <input name="p8" type="submit" class="box-blue" id="p8" value="           Report By Test         " >
        </form></td>
      </tr>
  </table>
  <p>&nbsp;</p>
    <table width="500" border="0" align="center" cellpadding="10" cellspacing="10">
      <tr>
        <td width="158"><div align="right"><span class="style1">Test &amp; Diagnostics</span></div></td>
        <td width="272"><form method="post" action="test_admin_add.jsp"><input name="td1" type="submit" class="box-orange" id="td1" value="           Add Test          " ></form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="test_admin_update.jsp?nid=0"><input name="td2" type="submit" class="box-orange" id="td2" value="        Update Test         " ></form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="test_admin_delete.jsp"><input name="td3" type="submit" class="box-orange" id="td3" value="          Delete Test        " ></form></td>
      </tr>
       <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="test_admin_reactive.jsp"><input name="td3" type="submit" class="box-orange" id="td3" value="        Reactive Test       " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="test_admin_report.jsp"><input name="td4" type="submit" class="box-orange" id="td4" value="             Report            " ></form></td>
      </tr>
  </table>
  <p>&nbsp;</p>
    <table width="500" border="0" align="center" cellpadding="10" cellspacing="10">
      <tr>
        <td width="158"><div align="right"><span class="style1">Blood Bank</span></div></td>
        <td width="272"><form method="post" action="blood_admin_add.jsp"><input name="bb1" type="submit" class="box-blue" id="bb1" value="              Add Blood             " ></form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="blood_admin_dispatch.jsp"><input name="bb2" type="submit" class="box-blue" id="bb2" value="          Dispatch Blood          " ></form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="blood_admin_report_all.jsp"><input name="bb3" type="submit" class="box-blue" id="bb3" value="   Report By Current Status   " ></form></td>
      </tr>
     </table>
  <p>&nbsp;</p>
    <table width="500" border="0" align="center" cellpadding="10" cellspacing="10">
      <tr>
        <td width="158"><div align="right"><span class="style1">Bed</span></div></td>
        <td width="272"><form method="post" action="bed_admin_add.jsp"><input name="b1" type="submit" class="box-orange" id="b1" value="                     Add Bed                    " >
        </form></td> 
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="bed_admin_free.jsp"><input name="b2" type="submit" class="box-orange" id="b2" value="                   Remove Bed                 " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action="bed_admin_report_datewise.jsp"><input name="b4" type="submit" class="box-orange" id="b4" value="         Report for Bed Datewise          " >
        </form></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><form method="post" action=""><input name="b5" type="submit" class="box-orange" id="b5" value="          Report for Vacant Beds          " >
        </form></td>
      </tr>
      
  </table>
  <p>&nbsp;</p>
    <table width="500" border="0" align="center" cellpadding="10" cellspacing="10">
      <tr>
        <td width="158"><div align="right"><span class="style1">Notice</span></div></td>
        <td width="272"><form method="post" action="admin_notice.jsp"><input name="b1" type="submit" class="box-blue" id="b1" value="                     Add Notice                  " >
        </form></td> 
      </tr>
      <tr>
        <td width="158"><div align="right"><span class="style1"></span></div></td>
        <td width="272"><form method="post" action="admin_notice_del.jsp"><input name="b1" type="submit" class="box-blue" id="b1" value="                    Delete Notice                " >
        </form></td> 
      </tr>
  </table>
  <p>&nbsp;</p>
  
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