<%@page import="com.CyberVillage.Models.CommonModel"%>
<%@page import="com.CyberVillage.Services.CommonService"%>
<%@page import="com.CyberVillage.Models.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="includes/AdminHeader.jsp"></jsp:include>
<jsp:include page="includes/AdminMenu.jsp"></jsp:include>
<script src="plugins/jquery.js"></script>
<script src="plugins/jqBarGraph.js"></script>
<link rel="stylesheet" href="plugins/style.css">
 <% 
 LoginModel lm =(LoginModel)session.getAttribute("ADMIN_DATA");
 if(null == lm)
 	response.sendRedirect("AdminLogin.jsp"); %>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="AdminHome.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
	<%
		CommonService	cs	=	new CommonService();
		CommonModel		cm	=	cs.TotalStatistics();		
	%>
    <!-- Main content -->
    <section class="content">
		<!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner" style="text-align: center;">
              <h3><%=cm.getTotal_comp() %></h3>

              <p>Companies</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="Company.jsp" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner" style="text-align: center;">
              <h3><%= cm.getTotal_users() %></h3>

              <p>Users</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="Users.jsp" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-purple">
            <div class="inner" style="text-align: center;">
              <h3><%=cm.getTotal_vacancy() %></h3>

              <p>Job Offers</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="javascript:" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner" style="text-align: center;">
              <h3><%=cm.getPending_rent() %></h3>

              <p>Rent Dues</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="RentCollection.jsp" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      
       <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-navy">
            <div class="inner" style="text-align: center;">
              <h3><%=cm.getTotal_building() %></h3>

              <p>Building/Blocks</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="Building.jsp" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner" style="text-align: center;">
              <h3><%= cm.getTotal_floor() %></h3>

              <p>Floors</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="Floor.jsp" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-light-blue">
            <div class="inner" style="text-align: center;">
              <h3><%=cm.getTotal_room()%></h3>

              <p>Total Rooms</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="Room.jsp" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-maroon">
            <div class="inner" style="text-align: center;">
              <h3><%=cm.getOccupied_room() %></h3>

              <p>Occupied Rooms</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="Room.jsp" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
          </div>
          
        </div>
        <!-- ./col -->
      </div>
      
      <div class="row" style="margin-top:20px;">
      	<div id="barGraph" style="width: 100%"></div>
      
      </div>
      <!-- Your Page Content Here -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<script type="text/javascript">
arrayOfData = new Array(
	    [<%=cm.getTotal_comp()%>,'Company','#00C0EF'],
	    [<%=cm.getTotal_users()%>,'Users','#00A65A'],
	    [<%=cm.getTotal_vacancy()%>,'Job Offers','#605CA8'],
	    [<%=cm.getPending_rent()%>,'Rent Due','#DD4B39'],
	    [<%=cm.getTotal_building()%>,'Building','#001F3F'],
	    [<%=cm.getTotal_floor()%>,'Floor','#F39C12'],
	    [<%=cm.getTotal_room()%>,'Tot. Room','#3C8DBC'],
	    [<%=cm.getOccupied_room()%>,'Occu. Room','#D81B60']
	); 
	
$j('#barGraph').jqBarGraph({ data: arrayOfData , width:1000 }); 
</script>
<jsp:include page="includes/AdminFooter.jsp"></jsp:include>