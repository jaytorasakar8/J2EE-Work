<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<c:import url="header.jsp"></c:import>
<body>
This is Main Index
<BR><BR>
<a href="<%=request.getContextPath() %>/Doctor">Doctor</a><BR><BR>
<a href="<%=request.getContextPath() %>/Admin">Admin</a>
</body>
<c:import url="footer.jsp"></c:import>
</html>