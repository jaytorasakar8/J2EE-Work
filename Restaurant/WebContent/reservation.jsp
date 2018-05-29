<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
        
        <sql:setDataSource 
        var="ds" 
        driver="com.mysql.jdbc.Driver"
     	url="jdbc:mysql://localhost/hoteltest"
    	 user="root"  password="" 
    	 scope="application"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Half Slider - Start Bootstrap Template</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {

      margin: auto;
  }
  </style>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/half-slider.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>


<sql:query dataSource="${ds}" var="result">
SELECT * from category;
</sql:query>  
<% int count = 0; %>
			  <c:forEach var="p" items="${list }">
			  <% count++; %>
			  </c:forEach>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                  <a class="navbar-brand" href="<%=request.getContextPath() %>/Controller">Home</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="<%=request.getContextPath() %>/Controller?action=category&catid=1">Pizza</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/Controller?action=category&catid=2">Burger</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/Controller?action=category&catid=3">Beverages</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/Controller?action=category&catid=4">Wine</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/Controller?action=showcart">Your Cart(<%=count %>)</a>
                    </li>
                    </ul>
                  <ul class="nav navbar-nav navbar-right"> 
                    <li id="ab">
                        <a href="<%=request.getContextPath() %>/Controller?action=myprofile">My Dashboard</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

   
<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="images/reserve2.jpg" alt="Chania" width="600" height="400" >
      </div>
    
      <div class="item">
        <img src="images/reserve3.jpg" alt="Flower" width="600" height="400" >
      </div>

      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>




    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1>Your Table Reservation Details:</h1>
                 
             </div>
             <br>
             <div class="col-lg-7">
             <h3>Date: <b><%=request.getAttribute("date") %></b>    </h3> 
             </div>
 
             <div class="col-lg-5">
             <h3>Time: <b><%=request.getAttribute("time") %> PM</b> </h3> 
             </div>
             
             <br>
             <div class="col-lg-6 col-lg-offset-3">
             
                <h3>Table booked for : <b><%=request.getAttribute("people") %> Persons</b></h3>
           
             </div>
             
             <div class="col-lg-12"><center><h2><b>We are eagerly waiting for arrival at our Restaurant. </b></h2></center></div>
             <br>
             
        </div>

        <hr>
        
        <div class="row">
		           
            <div class="col-lg-12">
            <h2>Our Exotic Menu</h2>
             
            </div>
			
        <c:forEach var="row" items="${result.rows }">
            <div class="col-md-3 col-sm-3 col-xs-6">
                <a href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row.id }"></c:out> ">
                    <img style="border:2px solid black; width:350px; height:200px;" class="img-responsive portfolio-item" src="<c:out value="${row.image }"></c:out>" alt="<c:out value="${row.name }"></c:out>"       >
                	<h3> <c:out value="${row.name }"></c:out> </h3>
                </a>
            </div>
		</c:forEach>
		
		
        </div>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>

</html>

