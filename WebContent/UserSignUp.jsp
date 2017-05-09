<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="Header.jsp"></jsp:include>
 <link rel="stylesheet" href="plugins/datepicker/jquery-ui.css">
 <script src="plugins/datepicker/jquery-ui.js"></script>
<!-- Start Page Banner -->
    <div class="page-banner" style="padding:40px 0;  background: url(images/slide-02-bg.jpg) center #f9f9f9;">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2>Create an account</h2>
            <p>We Are Professional</p>
          </div>
          <div class="col-md-6">
            <ul class="breadcrumbs">
              <li><a href="Home.jsp">Home</a></li>
              <li>User Signup</li>
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
              <h4 class="classic-title"><span>Register Your Account Here</span></h4>
				<form id="UserForm">
                    <div class="form-group">
                        <label for="">Name</label>
                        <input type="text" class="form-control validate[required, minSize[3]]" name="name" id="name">
                   </div>
                    <div class="form-group">
                        <label for="">Gender</label>
                        <div class="form-control">
                        <input type="radio" class="validate[required]" name="gender" id="male" value="Male">Male
                        <input type="radio" class="validate[required]" name="gender" id="female" value="Female">Female
                       </div> 
                   </div>
                    <div class="form-group">
                        <label for="">Date of Birth</label>
                         <input type="text" class="form-control validate[required]" name="dob" id="dob">
                    </div>
                     <div class="form-group">
                    	<label for="">Address</label>
						<textarea name="addrs" id="addrs"  rows="5" class="form-control validate[required, minSize[5]]"></textarea>
					</div>
					 <div class="form-group">
                        <label for="">District</label>
                        <input type="text" class="form-control validate[required, minSize[3]]" name="dist" id="dist">
                   </div>
                   <div class="form-group">
                        <label for="">State</label>
                        <input type="text" class="form-control validate[required, minSize[3]]" name="state" id="state">
                   </div>
                   <div class="form-group">
                        <label for="">Qualification</label>
                  		<select class="form-control validate[required]" id="quali" name="quali">
	                    	<option value="">--select--</option>
	                    	<option value="B Tech">B Tech</option>
	                    	<option value="Diploma">Diploma</option>
	                    	<option value="M Tech">M Tech</option>
	                    	<option value="BSC">BSC</option>
	                    	<option value="BCA">BCA</option>
	                        <option value="MCA">MCA</option>
                    	</select>
                   </div>
                  <div class="form-group">
                        <label for="">Resume</label>
                         <input type="file" class="form-control validate[required]" name="resume" id="resume">
                    </div>
                    <div class="form-group">
                        <label for="">Mobile</label>
                         <input type="text" class="form-control validate[required, minSize[10],maxSize[10],custom[integer]]" name="mobile" id="mobile">
                    </div>
                    <div class="form-group">
                        <label for="">Email</label>
                         <input type="text" class="form-control validate[required,custom[email]]" name="email" id="email">
                    </div>
                    <div class="form-group">
                        <label for="">Password</label>
                         <input type="password" class="form-control validate[required, minSize[5]]" name="password" id="password">
                    </div>
                    <div class="form-group">
                        <label for="">Confirm Password</label>
                         <input type="password" class="form-control validate[required]" name="cpassword" id="cpassword">
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
 //Date picker
 $( "#dob" ).datepicker({
	changeYear: true,
	 changeMonth: true,
	 yearRange: "1986:1998"
});
 </script>
<script type="text/javascript">
 $('#Smenu').addClass('active');
</script>
<jsp:include page="Footer.jsp"></jsp:include>