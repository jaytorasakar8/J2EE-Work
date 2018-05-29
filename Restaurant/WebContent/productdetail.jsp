<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
        
        <sql:setDataSource 
        var="ds1" 
        driver="com.mysql.jdbc.Driver"
     	url="jdbc:mysql://localhost/hoteltest"
    	 user="root"  password="" 
    	 scope="application"/>
    	 
    	  <sql:setDataSource 
        var="ds2" 
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

    <title>Actual product page</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/3-col-portfolio.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>



<sql:query dataSource="${ds1}" var="result1">
SELECT * from product where catid=<%=request.getAttribute("cid") %> ;
</sql:query> 

<sql:query dataSource="${ds2}" var="result2">
SELECT * from category where id=<%=request.getAttribute("cid") %> ;
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
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Header -->
        <div class="row">
            <div class="col-lg-12">
             <c:forEach var="row2" items="${result2.rows }">
                <h1 class="page-header"><c:out value="${row2.name }"></c:out> Section
                    <small>Order from a variety of <c:out value="${row2.name }"></c:out></small>
                </h1>
                </c:forEach>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
        
        <c:forEach var="row" items="${result1.rows }">
        
            <div class="col-md-4 portfolio-item">
            
                <a href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row.catid }"></c:out>&id=<c:out value="${row.id }"></c:out> ">
                    <img class="img-responsive" src="<c:out value="${row.image }"></c:out>"  alt="<c:out value="${row.name }"></c:out>"  >
                </a>
                <h3>
                    <a href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row.catid }"></c:out>&id=<c:out value="${row.id }"></c:out>  ">
                    	<c:out value="${row.name }"></c:out> </a>
                </h3>
                <p><c:out value="${row.shortdesc }"></c:out></p>
                
                <a href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row.catid }"></c:out>&id=<c:out value="${row.id }"></c:out>  ">
                    	<input type="button" class="btn-success btn-lg" value="Read more"> 
                    	</a>
            </div>
            
            
            
            <!-- 
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                </a>
                <h3>
                    <a href="#">Project Name</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                </a>
                <h3>
                    <a href="#">Project Name</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div> -->
            
            
            </c:forEach>
            
        </div>
        <!-- /.row --> 

  
  
  <!-- Temporary commented code  
        <!-- Projects Row
        <div class="row">
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                </a>
                <h3>
                    <a href="#">Project Name</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                </a>
                <h3>
                    <a href="#">Project Name</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                </a>
                <h3>
                    <a href="#">Project Name</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
        </div>

        <!-- Projects Row 
        <div class="row">
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                </a>
                <h3>
                    <a href="#">Project Name</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                </a>
                <h3>
                    <a href="#">Project Name</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                </a>
                <h3>
                    <a href="#">Project Name</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
        </div>
        <!-- /.row 
this is the temporary commented code -->
        <hr>

        <!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->

        <hr>

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

</body>

</html>


