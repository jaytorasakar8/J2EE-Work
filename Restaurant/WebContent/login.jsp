<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<title>Unique Login Form Flat Responsive widget Template :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Unique Login Form Widget Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- font files  -->
<link href='//fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Nunito:400,300,700' rel='stylesheet' type='text/css'>
<!-- /font files  -->
<!-- css files -->
<link href="css/stylelogin.css" rel='stylesheet' type='text/css' media="all" />
<!-- /css files -->
</head>
<body>
<h1>Login and Sign Up Form</h1>
<div class="log">
	<div class="content1">
		<h2>Log In</h2>
		<form method="post" action="<%=request.getContextPath() %>/Controller" onsubmit='return validator1()' name="myform">
		
			<input type="hidden" name="action" value="login">
			
				<%=request.getAttribute("msg") %>
			
			<br>
			<input type="text" name="email" placeholder="EMAIL" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'USERNAME';}">
			<input type="password" name="password" placeholder="PASSWORD" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'PASSWORD';}">
			<br><span id="s1" style="color:red;"></span>
			
			<div class="button-row">
				<input type="submit" class="sign-in" value="Sign In">
				<input type="reset" class="reset" value="Reset">
				<div class="clear"></div>
			</div>
		</form>
	</div>
	<div class="content2">
		<h2>Sign Up Form</h2>
		<form  method="post" action="<%=request.getContextPath() %>/Controller" onsubmit='return validator2()' name="myform">
			<input type="hidden" name="action" value="signup">
			<input type="text" name="name" >
			<input type="text" name="address">
			<input type="text" name="phone" >
			<input type="email" name="email" >
			<input type="password" name="password" >
			<span id="s2" style="color:red;"></span>
			
			<input type="submit" name="submit" class="register" value="Register">
		</form>
	</div>
	<div class="clear"></div>
</div>
<div class="footer">
	<p>© 2016 Unique Login Form. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">w3layouts</a></p>
</div>

</body>
</html>

<script>

function validator1 () 
{
	/*
	//for email validation
	var x=document.forms["myform"]["email"].value;
	var at=x.indexOf("@");
	var dot=x.lastIndexOf(".");
	if (x==null|| x=="") 
{
	document.getElementById('s1').innerHTML="Email field cannot be empty";
   return false;
}
	if (x.length>=50) 
	{
		document.getElementById('s1').innerHTML="Please Enter a Valid Email Address";
		return false;
	}
	if (at<1|| dot<=(at+2)|| (dot+2)>=(x.length) ) 
	{
		document.getElementById('s1').innerHTML="Please Enter a Valid Email Address";
		return false;
	}
	
	//for simple password
	var p=document.forms["myform"]["password"].value;
	
	if (p==null|| p=="") 
	{
		document.getElementById('s1').innerHTML="Password Fields cannot be empty";
	   return false;

	}
	*/
}


</script>
