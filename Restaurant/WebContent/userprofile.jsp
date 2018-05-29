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
<html>
<head>
  <title>User Profile</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js">
    </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js">
    </script> 
    <link rel="stylesheet" href="css/userprofile.css">
   
</head>

<sql:query dataSource="${ds}" var="result">
SELECT * from reservation where userid="<%=session.getAttribute("userid") %>";
</sql:query>

<sql:query dataSource="${ds}" var="result1">
SELECT * from category ;
</sql:query>

<sql:query dataSource="${ds}" var="result2">
SELECT * 
From review,product
where review.userid="<%=session.getAttribute("userid") %>" and review.pid=product.id ;
</sql:query>

<sql:query dataSource="${ds}" var="result3">
SELECT * from orders,product
where orders.userid="<%=session.getAttribute("userid") %>" and orders.pid=product.id;
</sql:query>

 <% int count = 0; %>
			  <c:forEach var="p" items="${list }">
			  <% count++; %>
			  </c:forEach>
<body>

   <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath() %>/Controller" > <b>Home</b></a>
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
    <br><br>

<div class="col-md-10 col-md-offset-1 col-sm-12">
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" alt="" src="images/back.jpg">
        </div>
        <div class="useravatar">
            <img alt="user" src="images/leo.jpg">
        </div>
        <div class="card-info"> <span class="card-title">Leonardo Di Caprio</span>

        </div>
    </div>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" id="favorites" class="btn btn-primary" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
                <div class="hidden-xs">My Orders</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <div class="hidden-xs">My Reservations</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="stars" class="btn btn-default" href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                <div class="hidden-xs">My Reviews</div>
            </button>
        </div>
    </div>

   <div class="well">
      <div class="tab-content">
      
 <!-- Orders -->
        <div class="tab-pane fade in active" id="tab1">
      <!-- Testing code fro ordets -->   
          
        
          <!-- Page Header -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Your Previous Orders
                    <small>Thank You for your Love</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
        
          <c:forEach var="row4" items="${result3.rows }">
            <div class="col-md-4 portfolio-item" style="border:1px solid black;margin-right: 10px;">
                <a href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row4.catid }"></c:out>&id=<c:out value="${row4.id }"></c:out> ">
               		<img width="220" height="140" src="<c:out value="${row4.image }"></c:out>" alt="hello">
                </a>
                <h3>
                  <a href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row4.catid }"></c:out>&id=<c:out value="${row4.id }"></c:out> ">
               		<b><c:out value="${row4.name }"></c:out></b>
               	</a>
                </h3>
                <p><c:out value="${row4.shortdesc }"></c:out></p>
                <br> 
                <a class="btn btn-success" href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row4.catid }"></c:out>&id=<c:out value="${row4.id }"></c:out>"> Order Again <span class="glyphicon glyphicon-chevron-right"></span></a>
                <br><br>
            </div>
          </c:forEach>
        </div>
        <!-- /.row -->
         	
        </div>
        
        
        
 <!-- Reservations -->
        <div class="tab-pane fade in" id="tab2">
          <h3>All of your Dining Reservations</h3>
          <table class="table table-hover table-striped table-bordered">
          	<thead class="">
      			<tr class="info">
      		  <th>Date</th>
        		<th>Table for</th>
       			 <th>Time</th>
     			 </tr>
    		</thead>
    		<tbody>
             		<c:forEach var="row" items="${result.rows }">
          				<tr class="warning">
          					<td><c:out value="${row.date }"></c:out></td>	
          					<td><c:out value="${row.people }"></c:out> People</td>
          					<td><c:out value="${row.time }"></c:out> PM</td>
          				</tr>
         			</c:forEach>
         	</tbody>
         	</table>  
        </div>
        
        <!-- 
        <div class="well well-sm">
          			<div class="row">
          				<div class="col-md-4"><b>Date: </b><c:out value="${row.date }"></c:out></div>
          				<div class="col-md-4"><b>Table for : </b><c:out value="${row.people }"></c:out> People</div>
          				<div class="col-md-4"><b>Time: </b><c:out value="${row.time }"></c:out> PM</div>
          			</div>
         		</div> -->
        
   <!-- Reviews -->
        <div class="tab-pane fade in" id="tab3">
          <h3>Your Product Reviews</h3>
          <c:forEach var="row2" items="${result2.rows }">
          	<div class="well" style="border:1px solid black">
          		
          <div class="row"  >
            <div class="col-md-3">
                
                <a href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row2.catid }"></c:out>&id=<c:out value="${row2.id }"></c:out> ">
               		<center>	<b><c:out value="${row2.name }"></c:out></b>  </center>
               	</a> 
                
                
                <a href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row2.catid }"></c:out>&id=<c:out value="${row2.id }"></c:out> ">
               		<img width="220" height="140" src="<c:out value="${row2.image }"></c:out>" alt="hello">
                </a>
            </div>

            <div class="col-md-9 ">
            
             <c:set var="rate" value="${row2.rating}"/>
             	<h3>Your Review  </h3>
              
              <div class="ratings">
                       <p>
                       <c:forEach var="i" begin="1" end="${rate }">
                            <span class="glyphicon glyphicon-star"></span>
                        </c:forEach>
                      <c:if test="${rate != 5}">
                        	 <c:forEach var="i" begin="1" end="${5-rate }">
                         		<span class="glyphicon glyphicon-star-empty"></span>
                      		 </c:forEach>  
                        </c:if>
                            
                        </p>
                    </div>
               	
                <div class="col-lg-12">
                <p><c:out value="${row2.review }"></c:out></p></div>
                <a class="btn btn-success" href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row2.catid }"></c:out>&id=<c:out value="${row2.id }"></c:out>"> Order Again <span class="glyphicon glyphicon-chevron-right"></span></a>

            </div>
        </div>
      	
          		
          	</div>
          </c:forEach>
        </div>
      </div>
    </div> 
    
    <!-- End of div well -->
    

        <div class="row">
		           
            <div class="col-lg-12">
            <h2>Our Exotic Menu</h2>
             
            </div>
			
        <c:forEach var="row1" items="${result1.rows }">
            <div class="col-md-3 col-sm-3 col-xs-6">
                <a href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row1.id }"></c:out> ">
                    <img style="border:2px solid black; width:350px; height:200px;" class="img-responsive portfolio-item" src="<c:out value="${row1.image }"></c:out>" alt="<c:out value="${row1.name }"></c:out>"       >
                	<h3> <c:out value="${row1.name }"></c:out> </h3>
                </a>
            </div>
		</c:forEach>
		
		
        </div>
 </div>
</body>


<script>
  $(document).ready(function() {
$(".btn-pref .btn").click(function () {
    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
    // $(".tab").addClass("active"); // instead of this do the below 
    $(this).removeClass("btn-default").addClass("btn-primary");   
});
});
</script>
</html>

