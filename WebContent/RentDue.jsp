<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.CyberVillage.Models.RentModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CyberVillage.Services.RentService"%>
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
 <style>
 .form-horizontal .control-label {text-align: left;}
 </style>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Your Pending Rent Payments
        <small>Rent</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Rent Due</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- =========================================================== -->
	<%
	if(null == lm)
		System.out.print("Please Login ..!");
	 	//response.sendRedirect("../AdminLogin.jsp");
	 else{
			RentService 			n_s		=	new RentService();
			ArrayList<RentModel>	r_ar 	=	n_s.SelectMyDue(lm.getUid());
			int not_count 					=	r_ar.size();
		%>
      <div class="row">
      <%for(RentModel rrm:r_ar) {
    	  Date date = 	new Date();
    	  Date due 	= 	rrm.getDue_date();
    	  long diff	=	due.getTime() - date.getTime();
		  long Days =   diff / (24 * 60 * 60 * 1000);
    	  //System.out.println("Today : "+date+" Due : "+due+" Diff : "+diff+ " Days : "+Days); //2014/08/06 15:59:48
     	  String Bg	= 	"bg-green";
    	  String pr	=	Days*(3.2)+"%";
    	  String RemainText = Days+" Days remaining till due date";
    	  String mrg		=	"150px";
    	  if(Days < 0){
    		  pr	=	"0%";
    		  Bg	= 	"bg-red";
    		  RemainText = "Overdue..! PayNow to avoid further legal actions";
    		  mrg 		 =	"0px";
    	  }
    	  else if(Days < 5 )
    		  Bg	= 	"bg-yellow";
    	  else if(Days < 15)
    	  	  Bg	= 	"bg-aqua";
    	  
    	  
    		  
    	  %>
        <div class="ccol-lg-3 col-xs-6">
          <div class="info-box <%= Bg%>">
            <span class="info-box-icon"><i class="fa fa-calendar"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Rent Due Date : <%=rrm.getDue_date() %> (YYYY-MM-DD)</span>
              <span class="info-box-number"><i class="fa fa-rupee"></i><%=" "+rrm.getAmount() %></span>

              <div class="progress">
                <div class="progress-bar" style="width: <%= pr%>"></div>
              </div>
                  <span class="progress-description">
                    <%= RemainText%> 
                    <button class="btn  bg-navy btn-xs payNow" type="button" style="margin-left:<%= mrg%>;" rn_id="<%= rrm.getRent_id()%>" amt="<%= rrm.getAmount()%>" data-toggle="modal" data-target="#PayModal">Pay Now</button> 
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
              <span class="info-box-text">Looks Good...!</span>
              <span class="info-box-number">Relax</span>

              <span class="progress-description">
                You have no pending rent payments.
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

      <!-- =========================================================== -->
<div id="PayModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Pay The Rent Here</h4>
      </div>
      <div class="modal-body">
          <div class="panel panel-default credit-card-box">
                <div class="panel-heading display-table" >
                    <div class="row display-tr" >
                        <h3 class="panel-title display-td" >Payment Details</h3>
                        <div class="display-td" >                            
                            <img class="img-responsive pull-right" src="images/pay.png">
                        </div>
                    </div>                    
                </div>
                <div class="panel-body">
                    <form role="form" id="PayForm" >
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="cardNumber">CARD NUMBER</label>
                                    <div class="input-group">
                                        <input 
                                            type="tel"
                                            class="form-control validate[required,creditCard]"
                                            name="cardNumber"
                                            placeholder="Valid Card Number"
                                            autocomplete="cc-number"
                                             autofocus 
                                        />
                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                    </div>
                                </div>                            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
                                    <input 
                                        type="tel" 
                                        class="form-control validate[required]" 
                                        name="cardExpiry"
                                        placeholder="MM / YY"
                                        autocomplete="cc-exp"
                                         
                                    />
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label for="cardCVC">CV CODE</label>
                                    <input 
                                        type="tel" 
                                        class="form-control validate[required,custom[integer],minSize[3],maxSize[3]] "
                                        name="cardCVC"
                                        placeholder="CVC"
                                        autocomplete="cc-csc"
                                        
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="couponCode">Amount</label>
                                    <input type="text" class="form-control" name="amount" id="amount" readonly="readonly"/>
                                </div>
                            </div>                        
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <button class="subscribe btn btn-success btn-lg btn-block" type="submit">Pay Now</button>
                            </div>
                        </div>
                        <div class="row" style="display:none;">
                            <div class="col-xs-12">
                                <p class="payment-errors"></p>
                            </div>
                        </div>
                        <input type="hidden" id="rent_id">
                    </form>
                </div>
            </div> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
      
      <!-- /.row -->
</section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <style>
/* Padding - just for asthetics on Bootsnipp.com */

/* CSS for Credit Card Payment form */
.credit-card-box .panel-title {
    display: inline;
    font-weight: bold;
}
.credit-card-box .form-control.error {
    border-color: red;
    outline: 0;
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(255,0,0,0.6);
}
.credit-card-box label.error {
  font-weight: bold;
  color: red;
  padding: 2px 8px;
  margin-top: 2px;
}
.credit-card-box .payment-errors {
  font-weight: bold;
  color: red;
  padding: 2px 8px;
  margin-top: 2px;
}
.credit-card-box label {
    display: block;
}
/* The old "center div vertically" hack */
.credit-card-box .display-table {
    display: table;
    width: 100%;
}
.credit-card-box .display-tr {
    display: table-row;
}
.credit-card-box .display-td {
    display: table-cell;
    vertical-align: middle;
    width: 50%;
}
/* Just looks nicer */
.credit-card-box .panel-heading img {
    min-width: 180px;
}
</style>
  <jsp:include page="includes/AdminFooter.jsp"></jsp:include>