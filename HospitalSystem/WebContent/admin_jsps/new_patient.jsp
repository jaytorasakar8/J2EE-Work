<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2>Book Patient Appointment</h2>
<form method="post" action="<%=request.getContextPath() %>/Admin">
<input type="hidden" name="action" value="book_appt" />
Name: <input type="text" name="name" value="<c:out value="${name }"/>"/><BR><BR>
Email: <input type="text" name="email" value="<c:out value="${email }"/>"/><BR><BR>
Contact: <input type="text" name="contact" value="<c:out value="${contact }"/>"/><BR><BR>
Age: <input type="text" name="age" value="<c:out value="${age }"/>"/><BR><BR>
Address: <input type="text" name="address" value="<c:out value="${address }"/>"/><BR><BR>
<hr>
<h3>Doctor Info</h3>
Doctor: <select> <option>Select Doctor</option></select>
<BR><BR>
Time Slot: <select> <option>Select Time Slot</option></select>
<BR><BR>
Date: <select> <option>Select Date</option></select>
<BR><BR>
<input type="submit" name="submit" value="Book Appointment" />
</form>
</body>
</html>




