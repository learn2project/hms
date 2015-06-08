<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>&nbsp;</h1>
        <%
  String amount=request.getParameter("amount");
  String id=request.getParameter("id");
  String loc="http://localhost:8084/Money_Bank/index.jsp?id="+id+"&amount="+amount+"&msg=Welcome";
	   %>  
		
        <a href="<%=loc%>">Proceed</a>
</body>
</html>
