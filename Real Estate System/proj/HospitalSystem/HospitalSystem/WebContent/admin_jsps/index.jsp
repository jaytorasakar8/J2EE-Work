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
<h2>Welcome Admin</h2>
<c:if test='${flag == "144" }'>
<font color="red"><c:out value="${msg }"/></font>
</c:if>

<form method="post" action="<%=request.getContextPath() %>/Admin">
<input type="hidden" name="action" value="search" />
Enter Patient Name:  <input type="text" name="search_query" />
<input type="submit" name="submit" value="search" />
</form>
<BR><BR><a href="<%=request.getContextPath() %>/Admin?action=new_patient">New Patient</a>
</body>
<BR><BR>
<c:if test='${flag == "100" }'>
<c:forEach items="${list }" var="p">
<a href="<%=request.getContextPath() %>/Admin?action=book_appt_direct&id=<c:out value="${p.getId() }"/>"><h3><c:out value="${p.getName() }"/></h3></a>
Email: <c:out value="${p.getEmail() }"/>&nbsp;&nbsp;&nbsp;&nbsp;
Contact: <c:out value="${p.getContact() }"/><BR>
Age: <c:out value="${p.getAge() }"/><BR>
<c:out value="${p.getAddress() }"/>
<BR>
<BR>
</c:forEach>

</c:if>
<c:import url="../main_jsps/footer.jsp"></c:import>
</html>










