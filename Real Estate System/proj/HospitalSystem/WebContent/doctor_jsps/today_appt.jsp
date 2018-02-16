<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.text.*" %>
    <%@page import="java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
var form = document.forms['myfrm'];
var id = form.patient.value;
qstr = 'id=' + escape(id); // NOTE: no '?' before querystring
return qstr;
}
//update function
function updatepage(str){
document.getElementById("result").innerHTML = str;
}

</script>

</head>
<c:import url="../main_jsps/header.jsp"></c:import>
<body>

<h2>Todays Appointment</h2>
<h4><font color="BLUE">Date: <%=DateFormat.getDateInstance(DateFormat.FULL).format(new Date()) %></font> 
<table border="1" width="90%">
<tr>
<td>Name</td>
<td>Age</td>
<td>Time</td>
<td></td>
</tr>

<c:forEach items="${list }" var="p">

<tr>
<td><a href="<%=request.getContextPath() %>/Admin?action=book_appt_direct&id=<c:out value="${p.getId() }"/>"><h3><c:out value="${p.getName() }"/></h3></a>
</td>
<td><c:out value="${p.getAge() }"/> years<BR>

</td>
<td><c:out value="${p.getTime() }"/><BR>

</td>
<td>
<a href="<%=request.getContextPath() %>/Doctor?action=view_history&id=
<c:out value="${p.getId() }"/>">History</a>
</td>

</c:forEach>
</table>
</body>
</html>











