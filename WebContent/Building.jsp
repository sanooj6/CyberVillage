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
 
 <style>
 .form-horizontal .control-label {text-align: left;}
 </style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper"> 
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Buildings <small>Information about buildings/blocks</small> </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Buildings</li>
      </ol>
    </section>
    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12 collapse" id="addClient" > 
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Add new</h3>
            </div>
            <!-- /.box-header --> 
            <!-- form start -->
            <form class="form-horizontal" id="BuildingForm">
              <div class="box-body">
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Building/Block Name</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control validate[required, minSize[3]]" id="b_name" name="b_name" placeholder="Building Name">
                  </div>
                </div>
              <!--   <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Building Type</label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <input type="radio" name="b_type" value="Rent" class="bt validate[required]">
                      Rent</label>
                    <label class="radio-inline">
                      <input type="radio" name="b_type" value="Lease" class="bt validate[required]">
                      Lease</label>
                  </div>
                </div> -->
                <div class="form-group" id="dur" style="display: none;">
                  <label for="" class="col-sm-2 control-label">Duration</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control validate[required,custom[integer]]" id="duration" placeholder="Lease Duration in months" name="duration">
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Description</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" rows="3" placeholder="Any Other Information" name="description" id="description"></textarea>
                  </div>
                </div>
               
                
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="reset" class="btn btn-default cancel" data-target="#addClient">Cancel</button>
                <input type="submit" class="btn btn-info pull-right" value="Save" name="op" id="op">
              </div>
              <!-- /.box-footer -->
              <input type="hidden" id="id" name="id">
            </form>
          </div>
          <!-- /.box --> 
          
        </div>
      </div>
      <!-- /.row -->
      <% 
    	 BuildingService bs=new BuildingService();
		 ArrayList<BuildingModel>arr=bs.selectAllBuilding();
	  %>
      
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Building Table</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-primary btn-sm add"  data-target="#addClient">Add New</button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="BuilTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Name</th>
                   <!--  <th>Type</th> -->
                   <!--  <th>Duration</th> -->
                    <th>Description</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                <% for(BuildingModel bm:arr){%>
                  <tr>
                      <td><%=bm.getBuil_id()%></td>
				      <td><%=bm.getBuil_name() %></td>
				      <%-- <td><%=bm.getBuil_type() %></td>
				      <td><%=bm.getDuration() %>&nbsp;&nbsp;Months</td> --%>
				      <td><%=bm.getBuil_descr() %></td>
				      <td><%=bm.getStatus() %></td>
				      
                    <td> 
                    	<a class="btn btn-default btn-xs" href="javascript:" title="Edit" onclick="EditBuilding(<%=bm.getBuil_id()%>);"> <!--  -->
                    		<i class="fa fa-pencil-square-o"></i>
                    	</a> 
                    	<a href="javascript:" title="Delete" class="btn btn-default btn-xs" onclick="Delete(<%=bm.getBuil_id()%>,'BuildingServlet');">
                    		<i class="fa fa-trash-o"></i>
                    	</a> 
                    	<% if(bm.getStatus().equals("Active")){ %>
                    	<a href="javascript:" title="Disable" class="btn btn-danger btn-xs" onclick="ChangeStatus(<%=bm.getBuil_id()%>,'BuildingServlet','Inactive');">
                    		<i class="fa fa-ban"></i>
                    	</a>
                    	<%}else{ %>
                    	<a href="javascript:" title="Enable" class="btn btn-success btn-xs" onclick="ChangeStatus(<%=bm.getBuil_id()%>,'BuildingServlet','Active');">
                    		<i class="fa fa-check"></i>
                    	</a>
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
  <!-- /.content-wrapper -->
 <jsp:include page="includes/AdminFooter.jsp"></jsp:include>