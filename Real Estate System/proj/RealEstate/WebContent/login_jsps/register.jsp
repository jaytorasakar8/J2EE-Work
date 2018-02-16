<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PropertyWala.com | Register</title>
<!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

    <!-- Font awesome -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">   
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="css/nouislider.css">
    <!-- Fancybox slider -->
    <link rel="stylesheet" href="css/jquery.fancybox.css" type="text/css" media="screen" /> 
    <!-- Theme color -->
    <link id="switcher" href="css/theme-color/default-theme.css" rel="stylesheet">     

    <!-- Main style sheet -->
    <link href="css/style.css" rel="stylesheet">    

   
    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Vollkorn' rel='stylesheet' type='text/css'>    
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
   
</head>
<body>
<br><br><br><br><br><br>
	<form class="form-horizontal" method="post" role="form" action="<%=request.getContextPath() %>/UserLogin">
	<input type="hidden" name="action" value="register-form" />
	<div class="row">
	<div class="col-md-7">	
	<div class="form-group">
			<label for="inputEmail1" class="col-lg-2 control-label"></label>
			<div class="col-lg-10">
				<b><font color="red"><c:out value="${msg }" /></font></b>
			</div>
		</div>
	<div class="form-group">
			<label for="inputEmail1" class="col-lg-2 control-label">Name</label>
			<div class="col-lg-10">
				<input type="text" name="name" class="form-control" id="inputEmail1"
					placeholder="Full Name">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail1" class="col-lg-2 control-label">Email</label>
			<div class="col-lg-10">
				<input type="text" name="email" class="form-control" id="inputEmail1"
					placeholder="Email">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword1" class="col-lg-2 control-label">Password</label>
			<div class="col-lg-10">
				<input type="password" name="password" class="form-control" id="inputPassword1"
					placeholder="Password">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10">
				<input type="submit" value="REGISTER" class="btn btn-danger"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=request.getContextPath() %>/UserLogin?action=login">Login
			</a>
				</div>
		</div>
		
		</div>
		</div>
		
	</form>
	
</body>
</html>