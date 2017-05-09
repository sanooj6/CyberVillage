<%@page import="com.CyberVillage.Models.VacancyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CyberVillage.Services.VacancyService"%>
<%@page import="com.CyberVillage.Models.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="includes/CompanyHeader.jsp"></jsp:include>
<jsp:include page="includes/CompanyMenu.jsp"></jsp:include>
 <% 
 LoginModel lm =(LoginModel)session.getAttribute("COMPANY_DATA");
 int cmp_id    = 0;
 if(null == lm)
 	response.sendRedirect("AdminLogin.jsp");
 else
	 cmp_id        = lm.getUid();
 %>

 <style>
 .form-horizontal .control-label {text-align: left;}
 </style>
 
 <div class="content-wrapper"> 
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Applications <small>Applied Candidates</small> </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Applications</li>
      </ol>
    </section>
    
    <!-- Main content -->
    <section class="content">
    <%
    	VacancyService			vs	=	new VacancyService();
        ArrayList<VacancyModel> brr	=	vs.GetApplications(cmp_id);
    %>
      
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Job Applications</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <table id="AppTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Applied Candidates</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                <% 
               for(VacancyModel vm:brr){
                	String status = vm.getStatus();
                	String oClass = (status.equals("Not Approved"))?"notaprove":"";
                %>
                  <tr class="<%= oClass %>">
                     <td>
                     <div class="recent-job-list-home">
                     <!-- Tabs content -->
						<div class="job-list-logo col-md-1 ">
							<img src="images/resume.jpg" class="img-responsive reumeS" alt="Resume" data-toggle="modal" data-target="#ResumeModal"  filePath="Uploads/Resumes/<%=vm.getResume()%>">
						</div>
						<div class="col-md-4 job-list-desc">
							<h4><%= vm.getName() %></h4>
							<p><i class="fa fa-mortar-board"></i> <%=vm.getQlfn() %></p>
							<p><i class="fa fa-envelope"></i> <%=vm.getEmail() %> &nbsp;&nbsp;<i class="fa fa-mobile"></i> <%=vm.getPhone() %> </p>
						</div>
						<div class="col-md-7 full">
							<div class="row">
								<div class="job-list-type col-md-7" style="padding-left: 5px;">
									<h4><i class="fa fa-black-tie"></i> For <%=vm.getPost() %></h4>
									<h5><i class="fa fa-bookmark"></i> Department : <%=vm.getDept() %> </h5>
									<h5><i class="fa fa-money"></i> Salary : <%=vm.getSalary() %> </h5>
								</div>
								<div class="job-list-location col-md-5 ">
									<h5><i class="fa  fa-calendar"></i> Interview : <%=vm.getDate() %></h5>
									<h5><i class="fa fa-clock-o"></i> Type : <%=vm.getType() %></h5>
									<h5><i class="fa fa-building"></i> Total Vacancy : <%=vm.getTotal() %></h5>
								</div>
								
							</div>
						</div>
						<div class="clearfix"></div>
					</div><!-- Tabs content -->
                     </td>
				      
                    <td style="text-align: center;"> 
                    	
                    	<h5><%=vm.getStatus() %></h5>
                    	<% if(vm.getStatus().equals("Invited")){ %>
                    	<button class="btn btn-info" type="button"  title="Invited">Invited</button>
                    	
                    	<%}else if(vm.getStatus().equals("Pending")){ %>
                    	<button class="btn btn-success" type="button" onclick="Invite(<%=vm.getApp_id()%>,'<%=vm.getPost() %>','<%=vm.getEmail() %>','<%=vm.getDate() %>','<%=vm.getName() %>','<%=vm.getComp_name() %>');" title="Invite">Invite</button>
                    	<%}%>
                   	</td>
                  </tr>
              <%} %>
                 </tbody>
              </table>
            </div>
            <!-- /.box-body --> 
          </div>
          <!-- /.box --> 
        </div>
        <!-- /.col --> 
      </div>
      <!-- /.row --> 
      
      
  
    </section>
    <!-- /.content --> 
  </div>
 
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
}
  .notaprove{background-color: #EBDE52 !important;}
  #approve{height: 20px; width: 20px;margin-right:10px;}
  
  
.recent-job-list,.recent-job-list-home{
	width:100%;
	border-bottom: 1px solid #e3e3e3;
	/* padding:10px 0; */
}

.recent-job-list-det{
	width:100%;
	border-bottom: 1px solid #e3e3e3;
	padding:10px 0;
}

.job-list-logo{
	border-right: 1px solid #e3e3e3;
	min-height:50px;
	padding:10px 10px;
}
.job-list-desc{
	border-right: 1px solid #e3e3e3;
	min-height:50px;
	padding-top:5px;
}
.job-list-desc h6{
	font-size:14px;
	margin:0;
	padding:0;
	color:#565656;	
}
.job-list-desc p{
	color:#929292;
	font-size:13px;
	padding:0;
}
.job-list-location{
	border-right: 1px solid #e3e3e3;
	min-height:50px;
	padding-top:15px;
}
.job-list-type{
	min-height:50px;
	padding-top:15px;
}
.job-list-button{
	min-height:50px;
	padding:10px 0 0 0;
}
.job-list-location h6,.job-list-type h6{
	font-size:14px;
	margin:0;
	padding:0;
	color:#565656;	
}
.job-list-location h6 i{
	color: #27a2f8;	
	margin:0 10px 0 25px;
}
.job-list-type h6 i{
	color: #ff9494;	
	margin:0 10px 0 25px;
}
.job-list-logo,.job-list-desc,.job-list-location,.job-list-type{
	margin:5px 0;
}

.recent-job-list-home .job-list-logo{
	padding:15px 10px 15px 0;
}
.recent-job-list-home .job-list-location{
	padding:15px 10px 15px 5px;
}
.recent-job-list-home .job-list-type{
	padding:15px 10px 15px 0px;
}
.btn-view-job{
	background:#f7f7f7;
	padding:5px 20px;
	border:1px solid #e3e3e3;
}
.btn-view-job:hover{
	background:#ebebeb;
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

<!-- /.content-wrapper -->
 <jsp:include page="includes/AdminFooter.jsp"></jsp:include>
 