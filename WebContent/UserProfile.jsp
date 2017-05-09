<%@page import="com.CyberVillage.Models.UserModel"%>
<%@page import="com.CyberVillage.Services.UserService"%>
<%@page import="com.CyberVillage.Models.LoginModel"%>

<jsp:include page="Header.jsp"></jsp:include>
 <link rel="stylesheet" href="plugins/datepicker/jquery-ui.css">
 <script src="plugins/datepicker/jquery-ui.js"></script>
 <script src="plugins/datatables/jquery.dataTables.min.js"></script>
 <% 
 LoginModel lm 		=	(LoginModel)session.getAttribute("USER_DATA");
 int Uid 			=	0;
 if(null == lm)
 	response.sendRedirect("UserLogin.jsp");
 else
	 Uid = lm.getUid();
 	UserService	rs	=	new UserService();
 	UserModel	um	=	rs.GetProfile(Uid);
 %>
 <!-- Start Page Banner -->
    <div class="page-banner" style="padding:40px 0; background: url(images/slide-02-bg.jpg) center #f9f9f9;">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2>Profile</h2>
            <p>We Are Professional</p>
          </div>
          <div class="col-md-6">
            <ul class="breadcrumbs">
              <li><a href="Home.jsp">Home</a></li>
              <li>Profile</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
 <!-- End Page Banner -->
 
 <!-- Start Content -->
    <div id="content">
      <div class="container">
        <div class="project-page row">

		<!-- Start Project Content -->
          <div class="project-content col-md-4">
            <h4><span>Profile Details</span></h4>
            <table>
            	<tr><td><strong>Name</strong></td><td>&nbsp; : <%= um.getName() %></td></tr>
            	<tr><td><strong>Gender</strong></td><td>&nbsp; : <%=um.getGender() %></td></tr>
            	<tr><td><strong>Date Of Birth</strong></td><td>&nbsp; : <%=um.getDob() %></td></tr>
            	<tr><td><strong>Address</strong></td><td>&nbsp; : <%=um.getAddress() %></td></tr>
            	<tr><td><strong>Mobile</strong></td><td>&nbsp; : <%=um.getMobile() %></td></tr>
            	<tr><td><strong>Email</strong></td><td>&nbsp; : <%=um.getEmail() %></td></tr>
            	<tr><td><strong>Qualification</strong></td><td>&nbsp; : <%=um.getQuali() %></td></tr>
            	<tr><td><strong>State</strong></td><td>&nbsp; : <%=um.getState() %></td></tr>
            	<tr><td><strong>District</strong></td><td>&nbsp; : <%=um.getDistrict() %></td></tr>
            	<tr><td colspan="2"><strong><img src="images/resume.jpg" class="img-responsive reumeS" alt="Resume" data-toggle="modal" data-target="#ResumeModal"  filePath="Uploads/Resumes/<%=um.getResume()%>"></strong></td></tr>
            	<tr><td colspan="2"><strong><input type="submit" class="btn-system btn-large pull-right" value="Edit" id="Edit"></strong></td></tr>
            </table>
          		
         </div>
          <!-- End Project Content -->
          <!-- Start Single Project Slider -->
          <div class="project-media col-md-8">
           	<div class="item" id="picDiv">
               <img alt="" src="images/pro.jpg" >
            </div>
            <form id="UserForm" style="display: none;">
                  <div class="form-group">
                      <label for="">Name</label>
                      <input type="text" value="<%= um.getName() %>" class="form-control validate[required, minSize[3]]" name="name" id="name" >
                 </div>
                 <div class="form-group">
                      <label for="">Date of Birth</label>
                       <input type="text" value="<%=um.getDob() %>" class="form-control validate[required]" name="dob" id="dob">
                  </div>
                   <div class="form-group">
                  	<label for="">Address</label>
				<textarea name="addrs" id="addrs"  rows="5" class="form-control validate[required, minSize[5]]"><%=um.getAddress() %></textarea>
			</div>
			 <div class="form-group">
                      <label for="">District</label>
                      <input type="text" value="<%=um.getDistrict() %>" class="form-control validate[required, minSize[3]]" name="dist" id="dist">
                 </div>
                 <div class="form-group">
                      <label for="">State</label>
                      <input type="text" value=" <%=um.getState() %>" class="form-control validate[required, minSize[3]]" name="state" id="state">
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
                       <br><strong><%=um.getResume()%></strong>
                       <input type="file"  class="form-control" name="resume" id="resume" style="width:50%">
                  </div>
                  <div class="form-group">
                      <label for="">Mobile</label>
                       <input type="text" value="<%=um.getMobile() %>" class="form-control validate[required, minSize[10],maxSize[10],custom[integer]]" name="mobile" id="mobile">
                  </div>
              	  <input type="hidden" name="U_ID" id="U_ID" value="<%=um.getU_id()%>">
                  <input type="submit" class="btn-system btn-large" value="Update" name="op" id="op">
         </form>
          </div>
          <!-- End Single Project Slider -->

         </div>

       
      </div>
    </div>
    <!-- End Content -->
   <div id="ResumeModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Resume</h4>
      </div>
      <div class="modal-body">
         	<div class="iframe-container">
         	<iframe src="" id="resFrame"></iframe></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
 <style>
 .modal-dialog {
    margin: 30px auto;
    width: 1000px;
    margin-top: 120px;
}
.iframe-container {    
    padding-bottom: 60%;
    padding-top: 30px; height: 0; overflow: hidden;
}
 
.iframe-container iframe,
.iframe-container object,
.iframe-container embed {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
</style>
<script type="text/javascript">
 //Date picker
 $( "#dob" ).datepicker({
	changeYear: true,
	 changeMonth: true,
	 yearRange: "1986:1998"
});
 $('#Pmenu').addClass('active');
 
 $(document).ready(function() {
	 $('#quali').val('<%= um.getQuali()%>');
	 //........................Edit.............................//
	 $('#Edit').click(function(){
		 $('#picDiv').hide();
		 $('#UserForm').show();
	 });
	 
});
 </script>

<jsp:include page="Footer.jsp"></jsp:include>