<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
         <%@ page import="java.util.ArrayList" %>  
  <%@ page import="com.beans.Product" %> 
  
        <sql:setDataSource 
        var="ds" 
        driver="com.mysql.jdbc.Driver"
     	url="jdbc:mysql://localhost/hoteltest"
    	 user="root"  password="" 
    	 scope="application"/>
    	 
    	 
    	 
    	 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Your Shopping Cart</title>

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

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js">
    </script>
    
</head>

<sql:query dataSource="${ds}" var="result">
SELECT * from category;
</sql:query> 

<% int count = 0; %>
			  <c:forEach var="p" items="${list }">
			  <% count++; %>
			  </c:forEach>

<body>
	
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
                        <a href="<%=request.getContextPath() %>/Controller?action=showcart">Your cart(<%=count %>)</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
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
            
            <div class="col-md-9" style="border: 1px solid black">
            	
            	 
          <c:choose>
					<c:when test="${list != null }">
						
						
				
						<%
							double price = 0;
							ArrayList list = (ArrayList)session.getAttribute("list");

						for(Object o :list){
								Product p = (Product)o;
								price = price + Double.parseDouble(p.getPrice());
							%>
			<div class="col-md-12" style="">
				<br>
				
					<div class="col-md-4"><img class="img img-responsive" src="<%=p.getImage() %>" width="175" height="130"></div><br>
							<div class="col-md-4"><b><%=p.getName() %></b></div>
					<div class="col-md-2">Rs. <%=p.getPrice() %></div>
					<div class="col-md-2" ><a href="<%=request.getContextPath() %>/Controller?action=remove&pid=<%=p.getId() %> ">remove</a></div>
				
				
			</div>
					
		<% 
			}
			request.setAttribute("totalprice",price); 
		%>
		
	
		
		
	
		
<div class="col-lg-12">
<BR>
	<center>
		<b>Total Price is : Rs. <%=price %></b>
	</center>
</div>
<br>





<div class="col-lg-12">
<BR>
	<center>
		<a class="btn btn-success" href="<%=request.getContextPath() %>/Controller?action=checkout">Proceed to Checkout</a>
	</center>
</div>

<div class="col-lg-12">
<BR><BR>

</div>

</c:when>



<c:otherwise>

Cart is Empty
</c:otherwise>
</c:choose>
            	 	
          </div>
    		
    		</div>
    
   
    </div>

	
</body>
</html>