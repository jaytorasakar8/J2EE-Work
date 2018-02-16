<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>
<%@page import="com.beans.Patient" %>

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/hospital" 
     user="root"  password=""/>
     <sql:query dataSource="${ds}" var="result">
     select * from doctor
     </sql:query>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="Javascript">
function xmlhttpPost(strURL) { //fetch.jsp

var xmlHttpReq = false;
var self = this;
// Mozilla/Safari
if (window.XMLHttpRequest) {
self.xmlHttpReq = new XMLHttpRequest();
}
// IE
else if (window.ActiveXObject) {
self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
}

//open the connection
self.xmlHttpReq.open('POST', strURL, true);

//setting header Info
self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

self.xmlHttpReq.onreadystatechange = function() {
if (self.xmlHttpReq.readyState == 4) {
updatepage(self.xmlHttpReq.responseText); 
}
}
self.xmlHttpReq.send(getquerystring()); 
}

//getquerystring function
function getquerystring() {
var form = document.forms['myForm'];
var id = form.doctor.value;
qstr = 'id=' + escape(id); // NOTE: no '?' before querystring
return qstr;
}
//update function
function updatepage(str){
document.getElementById("result").innerHTML = str;
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2>Book Patient Appointment</h2>

<form name="myForm" method="post" action="<%=request.getContextPath() %>/Admin">
<input type="hidden" name="action" value="book_new_appt" />
<input type="hidden" name="id" value="<c:out value="${id }"/>" />

Name: <input type="text" name="name" value="<c:out value="${name }"/>"/><BR><BR>
Email: <input type="text" name="email" value="<c:out value="${email }"/>"/><BR><BR>
Contact: <input type="text" name="contact" value="<c:out value="${contact }"/>"/><BR><BR>
Age: <input type="text" name="age" value="<c:out value="${age }"/>"/><BR><BR>
Address: <input type="text" name="address" value="<c:out value="${address }"/>"/><BR><BR>
<hr>
<h3>Doctor Info</h3>
<font color="red"><c:out value="${msg }"/></font>
<BR><BR>
Doctor: <select name="doctor" onchange='JavaScript:xmlhttpPost("admin_jsps/fetch.jsp")'>
<option>Select Doctor</option>
  <c:forEach var="row" items="${result.rows}">                       
 <option value='<c:out value="${row.id}"/>'><c:out value="${row.dname }"/></option>
 </c:forEach>
 </select>
<BR><BR>
Date: <select name="date"> <option>Select Date</option>
<option value="<%=DateFormat.getDateInstance().format(new Date()) %>">
<%=DateFormat.getDateInstance(DateFormat.FULL).format(new Date()) %> </option>
<option value="<%=DateFormat.getDateInstance().format(new Patient().fetchDate(1)) %>">
<%=DateFormat.getDateInstance(DateFormat.FULL).format(new Patient().fetchDate(1)) %>
</option>
</select>
<BR><BR>
<div id="result"></div>
<BR><BR>
<input type="submit" name="submit" value="Book Appointment" />
</form>
</body>
</html>




