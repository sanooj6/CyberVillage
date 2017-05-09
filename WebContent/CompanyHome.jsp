<%@page import="com.CyberVillage.Models.CommonModel"%>
<%@page import="com.CyberVillage.Services.CommonService"%>
<%@page import="com.CyberVillage.Models.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="includes/CompanyHeader.jsp"></jsp:include>
<jsp:include page="includes/CompanyMenu.jsp"></jsp:include>
<script src="plugins/jquery.js"></script>
<script src="plugins/jqBarGraph.js"></script>
<link rel="stylesheet" href="plugins/style.css">
 <% 
 LoginModel lm =(LoginModel)session.getAttribute("COMPANY_DATA");
 int cmp_id		=	0;
 if(null == lm)
 	response.sendRedirect("AdminLogin.jsp"); 
 else
	 cmp_id     = lm.getUid();
 %>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
   <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="CompanyHome.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
	<%
		CommonService	cs	=	new CommonService();
		CommonModel		cm	=	cs.CompanyStatistics(cmp_id);		
	%>
    <!-- Main content -->
    <section class="content">
		<!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner" style="text-align: center;">
              <h3><%=cm.getTotal_vacancy() %></h3>

              <p>Total Vacancies</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="Vacancy.jsp" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner" style="text-align: center;">
              <h3><%= cm.getTotal_application() %></h3>

              <p>Job Application</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="Applications.jsp" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner" style="text-align: center;">
              <h3><%=cm.getPending_application() %></h3>

              <p>Pending Application</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="Applications.jsp" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner" style="text-align: center;">
              <h3><%=cm.getInvited_application() %></h3>

              <p>Invited Applications</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="Applications.jsp" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
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
	    [<%=cm.getTotal_vacancy()%>,'Job Offers','#00C0EF'],
	    [<%=cm.getTotal_application()%>,'Applications','#00A65A'],
	    [<%=cm.getPending_application()%>,'Pendind','#F39C12'],
	    [<%=cm.getInvited_application()%>,'Invited','#DD4B39']
	); 
	
$j('#barGraph').jqBarGraph({ data: arrayOfData , width:800 }); 
</script>

<jsp:include page="includes/AdminFooter.jsp"></jsp:include>