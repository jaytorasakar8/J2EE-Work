<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/hospital" 
     user="root"  password=""/>
     <sql:query dataSource="${ds}" var="result">
     select * from patient,history where patient.id=history.patient_id AND patient.id = 4 
     </sql:query>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
<h2>Diagnosis</h2>
   <sql:query dataSource="${ds}" var="result1">
select * from doctor,has,slot where doctor.id = has.doctor_id AND has.slot_id=slot.id AND doctor.id = <c:out value="${doctor_id}" /> 
</sql:query> 
<b>Book Appointment </b> <form action="<%=request.getContextPath() %>/Doctor" method="post">
<input type="hidden" name="action" value="book_doctor_appt" />
<input type="hidden" name="pid" value='<c:out value="${pid}"/>' />
<input type="hidden" name="did" value='<c:out value="${doctor_id}"/>' />
<input type="date" name="date" placeholder="mm/dd/yy" /> 
slot: <select name="slot"> 
<c:forEach var="row1" items="${result1.rows}">
<option value='<c:out value="${row1.time }"/>'>
<c:out value="${row1.time }"/>
</option>
</c:forEach>
</select>
&nbsp; <input type="submit" name="submit" value="book appt"/>

</form>
<br>
<font color="green"><b><c:out value="${msg }"></c:out></b></font>
<BR>

<form method="post" action="<%=request.getContextPath() %>/Doctor">
<input type="hidden"name="action" value="current_history" />
<input type="hidden"name="patient_id" value='<c:out value="${id}"/>' />
<textarea name="current_history">Enter Today's Diagnosis</textarea>
<br>
<input type="submit" name="submit" value="Record Diagonosis" />
</form>
<h2>Patient History</h2>
<c:forEach var="row" items="${result.rows}">    
<h3><c:out value="${row.date }"/></h3>
<c:out value="${row.history }"></c:out>
<br>
<hr>
<br>
</c:forEach>
</body>
</html>













