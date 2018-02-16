<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
        
 <c:import url="header.jsp"></c:import>       
<sql:query dataSource="${ds}" var="result">
SELECT * from category;
</sql:query>  




<div class="header_slide">
			<div class="header_bottom_left">				
				<div class="categories">
				  <ul>
				  	<h3>Categories</h3>
				      <c:forEach var="row" items="${result.rows }">
				  	 <li><a href="<%=request.getContextPath() %>/Controller?action=category&cat_id=<c:out value="${row.id }"></c:out>"><c:out value="${row.name }"></c:out></a></li>
				  	
				  	</c:forEach>
				  </ul>
				</div>					
	  	     </div>
					 <div class="header_bottom_right">					 
					 	
				<div class="section group">
<sql:query dataSource="${ds}" var="result1">
SELECT * from product where cat_id =<%=request.getAttribute("cat_id") %>;
</sql:query>  
		<%
		int count=0;
		%>		
		<table>
		
				<c:forEach var="row1" items="${result1.rows }">
			
				<div class="grid_1_of_4 images_1_of_4">
					 <a href="preview.html"><img src='<c:out value="${row1.image }"></c:out>' alt="" width="100" height="75" /></a>
					 <h2><c:out value="${row1.title }"></c:out> </h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">Rs. <c:out value="${row1.price }"></c:out>.00</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">Add to Cart</a></h4>
							     </div>
							    
							 <div class="clear"></div>
					</div>
					 
				</div>
				
				
				
				
				
				
				</c:forEach>
				
			</table>		
					 <div class="clear"></div>					       
		         </div>
		      
		   <div class="clear"></div>
	
</div>
</div> 

.
<c:import url="footer.jsp"></c:import>       