<%@ include file="../main_jsps/header.jsp" %>

<h2 style="text-align: center;"><br>Fill this form to sell any property<hr></h2>
<div class="panel-body">
        <form role="form" class="form-group" enctype="multipart/form-data" method="post" action="<%=request.getContextPath() %>/Seller">
        
        <input type="hidden" name="user_id" value="<%=session.getAttribute("user_id") %>" />
        <div class="row">
        <div class="col-md-12">
        <b><font color="red"><c:out value="${msg }" /></font></b>
        </div>
        </div>
        <div class="row">
        <div class="col-md-12">
        <div class="col-md-2">
        <label>Location : </label>
		<input type="text"  name="location" class="form-control"  placeholder="Enter Location">
		</div>
		<div class="col-md-2">
        <label>Area : </label>
		<input type="text" name="area" class="form-control"  placeholder="Enter Area in SqrFt.">
		</div>
		<div class="col-md-2">
        <label>Price : </label>
		<input type="text" name="price" class="form-control"  placeholder="Enter Price in &#8377;">
		</div>
		<div class="col-md-3">
        <label>Seller Name : </label>
		<input type="text" name="seller_name" class="form-control"  placeholder="Enter Seller Name">
		</div>
		<div class="col-md-3">
        <label>Seller Contact : </label>
		<input type="text" name="contact_no" class="form-control"  placeholder="Enter Contact Number">
		</div>
       </div>
       </div><br>
       <div class="row">
        <div class="col-md-12">
        <div class="col-md-6">
        <label>Description : </label>
		<input type="text" name="desc" class="form-control"  placeholder="Enter Description">
		</div>
       <!--<div class="col-md-6">
        <label>Description : </label><br>
		<textarea rows="3" cols="70" name="desc">Enter Brief Description About Property Here,</textarea>
		</div>-->
		<div class="col-md-2">
		<div class="form-group">
        <label for="exampleInputFile">File input</label>
        <input name="file" type="file" id="exampleInputFile">
         <p class="help-block">Example : .jpg, .png , etc.</p>
        </div>
		</div>
		<div class="col-md-4">
		<label for="exampleInputFile">By Clicking On Submit, I Agree to <br>All Terms & Conditions of PropertyWala.com</label>
       <br><input type="submit" value="Submit And Proceed" class="btn btn-primary"/>
        </div>
        </div>
        </div>
       
        </form>
</div>
<%@ include file="../main_jsps/footer.jsp" %>