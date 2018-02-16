<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
   <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/hospital"
     user="root"  password=""/>
       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id = Integer.parseInt(request.getParameter("id"));

%>

  <sql:query dataSource="${ds}" var="result">
select time from doctor,has,slot where doctor.id = doctor_id AND slot_id = slot.id AND doctor.id=<%=id %>
</sql:query>   
Slot: 
<select name="slot" >
<c:forEach var="row" items="${result.rows}">
<option><c:out value="${row.time }"/></option>
</c:forEach>
</select>
</body>
</html>

















