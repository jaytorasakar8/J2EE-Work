<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
   <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/propertywala"
     user="root"  password=""/>
<%
int id = Integer.parseInt(request.getParameter("id"));
%>
<% System.out.print(id); %>
 <sql:query dataSource="${ds}" var="res">
select * from property where id = <%=id %>
</sql:query>   
<c:forEach var="row" items="${res.rows}">
<div class="row">
<div class="col-md-12">
<div style="text-align: center;" class="col-md-3">

Property : <c:out value="${row.location }"/>-<c:out value="${row.id }"/><br>
Price : &#8377; <font color="green"> <c:out value="${row.price }"/>/-</font><br>
Area : <font color="Blue"> <c:out value="${row.area }"/> SqrFts.</font><br>
Description of Property (by seller):<br>
-------------------------------------<br>
<h4><c:out value="${row.description }"/></h4>
-------------------------------------<br>
Seller Info/Contact Person : <c:out value="${row.seller_name }"/><br>
Contact No. :<c:out value="${row.contact}"/>
</div>
<div class="col-md-9">
<img style="height: 590px; width:965px " src='propertyImg/<c:out value="${row.image }"/>' /><br><br>
</div> 
</div>
</div>
</c:forEach>
