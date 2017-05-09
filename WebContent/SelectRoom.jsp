<%@page import="com.CyberVillage.Models.FloorModel"%>
<%@page import="com.CyberVillage.Services.FloorService"%>
<%@page import="com.CyberVillage.Models.BuildingModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CyberVillage.Services.BuildingService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="Header.jsp"></jsp:include>
<%
	String cmp 			=	"";
	cmp					=	request.getParameter("cmp");
	if(null == cmp  || cmp.equals(""))
		response.sendRedirect("404.jsp");
%>
 <!-- Start Page Banner -->
    <div class="page-banner" style="padding:40px 0; background: url(images/slide-02-bg.jpg) center #f9f9f9;">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2>Select Room</h2>
            <p>We Are Professional</p>
          </div>
          <div class="col-md-6">
            <ul class="breadcrumbs">
              <li><a href="Home.jsp">Home</a></li>
              <li>Book a room</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- End Page Banner -->
<% 
   	 BuildingService bs=new BuildingService();
	 ArrayList<BuildingModel>arr=bs.selectAllBuilding();
	 
	 FloorService fs=new FloorService();
	 ArrayList<FloorModel>arr1=fs.selectAllFloor();
	
 %>
    <!-- Start Content -->
    <div id="content">
      <div class="container">
        <div class="page-content">
		<div class="row">

            <div class="col-md-10 col-md-offset-1">

              <!-- Classic Heading -->
              <h4 class="classic-title"><span>Select Room</span></h4>
				<form id="RselectFrm">
                    <div class="form-group">
                        <label for="">Select Building/Block</label>
                        <select class="form-control validate[required]" id="buil_id" name="buil_id">
	                    	<option value="">--select--</option>
	                      <% for(BuildingModel bm:arr) { if(bm.getStatus().equals("Active")){ %>
							<option value="<%=bm.getBuil_id()%>"><%=bm.getBuil_name()%></option>
						  <%}} %>
                    	</select>
                    </div>
                    <div class="form-group">
                        <label for="">Select Floor</label>
                        <select class="form-control validate[required] FlrC" id="floor" name="floor">
	                    	<option value="">--select--</option>
	                      <% for(FloorModel fm:arr1) { if(fm.getStatus().equals("Active")){ %>
							<option value="<%=fm.getFloor_id()%>" class="<%=fm.getBuil_id()%> fls"><%=fm.getFloor_name()%></option>
						  <%}} %>
                    	</select>
                    </div>
                    <div class="form-group">
                    	<label>Select Room</label>
                         <ul class="list-unstyled room-demo-ul clearfix pull-right">
                        	<li class="available">
                            	<a href="javascript:"><span class="">Available</span></a>
                            </li>
                            <li class="booked">
                            	<a href="javascript:"><span class="">Occupied</span></a>
                            </li>
                            <li class="notavailable">
                            	<a href="javascript:"><span class="">Not available</span></a>
                            </li>
                        </ul>
                        <div class="clearfix">
                        <ul class="list-unstyled room-ul clearfix" id="roomList">
                        	<li class='empty'>
                            	<a href='javascript:'><span class=''>No Rooms</span></a>
                            </li>
                        </ul>
                        </div>
                    </div>
                    <input type="hidden" id="cmpId" value="<%= cmp%>">
                    <input type="hidden" id="roomId">
                    <button type="submit" class="btn-system btn-large pull-right">Submit</button>
                </form>
              
        </div>
        </div>	  
      <!--  <div class="col-md-10 col-md-offset-1">    
	 
      </div> -->  
			 

         </div>
      </div>
 <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog" >
	<!-- Modal content-->
    <div class="modal-content" style="marin-top:200px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Message</h4>
      </div>
      <div class="modal-body">
	      <div class="alert alert-success fade " id="msSuccess" >
		    <!-- <a href="javascript:" class="close" data-dismiss="alert" aria-label="close">&times;</a> -->
		    <strong>Success.!</strong> &nbsp;  &nbsp;  &nbsp; Room succesfully selected .!<br>
		    Please wait till the admin approve you. We will inform you via mail once the approval completed.
		  </div>
		 <div class="alert alert-danger fade " id = "msError">
		   <!--  <a href="javascript:" class="close" data-dismiss="alert" aria-label="close">&times;</a> -->
		    <strong>Failed.!</strong>  &nbsp;  &nbsp; &nbsp;Something went wrong , Please try again.!
		  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default close" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
      
    </div>
    
    <!-- Modal -->

 <style>
 .modal-content{margin-top: 200px;}
 </style>
 <script type="text/javascript">
 $('#Smenu').addClass('active');
</script>
    <!-- End content -->
<jsp:include page="Footer.jsp"></jsp:include>