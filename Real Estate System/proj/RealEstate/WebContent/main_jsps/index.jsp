<%@ include file="header.jsp" %>

  

  <!-- Advance Search -->
  <section id="aa-advance-search">
    <div class="container">
      <div class="aa-advance-search-area">
        <div class="form">
         <div class="aa-advance-search-top">
            <div class="row">
            <h4><font color="red"><c:out value="${msg}" /></font></h4>
            <form method="post" action="<%=request.getContextPath() %>/Buyer">
				<input type="hidden" name="action" value="search" />
              <div class="col-md-8">
                <div class="aa-single-advance-search">
                  <input type="text" name="search_query" placeholder="Type Location Here">
                </div>
              </div>
              <div class="col-md-4">
                <div class="aa-single-advance-search">
                  <input class="aa-search-btn" type="submit" value="Search Property">
                </div>
              </div>
              </form>
            </div>
            <c:forEach items="${list }" var="l">
            <a href="<%=request.getContextPath() %>/Buyer?action=location&loc=<c:out value="${l.getLocation()}" />"><h3><c:out value="${l.getLocation()}" /></h3></a>
            <BR>
			</c:forEach>
            </div>
            <BR><BR>
            <BR><BR>

            <%@ include file="topLoc.jsp" %>
            
  <%@ include file="footer.jsp" %>