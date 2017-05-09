<%@page import="com.google.gson.Gson"%>
<%@page import="com.CyberVillage.Models.RoomModel"%>
<%@page import="com.CyberVillage.Services.RoomService"%>
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
	 
	 FloorService fs=new FloorService();
	 ArrayList<FloorModel>arr1=fs.selectAllFloor();
	
 %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper"> 
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Rooms <small>Information about floors in Rooms</small> </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Rooms</li>
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
            <form class="form-horizontal" id="RoomForm">
              <div class="box-body">
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Room</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control validate[required, minSize[3]]" id="room" name="room" placeholder="Room Name">
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Building/Block</label>
                  <div class="col-sm-10">
                    <select class="form-control validate[required]" id="buil_id" name="buil_id">
                    	<option value="">--select--</option>
                      <% for(BuildingModel bm:arr) { if(bm.getStatus().equals("Active")){ %>
						<option value="<%=bm.getBuil_id()%>"><%=bm.getBuil_name()%></option>
					  <%}} %>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Floor</label>
                  <div class="col-sm-10">
                    <select class="form-control validate[required]" id="floor" name="floor">
                    	<option value="">--select--</option>
                      <% for(FloorModel fm:arr1) { if(fm.getStatus().equals("Active")){ %>
						<option value="<%=fm.getFloor_id()%>" class="<%=fm.getBuil_id()%> fls"><%=fm.getFloor_name()%></option>
					  <%}} %>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Door Number</label>
                  <div class="col-sm-10">
                   <input type="text" class="form-control validate[required]" id="door_num" name="door_num" placeholder="Door Number">
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Squirefeet</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control validate[required, custom[number]]" id="s_feet" name="s_feet" placeholder="Squirefeet">
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
    	RoomService 	rs 			=	new RoomService();
        ArrayList<RoomModel> arm	=	rs.SelectAllRooms();
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
            <span class="flag pull-right"><label id="occupied" class="label  bg-green">&nbsp;</label>Occupied Rooms</span>
              <table id="RoomTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Room</th>
                    <th>Door Num.</th>
                    <th>Floor</th>
                    <th>Building</th>
                    <th>Square feet</th>
                    <th>Rent(Rs)</th>
                    <th>Occupied By</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                <% 
               for(RoomModel rm:arm){
                	String oc_name = rm.getOccupied_name();
                	if(oc_name == null)
                		rm.setOccupied_name("-------");
                	int oc		  =	rm.getOccupied();
                	String oClass = (oc !=0)?"occupied":"";
                %>
                  <tr class="<%= oClass %>">
                      <td><%=rm.getRoom_id()%></td>
                      <td><%=rm.getR_name()%></td>
                      <td><%=rm.getDoor_num()%></td>
				      <td><%=rm.getFloor_name() %></td>
				      <td><%=rm.getBuil_name() %></td>
				      <td><%=rm.getS_feet() %></td>
				      <td><%=rm.getRent() %></td>
				      <td><%=rm.getOccupied_name() %></td>
				      <td><%=rm.getStatus() %></td>
				      
                    <td> 
                    	<a class="btn btn-default btn-xs" href="javascript:" title="Edit" onclick="EditRoom(<%=rm.getRoom_id()%>);"> <!-- data-toggle="collapse" data-target="#addClient" -->
                    		<i class="fa fa-pencil-square-o"></i>
                    	</a> 
                    	<a href="javascript:" title="Delete" class="btn btn-default btn-xs" onclick="Delete(<%=rm.getRoom_id()%>,'RoomServlet');">
                    		<i class="fa fa-trash-o"></i>
                    	</a> 
                    	<% if(rm.getStatus().equals("Active")){ %>
                    	<a href="javascript:" title="Disable" class="btn btn-danger btn-xs" onclick="ChangeStatus(<%=rm.getRoom_id()%>,'RoomServlet','Inactive');">
                    		<i class="fa fa-ban"></i>
                    	</a>
                    	<%}else{ %>
                    	<a href="javascript:" title="Enable" class="btn  btn-info btn-xs" onclick="ChangeStatus(<%=rm.getRoom_id()%>,'RoomServlet','Active');">
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
  <style>
  .fls{display: none;}
  #occupied{height: 20px; width: 20px;margin-right:10px;}
  .occupied{background-color: #00A65A !important;}
  </style>
  <!-- /.content-wrapper -->
 <jsp:include page="includes/AdminFooter.jsp"></jsp:include>