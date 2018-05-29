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
    	 
	 <sql:setDataSource 
        var="ds1" 
        driver="com.mysql.jdbc.Driver"
     	url="jdbc:mysql://localhost/hoteltest"
    	 user="root"  password="" 
    	 scope="application"/>
    	 
    	 
    	 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
 <title>Product Details</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js">
    </script>
    
    
   <script src="js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="css/sweetalert.css">
   

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-item.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    hr
{
    border: 1px solid #000;
}
    </style>
    
  
</head>


<sql:query dataSource="${ds}" var="result">
SELECT * from category;
</sql:query>  

<sql:query dataSource="${ds1}" var="result1">
SELECT * from product where catid=<%=request.getAttribute("cid") %> and id=<%=request.getAttribute("pid") %>;
</sql:query>  

 <sql:query dataSource="${ds}" var="result2">
SELECT * from category where id=<%=request.getAttribute("cid") %> ;
</sql:query> 

<sql:query dataSource="${ds}" var="result3">
SELECT * from product where catid=<%=request.getAttribute("cid") %> ;
</sql:query> 


<sql:query dataSource="${ds}" var="result4">
SELECT * from review,user where review.pid=<%=request.getAttribute("pid") %> and review.userid=user.userid;
</sql:query>

<sql:query dataSource="${ds}" var="result5">
SELECT count(rid) as count1 from review where pid=<%=request.getAttribute("pid") %>;
</sql:query>

<sql:query dataSource="${ds}" var="result6">
SELECT * from user where user.userid="<%=session.getAttribute("userid") %>";
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
    
    
		
    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead">Food Categories</p>
                <div class="list-group">
                
                <c:forEach var="row" items="${result.rows }">
                   
                <a href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row.id }"></c:out>"
                		 class="list-group-item ">  <c:out value="${row.name }"></c:out>  </a>
                
                </c:forEach>
                </div>
            </div>

            <div class="col-md-9">

                <div class="thumbnail">
                
                <c:forEach var="row1" items="${result1.rows }">
                    <img class="img-responsive" src="<c:out value="${row1.image }"></c:out>" alt="<c:out value="${row1.name }"></c:out>">
                 </c:forEach>   
                    
                    <div class="caption-full">
                    
                    <c:forEach var="row1" items="${result1.rows }">
                    
                        <h4 class="pull-right">Rs. <c:out value="${row1.price }"></c:out></h4>
                        <h4><a
                         href=
                        "<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row1.catid }"></c:out>&id=<c:out value="${row1.id }"></c:out>">
                        			<c:out value="${row1.name }"></c:out></a>
                        </h4>
                        <p>  <c:out value="${row1.description }"></c:out> </p>
                        
                <div>
                  <center>
                  	
                  	
                  	<a href="<%=request.getContextPath() %>/Controller?action=addtocart&pid=<c:out value="${row1.id }"></c:out>&name=<c:out value="${row1.name }"></c:out>&price=<c:out value="${row1.price }"></c:out>&image=<c:out value="${row1.image }"></c:out>&catid=<c:out value="${row1.catid }"></c:out>" 
                  	
                  	class="btn btn-success btn-lg">
                  			Add to cart</a>
                
                  </center>
                   
   	
					
                 </div>
                  
                  
					</c:forEach>
					</div>
                  
                  
                    
                    <div class="ratings">
                        <p class="pull-right">
                          <c:forEach var="row5" items="${result5.rows }">
      <!--      <c:set var="productpid" value="${row5.pid }"/>     -->           
						
                        	<c:out value="${row5.count1 }"></c:out> Review(s)
                        	</c:forEach>
                        </p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            4.0 stars
                        </p>
                    </div>
                </div>

                <div class="well">
		
		<c:set var="i" value="${sessionScope.status }"></c:set>				
				
			<c:if test="${(i eq null) || (i eq 'invalidlogin')  }">
				<center>	<b><c:out value="Sorry You need to Login Inorder to ADD A REVIEW here "></c:out></b> <br>
							<a class="btn btn-info btn-lg" href="<%=request.getContextPath() %>/Controller?action=loginpage">Login</a>
				 </center>
			</c:if>
				

			<c:if test="${i eq 'loggedin' }">
				
					 <div class="text-right">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="">Add a review</button>
						 </div>
						 
			 
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
 
<form action="<%=request.getContextPath() %>/Controller?action=addreview" method="post">   


<!-- 
<c:forEach var="j" items="${result4.rows }">
	<input type="hidden" name="pid" value="8">  
</c:forEach>
   -->
   
   
   
   
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Your Product Review</h4>
      </div>
      
      
      <div class="modal-body">
     
        <div class="form-group">
           <c:forEach var="row6" items="${result6.rows }">
           
            <label for="recipient-name" class="control-label">Your name</label>
           <b><input type="text" class="form-control" id="recipient-name" name="name" value="<c:out value="${row6.name }"></c:out>" disabled></b> 
            </c:forEach>
          </div>
         
           
          <div class="form-group">
           <label for="recipient-name" class="control-label">Your Product Rating</label>
          		<select name="rating" id="rating">
         			<option value="0">--Select a rating--</option>
  					<option value="5">5 star - Extra Ordinary Food </option>
 					<option value="4">4 star - Great Taste</option>
 			  		<option value="3">3 star - I am Satisfied</option>
  					 <option value="2">2 star - Average Food</option>
   					<option value="1">1 star - Not Satisfied</option>
   				 </select>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Review</label>
            <textarea class="form-control" name="review" id="message-text"></textarea>
          </div>
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       
       <input type="submit" value="Add Product Review" class="btn btn-success btn-md">
        
      </div>
     
     
       
      
    </div>
  </div>
  
  </form> 
</div>

 
			</c:if>		 
                    <hr>

			<c:forEach var="row4" items="${result4.rows }">
                <div class="row">
                     <c:set var="rate" value="${row4.rating}"/>
                        <div class="col-md-12">
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
                            
                          
                            <b><c:out value="${row4.name }"></c:out> writes</b>
                           
                            <span class="pull-right">10 days ago</span>
                            <p><c:out value="${row4.review }"></c:out>  </p>
                        </div>
                        
                       
                </div>
                <hr >
            </c:forEach>

                    
                </div>

            </div>
            
         <div class="row">
		           
            <div class="col-lg-12">
             <c:forEach var="row2" items="${result2.rows }">
               		 <h2 class="page-header">You may also like the other <c:out value="${row2.name }"></c:out> </h2>
            	</c:forEach>
            </div>
			
        <c:forEach var="row3" items="${result3.rows }">
            <div class="col-md-3 col-sm-3 col-xs-6">
                <a href="<%=request.getContextPath() %>/Controller?action=category&catid=<c:out value="${row3.catid }"></c:out>&id=<c:out value="${row3.id }"></c:out> ">
                    <img style="border:2px solid black; width:350px; height:200px;" class="img-responsive portfolio-item" src="<c:out value="${row3.image }"></c:out>" alt="<c:out value="${row3.name }"></c:out>"       >
                	<h3> <c:out value="${row3.name }"></c:out> </h3>
                </a>
            </div>
		</c:forEach>
		
		
        </div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
<script type="text/javascript">
  
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  /*var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)*/
	})
</script>


<c:if test='${msg =="Product Added to Cart" }'>
		
		<script type="text/javascript">
		
		swal("Great News", "Your Product Added successfully", "success")
		</script>
		<c:set var="msg" value="null" scope="session"> </c:set>
		</c:if>
<!-- 		
<c:if test='${msg =="Review added succesfully" }'>
		
		<script type="text/javascript">
		
		swal("Great News", "Your Review added succesfully", "success")
		</script>
		<c:set var="msg" value="null" scope="session"> </c:set>
		</c:if>	
 -->
 
 
</html>

