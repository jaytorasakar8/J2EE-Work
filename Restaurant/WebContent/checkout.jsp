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
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
   
    <link rel="icon" href="favicon.ico">

    <title>Checkout</title>

<link rel="stylesheet" href="css/checkout.css">
  </head>

  
<sql:query dataSource="${ds}" var="result">
SELECT * from orders,user where orders.orderid=<%=request.getAttribute("orderid") %> and orders.userid=user.userid;
</sql:query>
  
  <sql:query dataSource="${ds}" var="result1">
SELECT * from orders,product where orders.orderid=<%=request.getAttribute("orderid") %> and orders.pid=product.id;
</sql:query>
  

  <body class="main">

    <div class="container">

      <div class="row marketing">
      
        <div class="col-lg-12">
        
          <h4><b>Product Name</b></h4>
<hr />

<div>
<center>  
<h4>Success - your order is confirmed!</h4>
<h5>Order number: <%=request.getAttribute("orderid") %> </h5>
<hr />  
</div>
</center>
        </div>

    <div class="row">
        <div class="col-xs-12">
    		<div class="row">
    			<div class="col-xs-6">
        			<address>
    				<strong>Shipping Address:</strong><br>
    				<c:forEach var="row" items="${result.rows }">
                        Name: &nbsp; <b><c:out value="${row.name }"></c:out></b> <br>
                        Email: &nbsp; <b><c:out value="${row.email }"></c:out></b><br>
                        Mobile: &nbsp; <b><c:out value="${row.phone }"></c:out></b> <br>
    					Address: &nbsp; <b><c:out value="${row.address }"></c:out></b><br>
    				</c:forEach>
    				</address>

    			</div>
    			<div class="col-xs-6 text-right">
                <h1><span class="glyphicon glyphicon glyphicon-cloud-download" aria-hidden="true"></span></h1>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<center><p><span class="glyphicon glyphicon glyphicon-heart" aria-hidden="true"></span> 
                   We hope that your experience with us was Amazing. Looking forward to completing your order.
                   	<span class="glyphicon glyphicon glyphicon-heart" aria-hidden="true"></span></p> </center>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Product Name</strong></td>
        							<td class="text-right"><strong>Quantity</strong></td>
            						<td class="text-right"><strong>Price</strong></td>
                                    
                                </tr>
    						</thead>
    						
    						<tbody>
    							
    						<c:forEach var="row1" items="${result1.rows }">
    							<tr>
    								<td><c:out value="${row1.name }"></c:out></td>
            						<td class="text-right">1</td>
            						<td class="text-right"><c:out value="${row1.price }"></c:out> Rs</td>
            						
    							</tr>
    							<hr>
    							</c:forEach>
    							
    							<tr>
    								
    								<td class="thick-line"></td>
    								<td class="thick-line text-right"><strong>VAT - 12%</strong></td>
    								<td class="thick-line text-right">incl.</td>
    							</tr>
    							<tr>
    								
    								<td class="no-line"></td>
    								<td class="no-line text-right"><strong>Shipping</strong></td>
    								<td class="no-line text-right">incl.</td>
    							</tr>
    							<tr>
    								
    								<td class="no-line"></td>
    								<td class="no-line text-right"><strong>Total</strong></td>
    								<td class="no-line text-right"><%=request.getAttribute("totalprice") %>Rs</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    		</div>
    	</div>
    </div>
</div>

      </div>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>