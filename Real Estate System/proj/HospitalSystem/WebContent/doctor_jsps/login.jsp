<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Doctor Login</h1>
<form method="post" action="<%=request.getContextPath() %>/Doctor">
<input type="hidden" name="action" value="dologin" />
Userid: <input type="text" name="username" />
<BR><BR>
Password: <input type="text" name="password" />
<BR><BR>
<input type="submit" name="submit" value="Login" /> 
</form>
</body>
</html>