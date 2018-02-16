<%@ include file="../main_jsps/header.jsp" %>
<style type="text/css">
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 9999; /* Sit on top */
    padding-top: 2px; /* Location of the box */
    left: 2px;
    top: 0;
   right : 2px;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
</style>
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
            <%int i=0; %>
            <c:forEach items="${list }" var="l">
            <a href="<%=request.getContextPath() %>/Buyer?action=location&loc=<c:out value="${l.getLocation()}" />"><h3><c:out value="${l.getLocation()}" /></h3></a>
            <BR>
			</c:forEach>
            </div>
            <BR><BR>
            <BR><BR>
            <c:forEach items="${prop }" var="p">
            <div class="image-block col-xs-3 col-sm-3 hovereffect" >
            <button type="button" onclick='xmlhttpPost(<c:out value="${p.getId() }" />)' class="btn btn-default" id="myBtn">
            <h4><c:out value="${p.getLocation() }"/>-<c:out value="${p.getId() }"/></h4>
            <b style="color:blue">Area: <font color="red"><c:out value="${p.getArea() }"/> SqrFts</font></b>
            <br>
            <b style="color:blue">Price : Rs:<font color="green"> <c:out value="${p.getPrice() }"/>/-</font></b>
            <br>
            <img style="height: 200px; width:200px" src="propertyImg/<c:out value="${p.getImage() }" />">
            </button>
            <font color="red">-----------------------------------------------</font>
            </div>
            
            </c:forEach>
            
            
            <%@ include file="../main_jsps/topLoc.jsp" %>
            <div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
  <span class="close">X Close</span><br>
    <div id="result">
    </div>
  </div>

</div>

<script>
var modal = document.getElementById('myModal');
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];

function xmlhttpPost(pid) {
    modal.style.display = "block";
    var xmlHttpReq = false;
    var self = this;
    var strURL="buyer_jsps/fetch.jsp";
    if (window.XMLHttpRequest) {
    self.xmlHttpReq = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
    self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
    }
    self.xmlHttpReq.open('POST', strURL, true);
    self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    self.xmlHttpReq.onreadystatechange = function() {
    if (self.xmlHttpReq.readyState == 4) {
    updatepage(self.xmlHttpReq.responseText); 
    }
    }
    self.xmlHttpReq.send(getquerystring(pid)); 
}
function getquerystring(pid) {
	var pid = pid;
	qstr = 'id=' + escape(pid); // NOTE: no '?' before querystring
	return qstr;
	}
function updatepage(str){
	document.getElementById("result").innerHTML = str;
	}
span.onclick = function() {
    modal.style.display = "none";
}
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<%@ include file="../main_jsps/footer.jsp" %>