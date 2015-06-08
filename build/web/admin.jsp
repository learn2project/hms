<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <link href="menu_assets/styles.css" rel="stylesheet" type="text/css">

    <style type="text/css">
<!--
.style2 {color: #FF0000}
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
  
  <div id='cssmenu'>
<ul>
   <li class='has-sub'><a href='#'><span>Outdoor</span></a>
   	  <ul>
      <li><a href='#'><span>Search Patient Information</span></a></li>
      <li class='has-sub'><a href='#'><span>Reports</span></a>
          <ul>
             <li><a href='#'><span>By Date</span></a></li>
             <li><a href='#'><span>By Doctor</span></a></li>
             <li class='last'><a href='#'><span>By Date & Doctor</span></a></li>
          </ul>
      </li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span>Indoor</span></a>
      <ul>
      <li><a href="in_admin_search_patient.jsp"><span>Search Information</span></a></li>
      <li><a href="in_admin_add_patient.jsp"><span>Add Patient</span></a></li>
      <li><a href="in_admin_update_patient.jsp?nid=0"><span>Update Patient</span></a></li>
      <li><a href="in_admin_discharge.jsp"><span>Discharge Patient</span></a></li>
      <li><a href="in_admin_allocate_bed.jsp"><span>Allocate Bed</span></a></li>
      <li><a href="in_admin_allocate_doctor.jsp"><span>Allocate Doctor</span></a></li>
      <li><a href="in_admin_add_expense.jsp"><span>Add Pathology Expense</span></a></li>
      <li><a href="in_admin_add_bill.jsp"><span>Add Store Bill</span></a></li>
      <li><a href="in_admin_add_payment.jsp"><span>Add Payment</span></a></li>
      <li><a href="in_admin_make_bill.jsp"><span>Make Bill</span></a></li>
      <li class='has-sub'><a href='#'><span>Reports</span></a>
            <ul>
               <li><a href='#'><span>By Date</span></a></li>
               <li><a href='#'><span>By Doctor</span></a></li>
               <li class='last'><a href='#'><span>By Date & Doctor</span></a></li>
            </ul>
         </li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span>Doctor</span></a>
   <ul>
      <li><a href="doctor_admin_add_dept.jsp"><span>Add Department</span></a></li>
      <li><a href="doctor_admin_del_dept.jsp"><span>Delete Department</span></a></li>
      <li><a href="doctor_admin_add_doc.jsp"><span>Add Doctor</span></a></li>
      <li><a href="doctor_admin_update_doc.jsp"><span>Update Doctor</span></a></li>
      <li><a href="doctor_admin_del_doc.jsp?nid=0"><span>Delete Doctor</span></a></li>
      <li><a href="doctor_admin_add_schedule.jsp?nid=0"><span>Add Doctor Schedule</span></a></li>
      <li class='has-sub'><a href='#'><span>Reports</span></a>
            <ul>
               <li><a href="doctor_admin_report_doc.jsp?nid=0"><span>By Doctor</span></a></li>
               <li class='last'><a href="doctor_admin_report_dept.jsp"><span>By Department</span></a></li>
            </ul>
         </li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span>Pathology</span></a>
   <ul>
      <li><a href="path_admin_add_patient.jsp"><span>Add Patient</span></a></li>
      <li><a href="path_admin_update_patient.jsp"><span>Update Patient</span></a></li>
      <li><a href="path_admin_allocate_test.jsp"><span>Allocate Test</span></a></li>
      <li><a href="path_admin_make_report.jsp?nid=0"><span>Make Report</span></a></li>
      <li><a href="path_admin_make_bill.jsp"><span>View Bill</span></a></li>
      <li class='has-sub'><a href='#'><span>Reports</span></a>
            <ul>
               <li><a href="path_admin_report_date.jsp"><span>By Date</span></a></li>
               <li><a href="path_admin_report_test.jsp"><span>By Test</span></a></li>
               <li class='last'><a href="path_admin_report_date_test.jsp"><span>By Date & Test</span></a></li>
            </ul>
         </li>
      </ul>
   </li>
   <li class='has-sub'><a href='#'><span>Diagnostics</span></a>
   <ul>
      <li><a href="test_admin_add.jsp"><span>Add Test</span></a></li>
      <li><a href="test_admin_update.jsp?nid=0"><span>Update Test</span></a></li>
      <li><a href="test_admin_delete.jsp"><span>Delete Test</span></a></li>
      <li><a href="test_admin_reactive.jsp"><span>Reactive Test</span></a></li>
      <li><a href="test_admin_report.jsp"><span>Report</span></a></li>
    </ul>
    </li>
   <li class='has-sub'><a href='#'><span>Bed</span></a>
   <ul>
      <li><a href="bed_admin_add.jsp"><span>Add Bed</span></a></li>
      <li><a href="bed_admin_free.jsp"><span>Remove Bed</span></a></li>
      <li class='has-sub'><a href='#'><span>Reports</span></a>
          <ul>
             <li><a href="bed_admin_report_datewise.jsp"><span>By Date</span></a></li>
             <li class='last'><a href="bed_admin_report_vacant.jsp"><span>Vacant Beds</span></a></li>
          </ul>
      </li>
   </ul>
   </li>
    <li class='has-sub'><a href='#'><span>Blood Bank</span></a>
   <ul>
      <li><a href="blood_admin_add.jsp"><span>Add Blood</span></a></li>
      <li><a href="blood_admin_dispatch.jsp"><span>Dispatch Blood</span></a></li>
      <li><a href="blood_admin_report_all.jsp"><span>Report by Current Status</span></a></li>
   </ul>
   </li>
  
   <li class='has-sub'><a href='#'><span>Others</span></a>
    <ul>
      <li><a href="admin_notice.jsp"><span>Add Notice</span></a></li>
      <li><a href="admin_notice_del.jsp"><span>Delete Notice</span></a></li>
      <li><a href="admin_feedback_view.jsp"><span>View & Reply Feedbacks</span></a></li>
   </ul>
   </li>
</ul></div>
  </p>
<p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <div align="center" class="style2">
  <p>&nbsp;
  
  </p>
  <p>Please Log Out before leaving the page.
    <%
  }
  
  else
  {
  response.sendRedirect("admin_login.jsp");
  }
  %>
  </p>
  <p>&nbsp;</p>
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