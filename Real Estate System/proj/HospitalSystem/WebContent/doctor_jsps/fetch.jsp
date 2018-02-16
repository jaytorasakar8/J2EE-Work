<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
 <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/hospital"
     user="root"  password=""/>
  <% int id = Integer.parseInt(request.getParameter("id"));
  %>
  
  <sql:query dataSource="${ds}" var="result">
select * from patient,history where patient.id = history.patient_id AND patient.id=<%=id %>
</sql:query> 
<body>
<c:forEach var="row" items="${result.rows}">
<h3><c:out value="${row.date }"/></h3>
<c:out value="${row.history }"></c:out><BR>
<hr>
<BR>
</c:forEach>
  
  
  
</body>
</html>