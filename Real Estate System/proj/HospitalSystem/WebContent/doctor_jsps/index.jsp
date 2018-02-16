<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<c:import url="../main_jsps/header.jsp"></c:import>
<body>
<h2>Welcome Doctor</h2>
<a href="<%=request.getContextPath() %>/Doctor?action=today_appt&id=<%=session.getAttribute("doctor_id") %>">Todays Appt</a><BR><BR>
<a href="">Tomorrow's Appt</a>
<BR><BR>



<c:import url="../main_jsps/footer.jsp"></c:import>
</html>










