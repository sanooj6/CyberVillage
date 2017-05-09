<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="Header.jsp"></jsp:include>
<!-- Start Page Banner -->
    <div class="page-banner" style="padding:40px 0; background: url(images/slide-02-bg.jpg) center #f9f9f9;">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2>Register Your Company</h2>
            <p>We Are Professional</p>
          </div>
          <div class="col-md-6">
            <ul class="breadcrumbs">
              <li><a href="Home.jsp">Home</a></li>
              <li>Company Signup</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- End Page Banner -->

    <!-- Start Content -->
    <div id="content">
      <div class="container">
        <div class="page-content">
		<div class="row">

            <div class="col-md-6 col-md-offset-3">

              <!-- Classic Heading -->
              <h4 class="classic-title"><span>Register Your Company Here</span></h4>
				<form id="CompanyForm">
                    <div class="form-group">
                        <label for="">Company Name</label>
                        <input type="text" class="form-control validate[required, minSize[3]]" name="comp_name" id="comp_name">
                   </div>
                    <div class="form-group">
                        <label for="">Manager's Name</label>
                         <input type="text" class="form-control validate[required, minSize[3]]" name="mng_name" id="mng_name">
                    </div>
                   <div class="form-group">
                        <label for="">Type Of Industry</label>
                        <select class="form-control validate[required]" name="type" id="type">
                        	<option value="">--Select--</option>
                        	<option value="IT/Software">IT/Software</option>
                            <option value="Finance">Finance</option>
                            <option value="Civil">Civil</option>
                        </select>
                    </div>
                    <div class="form-group">
                    	<label for="">Head Office Address</label>
						<textarea name="addrs" id="addrs" placeholder="Head Office" rows="5" class="form-control validate[required, minSize[5]]"></textarea>
					</div>
					<div class="form-group">
                        <label for="">Email</label>
                         <input type="text" class="form-control validate[required,custom[email]]" name="email" id="email">
                    </div>
                    <div class="form-group">
                        <label for="">Mobile</label>
                         <input type="text" class="form-control validate[required, minSize[10],maxSize[10],custom[integer]]" name="mobile" id="mobile">
                    </div>
                    <div class="form-group">
                        <label for="">Website</label>
                         <input type="text" class="form-control validate[required]" name="website" id="website">
                    </div>
                    <div class="form-group">
                        <label for="">Password</label>
                         <input type="password" class="form-control validate[required, minSize[5]]" name="password" id="password">
                    </div>
                    <div class="form-group">
                        <label for="">Confirm Password</label>
                         <input type="password" class="form-control validate[required]" name="cpassword" id="cpassword">
                    </div>
                     <div class="form-group">
                        <label for="">Logo</label><br>
                        <img alt="" src="Uploads/Company_Admin/default.png" style="height: 120px; width: 120px; border:1px solid teal;" id="logP">
                        <input type="file" name="logo" id="logo" onchange="viewImage(this,'logP',120,120);">
                    </div>
                    <!-- <div class="checkbox">
                        <label>
                            <input type="checkbox" id="agree" class="validate[required]">I agree the Privacy Policy
                        </label>
                    </div> -->
                    <input type="submit" class="btn-system btn-large" value="Submit" name="op" id="op"> <input type="reset" class="btn-system btn-large btn-gray" value="Clear" style="float: right;"/>
                </form>
              
            </div>
			 </div>	

         </div>
      </div>
    </div>
 <script type="text/javascript">
 $('#Smenu').addClass('active');
</script>
<jsp:include page="Footer.jsp"></jsp:include>