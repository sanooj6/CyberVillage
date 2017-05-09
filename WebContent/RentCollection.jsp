<%@page import="com.CyberVillage.Models.RentModel"%>
<%@page import="java.util.ArrayList"%>
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
        Rent Collections
        <small>Rent</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Rent Collection</li>
      </ol>
    </section>
<%
	CommonService 			n_s		=	new CommonService();
	ArrayList<RentModel> 	stat	=	n_s.RentStatistics();
%>
    <!-- Main content -->
    <section class="content">
    <div class="row">
    	<div id="barGraph" style="width:100%; margin-top: 20px; margin-bottom: 20px; margin-left: 100px;"></div>
    </div>
 	<%
	if(null == lm)
		System.out.print("Please Login ..!");
	 	//response.sendRedirect("../AdminLogin.jsp");
	 else{
		 	
			ArrayList<RentModel>	r_ar 	=	n_s.PendingRent();
			int not_count 					=	r_ar.size();
		%>
      <div class="row">
      <section class="content-header" style="margin-bottom: 20px;">
      <h1>Rent Pendings</h1>
	</section>
      <%for(RentModel rrm:r_ar) {
    	  
		  long Days =   rrm.getDays();
    	  //System.out.println("Today : "+date+" Due : "+due+" Diff : "+diff+ " Days : "+Days); //2014/08/06 15:59:48
     	  String Bg	= 	"bg-green";
    	  String pr	=	Days*(3.2)+"%";
    	  String RemainText = Days+" Days remaining till due date";
    	  String mrg		=	"150px";
    	  if(Days < 0){
    		  pr	=	"0%";
    		  Bg	= 	"bg-red";
    		  RemainText = "Overdue..! ";
    		  mrg 		 =	"0px";
    	  }
    	  else if(Days < 5 )
    		  Bg	= 	"bg-yellow";
    	  else if(Days < 15)
    	  	  Bg	= 	"bg-aqua";
    	  
    	  
    		  
    	  %>
        <div class="ccol-lg-3 col-xs-4">
          <div class="info-box <%= Bg%>">
            <span class="info-box-icon"><i class="fa fa-calendar"></i></span>

            <div class="info-box-content">
            <span class="info-box-text"><b><%=rrm.getComp_name() %></b></span>
              <span class="info-box-text" style="font-size: 12px; font-weight: bold;">Due Date : <%=rrm.getDue_date() %> (YY-MM-DD)</span>
              <span class="info-box-number"><i class="fa fa-rupee"></i><%=" "+rrm.getAmount() %></span>

              <div class="progress">
                <div class="progress-bar" style="width: <%= pr%>"></div>
              </div>
                  <span class="progress-description">
                    <%= RemainText%> 
                     
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <% } if(r_ar.size() == 0){ %>
        	<div class="col-md-8 col-sm-6 col-xs-12">
          <div class="info-box bg-green">
            <span class="info-box-icon"><i class="fa fa-thumbs-o-up"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Hello...!</span>
              <span class="info-box-number">Relax</span>

              <span class="progress-description">
               There is no rent pendings..
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
      <%  }
      }%>
     
        <!-- /.col -->
      </div>
      <!-- /.row -->
    <!-- /.row -->
</section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <script type="text/javascript">
arrayOfData = new Array(
		<%
		int a	=	1;
		for(RentModel rnt:stat){%>
	    [<%=rnt.getAmount()%>,'<%=rnt.getB_name()%>','#001F3F']
	   <%
	   if(stat.size() != a){%>
	   ,
	   <% }
	    a++;
		}%>
	); 
var wid = <%= stat.size()*100%>
$j('#barGraph').jqBarGraph({ data: arrayOfData , width:wid }); 
</script>
 <jsp:include page="includes/AdminFooter.jsp"></jsp:include>