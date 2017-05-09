<%@page import="com.CyberVillage.Models.FloorModel"%>
<%@page import="com.CyberVillage.Services.FloorService"%>
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

 <% 
   	 BuildingService bs=new BuildingService();
	 ArrayList<BuildingModel>arr=bs.selectAllBuilding();
 %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper"> 
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Floors <small>Information about floors in buildings/blocks</small> </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Floors</li>
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
            <form class="form-horizontal" id="FloorForm">
              <div class="box-body">
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Floor</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control validate[required, minSize[3]]" id="floor" name="floor" placeholder="Floor Name">
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Building/Block</label>
                  <div class="col-sm-10">
                    <select class="form-control validate[required]" id="building" name="building">
                    	<option value="">--select--</option>
                      <% for(BuildingModel bm:arr) { if(bm.getStatus().equals("Active")){ %>
						<option value="<%=bm.getBuil_id()%>"><%=bm.getBuil_name()%></option>
					  <%}} %>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Description</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" rows="3" placeholder="Any Other Information" name="description" id="description"></textarea>
                  </div>
                </div>
               <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Rent Per Squirefeet(Rs)</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control validate[required, custom[number]]" id="rent" name="rent" placeholder="Rent">
                  </div>
                </div>
                
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="reset" class="btn btn-default cancel"  data-target="#addClient">Cancel</button>
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
		FloorService fs=new FloorService();
		ArrayList<FloorModel>arr1=fs.selectAllFloor();
	 %>
      
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Floor Table</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-primary btn-sm add"  data-target="#addClient">Add New</button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="FloorTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Floor</th>
                    <th>Building</th>
                    <th>Description</th>
                    <th>Rent(Rs)</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                <% for(FloorModel fm:arr1){%>
                  <tr>
                      <td><%=fm.getFloor_id()%></td>
				      <td><%=fm.getFloor_name() %></td>
				      <td><%=fm.getBuil_name() %></td>
				      <td><%=fm.getDescr() %></td>
				      <td><%=fm.getRent() %></td>
				      <td><%=fm.getStatus() %></td>
				      
                    <td> 
                    	<a class="btn btn-default btn-xs" href="javascript:" title="Edit" onclick="EditFloor(<%=fm.getFloor_id()%>);"> <!-- data-toggle="collapse" data-target="#addClient" -->
                    		<i class="fa fa-pencil-square-o"></i>
                    	</a> 
                    	<a href="javascript:" title="Delete" class="btn btn-default btn-xs" onclick="Delete(<%=fm.getFloor_id()%>,'FloorServlet');">
                    		<i class="fa fa-trash-o"></i>
                    	</a> 
                    	<% if(fm.getStatus().equals("Active")){ %>
                    	<a href="javascript:" title="Disable" class="btn btn-danger btn-xs" onclick="ChangeStatus(<%=fm.getFloor_id()%>,'FloorServlet','Inactive');">
                    		<i class="fa fa-ban"></i>
                    	</a>
                    	<%}else{ %>
                    	<a href="javascript:" title="Enable" class="btn btn-success btn-xs" onclick="ChangeStatus(<%=fm.getFloor_id()%>,'FloorServlet','Active');">
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