<%@page import="com.CyberVillage.Models.CompanyModel"%>
<%@page import="com.CyberVillage.Services.CompanyService"%>
<%@page import="com.CyberVillage.Models.BuildingModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CyberVillage.Services.BuildingService"%>
<%@page import="com.CyberVillage.Models.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="includes/AdminHeader.jsp"></jsp:include>
<jsp:include page="includes/AdminMenu.jsp"></jsp:include>
 <% 
 LoginModel lm =(LoginModel)session.getAttribute("ADMIN_DATA");
 if(null == lm)
 	response.sendRedirect("AdminLogin.jsp"); %>
 <!-- Content Wrapper. Contains page content -->
<div class="content-wrapper"> 
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Companies <small>Registered Companies</small> </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Company</li>
      </ol>
    </section>
    
    <!-- Main content -->
    <section class="content">
    <%
    	CompanyService 	cs 			=	new CompanyService();
        ArrayList<CompanyModel> brr	=	cs.AllCompany();
    %>
      
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Comapnies</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <span class="flag pull-right"><label id="approve" class="label  bg-yellow">&nbsp;</label>Not Approved</span>
              <table id="CmpTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Company Details</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                <% 
               for(CompanyModel cm:brr){
                	String status = cm.getStatus();
                	String oClass = (status.equals("Not Approved"))?"notaprove":"";
                %>
                  <tr class="<%= oClass %>">
                     <td>
                     <div class="recent-job-list-home">
                     <!-- Tabs content -->
						<div class="job-list-logo col-md-1 ">
							<img src="Uploads/Company_Admin/<%=cm.getLogo() %>" class="img-responsive" alt="dummy-joblist" style="border:2px solid #929292; border-radius:5px;width:120px;">
						</div>
						<div class="col-md-5 job-list-desc">
							<h5><%= cm.getComp_name() %></h5>
							<p><%=cm.getAddress() %></p>
							<p><i class="fa fa-envelope"></i> <%=cm.getEmail() %> &nbsp;&nbsp;<i class="fa fa-mobile"></i> <%=cm.getMobile() %> </p>
						</div>
						<div class="col-md-6 full">
							<div class="row">
								<div class="job-list-type col-md-6 ">
									<h6><i class="fa fa-user"></i>Manager : <%=cm.getMng_name() %></h6>
									<h6><i class="fa fa-industry"></i>Industry : <%=cm.getIndustry() %></h6>
									<h6><i class="fa fa-dribbble"></i>Website : <%=cm.getWebsite() %></h6>
								</div>
								<div class="job-list-location col-md-6 ">
									<h6><i class="fa fa-building"></i>Building : <%=cm.getBuil_name() %></h6>
									<h6><i class="fa fa-building"></i>Floor : <%=cm.getFloor_name() %></h6>
									<h6><i class="fa fa-building"></i>Room : <%=cm.getRoom_name() %></h6>
								</div>
								
							</div>
						</div>
						<div class="clearfix"></div>
					</div><!-- Tabs content -->
                     </td>
				      
                    <td style="text-align: center;"> 
                    	<%-- <a class="btn btn-default btn-xs" href="javascript:" title="Edit" onclick="EditRoom(<%=rm.getRoom_id()%>);"> <!-- data-toggle="collapse" data-target="#addClient" -->
                    		<i class="fa fa-pencil-square-o"></i>
                    	</a> 
                    	<a href="javascript:" title="Delete" class="btn btn-default btn-xs" onclick="Delete(<%=rm.getRoom_id()%>,'RoomServlet');">
                    		<i class="fa fa-trash-o"></i>
                    	</a>  --%>
                    	<h5><%=cm.getStatus() %></h5>
                    	<% if(cm.getStatus().equals("Active")){ %>
                    	<button class="btn btn-danger" type="button" onclick="ChangeStatus(<%=cm.getComp_id()%>,'CompanyServlet','Inactive');" title="Disable"><i class="fa fa-ban"></i></button>
                    	<!-- <a href="javascript:" title="Disable" class="btn btn-danger btn-xs" ">
                    		<i class="fa fa-ban"></i>
                    	</a> -->
                    	<%}else if(cm.getStatus().equals("Inactive")){ %>
                    	<%-- <a href="javascript:" title="Enable" class="btn  btn-info btn-xs" onclick="ChangeStatus(<%=rm.getRoom_id()%>,'RoomServlet','Active');">
                    		<i class="fa fa-check"></i>
                    	</a> --%>
                    	<button class="btn btn-success" type="button" onclick="ChangeStatus(<%=cm.getComp_id()%>,'CompanyServlet','Active');" title="Enable"><i class="fa fa-check"></i></button>
                    	<%}else if(cm.getStatus().equals("Not Approved")){%>
                    	<button class="btn btn-info" type="button" title="Approve" onclick="Approve(<%=cm.getComp_id()%>,<%=cm.getRoom_id()%>,'<%=cm.getComp_name()%>','<%=cm.getEmail()%>')"><i class="fa fa-thumbs-o-up"></i></button>
                    	<%} %>
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
  <style>
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
  </style>
<!-- /.content-wrapper -->
 <jsp:include page="includes/AdminFooter.jsp"></jsp:include>
 